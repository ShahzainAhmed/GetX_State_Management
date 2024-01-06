import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_learning/controllers/slider_controller.dart';
import 'package:getx_learning/data/constants/app_colors.dart';
import 'package:getx_learning/data/constants/app_typography.dart';

class HomeScreenTwo extends StatefulWidget {
  const HomeScreenTwo({super.key});

  @override
  State<HomeScreenTwo> createState() => _HomeScreenTwoState();
}

class _HomeScreenTwoState extends State<HomeScreenTwo> {
  // injected the dependency to GetX by Get.put()
  SliderController sliderController = Get.put(SliderController());

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GetX Tutorial',
          style: AppTypography.kBold16.copyWith(color: AppColors.kWhiteColor),
        ),
        backgroundColor: AppColors.kGreyColor,
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 50.h),
          // Obx is a reactive widget
          Obx(() => Container(
                height: 200.h,
                width: 200.w,
                color: AppColors.kRedColor
                    .withOpacity(sliderController.opacity.value),
              )),
          SizedBox(height: 50.h),
          Obx(() => Slider(
                value: sliderController.opacity.value,
                onChanged: (value) {
                  sliderController.setOpacity(value);
                },
              ))
        ],
      ),
    );
  }
}
