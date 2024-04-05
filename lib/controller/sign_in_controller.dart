// ignore_for_file: avoid_print

import 'package:Doctor/Helpers/auth_helper.dart';
import 'package:Doctor/Helpers/local_storage_helper.dart';
import 'package:Doctor/services/api_constants.dart';
import 'package:Doctor/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SigninController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  var isLoading = false.obs;
  final box = GetStorage();
  final authhelper = AuthHelper();

  Future<void> signinUser() async {
    final email = emailController.text.trim();
    final password = passController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Error",
        "Please enter both email and password",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
      return;
    }

    isLoading.value = true;

    final requestBody = {
      'username': email,
      'password': password,
    };

    try {
      final response =
          await AuthHelper.post(ApiConstants.signinendpoint, requestBody);
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.statusCode);
        Get.snackbar(
          "Success",
          "Sucessfully Login!",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.greenAccent,
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
        );
        LocalStorageHelper.saveEmail(email);
        LocalStorageHelper.saveLoginStatus(true);
        Get.offAll(HomePage());
      } else {
        print('Signin failed with status code: ${response.statusCode}');
        Get.snackbar(
          "Login Failed",
          "Incorrect username or password",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
        );
      }
    } catch (e) {
      print('Exception during signin: $e');
      Get.snackbar(
        "Error",
        "An error occurred. Please try again later.",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
