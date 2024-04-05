import 'package:Doctor/utils/colors.dart';
import 'package:Doctor/utils/constant.dart';
import 'package:Doctor/view/others/chat_screen.dart';
import 'package:Doctor/view/others/incoming_doctor_call.dart';
import 'package:Doctor/view/others/write_review_screen.dart';
import 'package:Doctor/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnlineAppointments extends StatelessWidget {
  const OnlineAppointments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CAppBar(
            title: 'Online appointments',
            backgroundColor: Colors.white,
          )),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    child: Image.asset(
                      "${imagepath}doc7.png",
                      width: 90,
                      height: 90,
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Dr.jobatar Ray",
                        style: TextStyle(
                          color: AppColors.appbartextcolor,
                          fontFamily: "Rubik",
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Holy Family Red Crescent \nMedical College & Hospital",
                        maxLines: 2,
                        style: TextStyle(
                          fontFamily: "Rubik",
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textcolor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(187, 187, 238, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(const IncomingDoctorCall());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(159, 159, 206, 0.28)),
                        child: Image.asset(
                          "${iconpath}ic_call1.png",
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(ChatwithDoctor());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(159, 159, 206, 0.28)),
                        child: Image.asset(
                          "${iconpath}ic_msg.png",
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(159, 159, 206, 0.28)),
                      child: Image.asset(
                        "${iconpath}ic_video_call.png",
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      width: 60,
                      height: 60,
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(159, 159, 206, 0.28)),
                      child: Image.asset(
                        "${iconpath}ic_alarm1.png",
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(248, 248, 248, 1),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: 30,
                            width: 30,
                            child: Image.asset("${iconpath}ic_clock.png")),
                        const SizedBox(
                          width: 10,
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Visit time",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.titlecolor),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Morning",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textcolor),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              "Today - 10 June, 2021",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textcolor),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              "12:00am - 12:30am",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textcolor),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: 30,
                            width: 30,
                            child: Image.asset("${iconpath}ic_profile1.png")),
                        const SizedBox(
                          width: 10,
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Patient information",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.titlecolor),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Name   :   SK sakhyr Deyon",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textcolor),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              "Agu   :   23",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textcolor),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              "Phone   :   +8801777777777",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textcolor),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: 30,
                            width: 30,
                            child: Image.asset("${iconpath}ic_fee.png")),
                        const SizedBox(
                          width: 10,
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Fees information",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.titlecolor),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Paid",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textcolor),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              "\$10",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: "Rubik",
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textcolor),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(WriteReview());
                                },
                                child: Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: const Color.fromRGBO(
                                          236, 238, 249, 1),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Write a review",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(91, 104, 137, 1),
                                            fontWeight: FontWeight.w800,
                                            fontFamily: "Rubik"),
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
