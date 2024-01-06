import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_learning/controllers/image_picker_controller.dart';
import 'package:getx_learning/data/constants/app_colors.dart';
import 'package:getx_learning/data/constants/app_typography.dart';

class ImagePickerExample extends StatefulWidget {
  const ImagePickerExample({super.key});

  @override
  State<ImagePickerExample> createState() => _ImagePickerExampleState();
}

class _ImagePickerExampleState extends State<ImagePickerExample> {
  ImagePickerController imagePickerController =
      Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "GetX Image Picker",
          style: AppTypography.kBold16.copyWith(color: AppColors.kWhiteColor),
        ),
        backgroundColor: AppColors.kGreyColor,
        centerTitle: true,
      ),
      body: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 30.r,
                backgroundImage: imagePickerController.imagePath.isNotEmpty
                    ? FileImage(
                        File(imagePickerController.imagePath.toString()),
                      )
                    : null,
              ),
            ),
            TextButton(
              onPressed: () {
                imagePickerController.getImage();
              },
              child: Text("Pick Image", style: AppTypography.kBold16),
            ),
          ],
        ),
      ),
    );
  }
}
