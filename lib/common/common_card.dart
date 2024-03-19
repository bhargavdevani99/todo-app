import 'dart:convert';
import 'dart:developer';

import 'package:demo_project/common/common_dialog.dart';
import 'package:demo_project/common/common_textstyle.dart';
import 'package:demo_project/utils/app_color.dart';
import 'package:demo_project/view/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

commonCard({required data}) {
  bool openTile = false;
  log("data   ==== ${data.id}");

  HomeController homeController = Get.find<HomeController>();

  return StatefulBuilder(
    builder: (context, setState) {
      return Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                Get.dialog(
                  commonConformationDialog(
                      onTap: () {
                        homeController.taskDelete(data.id).then((value) {
                          homeController.isLoading.value = true;
                          homeController.taskGet();
                        });
                      },
                      discription: "Are you want to sure delete task?"),
                );
              },
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.kWhite,
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
          child: Theme(
            data: ThemeData(
              dividerColor: Colors.transparent,
              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.kPrimary),
            ),
            child: ExpansionTile(
              onExpansionChanged: (value) {
                setState(() {
                  openTile = value;
                });
              },
              title: Row(
                children: [
                  data.status.toString() == "true"
                      ? const Icon(
                          Icons.check_circle_outline,
                          color: AppColors.kPrimary,
                        )
                      : GestureDetector(
                          onTap: () {
                            homeController.titleController.text =
                                jsonDecode(data.description)['title']
                                    .toString();
                            homeController.descriptionController.text =
                                jsonDecode(data.description)['description']
                                    .toString();
                            Get.dialog(
                              commonConformationDialog(
                                  onTap: () {
                                    homeController
                                        .taskUpdate(data.id, "true")
                                        .then((value) {
                                      homeController.isLoading.value = true;
                                      homeController.taskGet();
                                    });
                                  },
                                  discription:
                                      "Are you want to sure conform task ?"),
                            );
                          },
                          child: const Icon(Icons.circle_outlined),
                        ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          maxLines: (openTile == false) ? 1 : 2,
                          overflow: (openTile == false)
                              ? TextOverflow.ellipsis
                              : null,
                          "${jsonDecode(data.description)['title']}",
                          style: AppTextStyle.styleW400.copyWith(
                              fontSize: 17,
                              color: data.status.toString() == "true"
                                  ? AppColors.kGrey700
                                  : null),
                        ),
                        (openTile == false)
                            ? Text(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                "${jsonDecode(data.description)['description']}",
                                style: AppTextStyle.styleW300.copyWith(
                                    fontSize: 15, color: AppColors.kGrey700),
                              )
                            : const SizedBox()
                      ],
                    ),
                  ),
                ],
              ),
              childrenPadding:
                  const EdgeInsets.only(left: 15, right: 15, bottom: 15),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${jsonDecode(data.description)['description']}",
                          textAlign: TextAlign.start,
                          style: AppTextStyle.styleW400.copyWith(
                              fontSize: 15, color: AppColors.kGrey700),
                        ),
                      ),
                    ),
                    data.status.toString() == "true"
                        ? const SizedBox()
                        : IconButton(
                            onPressed: () {
                              homeController.titleController.text =
                                  jsonDecode(data.description)['title']
                                      .toString();
                              homeController.descriptionController.text =
                                  jsonDecode(data.description)['description']
                                      .toString();

                              Get.dialog(
                                commonDialog(
                                  onTap: () {
                                    homeController
                                        .taskUpdate(data.id, "false")
                                        .then((value) {
                                      homeController.isLoading.value = true;
                                      homeController.taskGet();
                                    });
                                  },
                                  isUpdate: true,
                                  descriptionController:
                                      homeController.descriptionController,
                                  titleController:
                                      homeController.titleController,
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: AppColors.kPrimary,
                            ),
                          ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
