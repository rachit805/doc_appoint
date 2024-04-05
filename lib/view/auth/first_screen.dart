import 'package:Doctor/utils/constant.dart';
import 'package:Doctor/widgets/cbutton.dart';
import 'package:Doctor/view/auth/signin_screen.dart';
import 'package:Doctor/view/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double sH = MediaQuery.of(context).size.height;
    double sW = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "${imagepath}app_logo.png",
                height: sH / 4,
                width: sW / 3,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "DoctorPoint",
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 25,
                  fontWeight: FontWeight.w800),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Create a Free account",
              style: TextStyle(
                  fontFamily: "Roboto",
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(127, 131, 169, 0.79)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 100,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: CButton(
                    onTap: () {
                      Get.to(() => SignUpScreen());
                    },
                    text: "Create an account")),
            const SizedBox(
              height: 30,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: CButton(
                  onTap: () {
                    Get.to(() => SignInScreen());
                  },
                  text: 'Sign in',
                ))
          ],
        ));
  }
}
