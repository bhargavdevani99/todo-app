// To parse this JSON data, do
//
//     final todoTaskModel = todoTaskModelFromJson(jsonString);

import 'dart:convert';

List<TodoTaskModel> todoTaskModelFromJson(String str) =>
    List<TodoTaskModel>.from(
        json.decode(str).map((x) => TodoTaskModel.fromJson(x)));

String todoTaskModelToJson(List<TodoTaskModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TodoTaskModel {
  int? id;
  String? description;
  bool? status;
  String? userId;
  DateTime? createdAt;
  DateTime? updatedAt;

  TodoTaskModel({
    this.id,
    this.description,
    this.status,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory TodoTaskModel.fromJson(Map<String, dynamic> json) => TodoTaskModel(
        id: json["id"],
        description: json["description"],
        status: json["status"],
        userId: json["user_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "status": status,
        "user_id": userId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
