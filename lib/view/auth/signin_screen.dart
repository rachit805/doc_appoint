import 'package:Doctor/controller/sign_in_controller.dart';
import 'package:Doctor/utils/constant.dart';
import 'package:Doctor/widgets/c_text.dart';
import 'package:Doctor/widgets/cbutton.dart';
import 'package:Doctor/widgets/ctextformfield.dart';
import 'package:Doctor/widgets/ctextformpass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final SigninController controller = Get.put(SigninController());
  @override
  Widget build(BuildContext context) {
    double sH = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 5.5),
            Center(
              child: Image.asset(
                "${imagepath}app_logo.png",
                height: 100,
                width: 100,
              ),
            ),
            SizedBox(height: sH / 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: CTextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: controller.emailController,
                labelText: "Email",
                hintText: "Enter Email",
              ),
            ),
            const SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: CTextFormPass(
                controller: controller.passController,
                hintText: 'Enter Password',
                labelText: 'Password',
                obscureText: true,
              ),
            ),
            SizedBox(height: sH / 3.8),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: CButton(
                          onTap: () {
                            controller.signinUser();
                          },
                          text: "Sign in")),
                  const SizedBox(height: 10),
                  GestureDetector(
                      onTap: () {},
                      child: const CText(text: "Forget Password?")),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
