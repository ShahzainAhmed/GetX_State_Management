import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_learning/controllers/login_controller.dart';
import 'package:getx_learning/data/constants/app_colors.dart';
import 'package:getx_learning/data/constants/app_typography.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login Screen',
          style: AppTypography.kBold16.copyWith(color: AppColors.kWhiteColor),
        ),
        backgroundColor: AppColors.kGreyColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: loginController.emailController.value,
              decoration: InputDecoration(
                hintText: 'Enter your email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            TextFormField(
              controller: loginController.passwordController.value,
              decoration: InputDecoration(
                hintText: 'Enter your password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Obx(
              () => InkWell(
                onTap: () => loginController.loginApi(),
                child: loginController.loading.value
                    ? const CircularProgressIndicator()
                    : Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: AppColors.kGreyColor,
                        ),
                        height: 40.h,
                        child: Center(
                          child: Text(
                            "Login",
                            style: AppTypography.kBold14
                                .copyWith(color: AppColors.kWhiteColor),
                          ),
                        ),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}