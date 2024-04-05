import 'package:Doctor/utils/constant.dart';
import 'package:Doctor/view/home_page.dart';
import 'package:Doctor/widgets/cbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    double sW = MediaQuery.of(context).size.width;
    double sH = MediaQuery.of(context).size.height;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context, sW, sH),
    );
  }

  Widget contentBox(BuildContext context, double sW, double sH) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: sW / 1.5,
        height: sH / 1.8,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "${iconpath}ic_premium.png",
              width: 100,
              height: 100,
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                'Upgraded',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Your doctor point Pro membership actiated. Enjoy your pro membership and get unlimited consultations.',
              style: TextStyle(
                color: Color.fromRGBO(104, 104, 104, 1),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Expanded(child: SizedBox()),
            CButton(
                onTap: () {
                  Get.offAll(HomePage());
                },
                text: "Go to Dashboard")
          ],
        ),
      ),
    );
  }
}
