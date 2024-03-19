import 'package:demo_project/common/common_textstyle.dart';
import 'package:demo_project/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget commonTextField({
  String? title,
  String? subtitle,
  String? Function(String?)? validator,
  TextEditingController? controller,
  bool visibility = false,
  bool visibilityShow = false,
  Function()? onTap,
  List<TextInputFormatter>? formter,
}) {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
        child: TextFormField(
          style: AppTextStyle.styleW400.copyWith(fontSize: 15),
          controller: controller,
          validator: validator,
          obscureText: visibility,
          inputFormatters: formter,
          obscuringCharacter: "*",
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(12),
            hintText: title ?? "",
            hintStyle: AppTextStyle.styleW400,
            labelText: title ?? "",
            labelStyle: AppTextStyle.styleW400,
            suffixIcon: (visibilityShow)
                ? GestureDetector(
                    onTap: onTap,
                    child: (visibility)
                        ? Icon(Icons.visibility_off, color: AppColors.kGrey700)
                        : Icon(Icons.visibility, color: AppColors.kGrey700),
                  )
                : const SizedBox(),
            border: OutlineInputBorder(
              // borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    ],
  );
}
