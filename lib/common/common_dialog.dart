import 'package:demo_project/common/commom_textfield.dart';
import 'package:demo_project/common/common_textstyle.dart';
import 'package:demo_project/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget commonDialog({
  required Function()? onTap,
  required TextEditingController titleController,
  required TextEditingController descriptionController,
  bool isUpdate = false,
}) {
  return Dialog(
    child: Container(
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: 50,
              width: Get.width,
              decoration: BoxDecoration(
                color: AppColors.kPrimary,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text(
                (isUpdate) ? "Update" : "Add",
                style: AppTextStyle.styleW500.copyWith(
                  fontSize: 17,
                  color: AppColors.kWhite,
                ),
              ),
            ),
            commonTextField(title: "Title", controller: titleController),
            commonTextField(
                title: "Description", controller: descriptionController),
            Container(
              margin: const EdgeInsets.only(
                  top: 20, left: 15, right: 15, bottom: 15),
              width: Get.width,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 40,
                      width: Get.width / 3.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.kPrimary,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Cancel",
                        style: AppTextStyle.styleW500.copyWith(
                          fontSize: 17,
                          color: AppColors.kPrimary,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (onTap != null) {
                        onTap();
                      }
                    },
                    child: Container(
                      height: 40,
                      width: Get.width / 3.1,
                      decoration: BoxDecoration(
                        color: AppColors.kPrimary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        (isUpdate) ? "Update" : "Save",
                        style: AppTextStyle.styleW500.copyWith(
                          fontSize: 17,
                          color: AppColors.kWhite,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget commonConformationDialog({
  required Function()? onTap,
  required discription,
}) {
  return Dialog(
    child: Container(
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: Text(
                discription,
                style: AppTextStyle.styleW400
                    .copyWith(fontSize: 17, color: AppColors.kGrey700),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: 20, left: 15, right: 15, bottom: 15),
              width: Get.width,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 40,
                      width: Get.width / 3.1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColors.kPrimary,
                        ),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Cancel",
                        style: AppTextStyle.styleW500.copyWith(
                          fontSize: 17,
                          color: AppColors.kPrimary,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (onTap != null) {
                        onTap();
                      }
                    },
                    child: Container(
                      height: 40,
                      width: Get.width / 3.1,
                      decoration: BoxDecoration(
                        color: AppColors.kPrimary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Yes",
                        style: AppTextStyle.styleW500.copyWith(
                          fontSize: 17,
                          color: AppColors.kWhite,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
