import 'package:Doctor/utils/colors.dart';
import 'package:Doctor/utils/constant.dart';
import 'package:Doctor/view/others/online_appointments.dart';
import 'package:Doctor/widgets/cbutton2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentCompleteScreen extends StatelessWidget {
  const AppointmentCompleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double sH = MediaQuery.of(context).size.height;
    double sW = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(187, 188, 201, 0.62),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            backgroundColor: Colors.transparent,
            leading: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: const Color.fromRGBO(144, 145, 155, 0.62),
                        width: 1.5),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Color.fromRGBO(144, 145, 155, 0.62),
                      size: 15,
                    ),
                  ),
                ),
              ),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                width: sW,
                height: sH / 9,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: Color.fromRGBO(187, 206, 255, 1)),
                child: const Center(
                  child: Text(
                    "Bank card",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        fontFamily: "Rubik",
                        color: AppColors.textcolor),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: sH / 7),
              width: sW,
              height: sH / 1.8,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Image.asset(
                      "${iconpath}ic_complete.png",
                      width: 150,
                      height: 150,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "Completed",
                      style: TextStyle(
                          fontSize: 24,
                          fontFamily: "Rubik",
                          fontWeight: FontWeight.w500,
                          color: AppColors.textcolor),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Rubik",
                            color: Color.fromRGBO(172, 174, 190, 1),
                          ),
                          children: [
                            TextSpan(
                                text:
                                    'Your appointment booking successfully completed. ',
                                style: TextStyle(fontWeight: FontWeight.w200)),
                            TextSpan(
                                text: 'Dr Mahmud Nil',
                                style: TextStyle(fontWeight: FontWeight.w800)),
                            TextSpan(
                                text: ' will message you soon',
                                style: TextStyle(fontWeight: FontWeight.w200)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CButton2(
                    onTap: () {
                      Get.off(() => const OnlineAppointments());
                    },
                    text: 'Payment now',
                    backgroundcolor: const Color.fromRGBO(187, 188, 201, 0.62),
                    textcolor: const Color.fromARGB(255, 133, 143, 165),
                    containerHeight: 50),
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
