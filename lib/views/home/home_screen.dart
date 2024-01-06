import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_learning/controllers/counter_controller.dart';
import 'package:getx_learning/data/constants/app_colors.dart';
import 'package:getx_learning/data/constants/app_typography.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kGreyColor,
        title: Text("GetX",
            style:
                AppTypography.kBold18.copyWith(color: AppColors.kWhiteColor)),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            child: ListTile(
              title: Text(
                "GetX Dialog Alert",
                style: AppTypography.kBold14,
              ),
              onTap: () {
                Get.defaultDialog(
                  radius: 15.r,
                  contentPadding: const EdgeInsets.all(10),
                  confirm: TextButton(
                      onPressed: () => Get.back(),
                      child: Text("Yes", style: AppTypography.kBold14)),
                  cancel: TextButton(
                      onPressed: () => Get.back(),
                      child: Text(
                        "No",
                        style: AppTypography.kBold14,
                      )),
                  titlePadding: const EdgeInsets.all(20),
                  title: "Do you wish to continue?",
                  titleStyle: AppTypography.kBold14,
                  content: Column(
                    children: [
                      Text(
                        "This is a GetX Dialog",
                        style: AppTypography.kBold12,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            child: ListTile(
              title: Text(
                "Change Theme?",
                style: AppTypography.kBold14,
              ),
              onTap: () {
                Get.bottomSheet(
                  Container(
                    height: 300.h,
                    color: Colors.grey[100],
                    child: Center(
                      child: Column(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.light_mode),
                            title: Text(
                              "Light Theme",
                              style: AppTypography.kMedium12,
                            ),
                            onTap: () {
                              Get.changeTheme(ThemeData.light());
                              Get.back();
                            },
                          ),
                          ListTile(
                            leading: const Icon(Icons.dark_mode),
                            title: Text("Dark Theme",
                                style: AppTypography.kMedium12),
                            onTap: () {
                              Get.changeTheme(ThemeData.dark());
                              Get.back();
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            "message".tr,
            style: AppTypography.kBold18,
          ),
          Text(
            "name".tr,
            style: AppTypography.kBold18.copyWith(color: AppColors.kRedColor),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                onPressed: () => Get.updateLocale(const Locale('en', 'US')),
                child: const Text("English"),
              ),
              SizedBox(width: 10.w),
              OutlinedButton(
                onPressed: () => Get.updateLocale(const Locale('ur', 'PK')),
                child: const Text("Urdu"),
              ),
            ],
          ),
          SizedBox(height: 40.h),
          Obx(() {
            return Text(
              controller.counter.value.toString(),
              style: AppTypography.kBold24,
            );
          }),
          SizedBox(height: 40.h),
          FloatingActionButton(
            backgroundColor: AppColors.kGreyColor,
            onPressed: () => controller.incremetCounter(),
            child: const Icon(
              Icons.add,
              color: AppColors.kWhiteColor,
            ),
          )
        ],
      ),
    );
  }
}
