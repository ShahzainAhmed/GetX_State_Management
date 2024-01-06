import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_learning/controllers/switch_controller.dart';
import 'package:getx_learning/data/constants/app_colors.dart';
import 'package:getx_learning/data/constants/app_typography.dart';

class SwitchScreenExample extends StatefulWidget {
  const SwitchScreenExample({super.key});

  @override
  State<SwitchScreenExample> createState() => _SwitchScreenExampleState();
}

class _SwitchScreenExampleState extends State<SwitchScreenExample> {
  SwitchController switchController = Get.put(SwitchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "GetX Switch",
          style: AppTypography.kBold16.copyWith(color: AppColors.kWhiteColor),
        ),
        backgroundColor: AppColors.kGreyColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 20.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Notifications", style: AppTypography.kBold16),
                Obx(() => CupertinoSwitch(
                      value: switchController.isSwitched.value,
                      onChanged: (value) {
                        switchController.isSwitched.value = value;
                      },
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
