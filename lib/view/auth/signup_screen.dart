import 'package:Doctor/controller/signup_controller.dart';
import 'package:Doctor/utils/constant.dart';
import 'package:Doctor/view/auth/signin_screen.dart';
import 'package:Doctor/widgets/c_text.dart';
import 'package:Doctor/widgets/cbutton.dart';
import 'package:Doctor/widgets/ctextformfield.dart';
import 'package:Doctor/widgets/ctextformpass.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final SignupController controller = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 12),
            Center(
              child: Image.asset(
                "${imagepath}app_logo.png",
                height: 100,
                width: 100,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: CTextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: controller.emailController,
                labelText: "Email",
                hintText: "Enter Email",
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: CTextFormField(
                controller: controller.nameController,
                labelText: "Name",
                hintText: "Enter your Name",
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: CTextFormField(
                keyboardType: TextInputType.phone,
                controller: controller.phoneController,
                labelText: "Mobile Number",
                hintText: "Enter your Mobile Number",
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: CTextFormPass(
                controller: controller.passController,
                hintText: 'Enter Password',
                labelText: 'Password',
                obscureText: true,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: CButton(
                onTap: () {
                  controller.signupUser();
                },
                text: "Create Account",
              ),
            ),
            const SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                Get.to(SignInScreen());
              },
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(227, 227, 229, 1),
                    fontFamily: "Roboto",
                  ),
                  children: [
                    TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: "Sign in",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 28),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      // width: MediaQuery.of(context).size.width / 3.2,
                      child: Divider(),
                    ),
                  ),
                  CText(text: "Or Sign up with"),
                  Expanded(
                    child: SizedBox(
                      // width: MediaQuery.of(context).size.width / 3.2,
                      child: Divider(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 45,
                    width: 45,
                    child: IconButton(
                        onPressed: () {},
                        icon: Image.asset("assets/icons/ic_apple.png")),
                  ),
                  SizedBox(
                    height: 45,
                    width: 45,
                    child: IconButton(
                        onPressed: () {},
                        icon: Image.asset("assets/icons/ic_fb.png")),
                  ),
                  SizedBox(
                    height: 45,
                    width: 45,
                    child: IconButton(
                        onPressed: () {},
                        icon: Image.asset("assets/icons/ic_insta.png")),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
