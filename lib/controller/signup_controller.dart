import 'package:Doctor/Helpers/auth_helper.dart';
import 'package:Doctor/services/api_constants.dart';
import 'package:Doctor/view/auth/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  Future<void> signupUser() async {
    final email = emailController.text.trim();
    final password = passController.text.trim();
    final name = nameController.text.trim();
    final phone = phoneController.text.trim();

    if (email.isEmpty || password.isEmpty || name.isEmpty || phone.isEmpty) {
      Get.snackbar(
        "Error",
        "Please fill all the fields",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
      return;
    }

    final requestBody = {
      'username': email,
      'password': password,
    };

    try {
      final response =
          await AuthHelper.post(ApiConstants.signupendpoint, requestBody);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar("Registration Sucessful", "User registered");
        Get.to(SignInScreen());
      } else if (response.statusCode == 400) {
        Get.snackbar("Registration Fail", "User already registered");
        Get.to(SignInScreen());
      } else {}
    } catch (e) {
      // Handle exception
    }
  }
}
