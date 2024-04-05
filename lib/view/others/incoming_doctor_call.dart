import 'package:Doctor/utils/constant.dart';
import 'package:Doctor/view/others/chat_screen.dart';
import 'package:Doctor/view/others/calling_with_doctor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IncomingDoctorCall extends StatelessWidget {
  const IncomingDoctorCall({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            const Expanded(
              child: SizedBox(),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.off(const CallingwithDoctor());
                    },
                    child: _buildIconButton(
                      imagePath: "${iconpath}ic_call2.png",
                      label: "Accept",
                      color: const Color.fromRGBO(37, 37, 255, 0.42),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: _buildIconButton(
                      imagePath: "${iconpath}ic_call_reject.png",
                      label: "Decline",
                      color: const Color.fromRGBO(242, 29, 82, 1),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(ChatwithDoctor());
                    },
                    child: _buildIconButton(
                      imagePath: "${iconpath}ic_chat1.png",
                      label: "Message",
                      color: const Color.fromRGBO(255, 168, 115, 1),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton({
    required String imagePath,
    required String label,
    required Color color,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: color,
          ),
          height: 72,
          width: 78,
          child: Center(
            child: Image.asset(
              imagePath,
              height: 40,
              width: 40,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(
            fontFamily: "Rubik",
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
