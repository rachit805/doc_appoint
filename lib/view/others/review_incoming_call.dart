import 'package:Doctor/utils/constant.dart';
import 'package:Doctor/widgets/cbutton2.dart';
import 'package:Doctor/widgets/custom_appbar.dart';
import 'package:Doctor/view/home_page.dart';
import 'package:Doctor/view/others/calling_with_doctor.dart';
import 'package:Doctor/view/others/write_review_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewIncomingCall extends StatelessWidget {
  const ReviewIncomingCall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CAppBar(
            title: "Dr. jobatar Ray",
            backgroundColor: Colors.transparent,
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height / 13),
              child: const Center(
                child: CText2(
                    text: "Incoming call",
                    color: Colors.black,
                    size: 15,
                    weight: FontWeight.w500),
              ),
            ),
            Image.asset(
              "${imagepath}doc7.png",
              width: 150,
              height: 150,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                alignment: Alignment.bottomCenter,
                child: const CText2(
                  color: Color.fromRGBO(91, 104, 137, 1),
                  text: 'Dr.Jobatar Ray',
                  size: 25,
                  weight: FontWeight.w700,
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height / 8,
            ),
            CButton2(
              onTap: () {
                Get.to(WriteReview());
              },
              text: "Write a review",
              backgroundcolor: const Color.fromRGBO(236, 238, 249, 1),
              textcolor: const Color.fromRGBO(80, 124, 130, 1),
              containerHeight: 60,
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 25),
            CButton2(
              onTap: () {
                Get.offAll(HomePage());
              },
              text: "Go to dashboard",
              backgroundcolor: const Color.fromRGBO(246, 246, 246, 1),
              textcolor: const Color.fromRGBO(163, 163, 163, 1),
              containerHeight: 60,
            ),
          ],
        ),
      ),
    );
  }
}
