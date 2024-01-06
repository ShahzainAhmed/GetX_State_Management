// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

// this is ViewModel -> Always keep Views and ViewModels in seperate files, just like this one
class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  RxBool loading = false.obs;

  void loginApi() async {
    loading.value = true;
    try {
      final response = await post(
        Uri.parse("https://reqres.in/api/login"),
        body: {
          "email": emailController.value.text,
          "password": passwordController.value.text,
        },
      );

      var data = jsonDecode(response.body);
      print(response.statusCode);
      print(data);
      if (response.statusCode == 200) {
        loading.value = false;
        Get.snackbar(
          "Login Success",
          'Congratulations',
          colorText: Colors.green,
        );
      } else {
        loading.value = false;

        Get.snackbar("Login Failed", data['error']);
      }
    } catch (e) {
      loading.value = false;

      Get.snackbar("Exception", e.toString());
    }
  }
}
