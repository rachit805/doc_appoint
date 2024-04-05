import 'package:Doctor/controller/about_doctor_controller.dart';
import 'package:Doctor/utils/colors.dart';
import 'package:Doctor/utils/constant.dart';
import 'package:Doctor/widgets/custom_appbar.dart';
import 'package:Doctor/view/others/appointment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutDoctor extends StatelessWidget {
  AboutDoctor({
    Key? key,
    required this.docname,
    required this.docimage,
    required this.specialist,
  }) : super(key: key);

  final String docname;
  final String docimage;
  final String specialist;

  final AboutDoctorController controller = Get.put(AboutDoctorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CAppBar(
            title: '',
            backgroundColor: Colors.white,
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    child: Image.asset(
                      docimage,
                      width: 80,
                      height: 80,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          docname,
                          style: const TextStyle(
                            color: AppColors.appbartextcolor,
                            fontFamily: "Rubik",
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          specialist,
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: "Rubik",
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textcolor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(236, 238, 249, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        "${iconpath}ic_users.png",
                        height: 25,
                        width: 25,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "1000+",
                          style: TextStyle(
                            color: Color.fromRGBO(91, 104, 137, 1),
                            fontFamily: "Rubik",
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          "Patients",
                          maxLines: 2,
                          style: TextStyle(
                            fontFamily: "Rubik",
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textcolor,
                          ),
                        ),
                      ],
                    ),
                    const Expanded(
                      child: SizedBox(
                          // width: MediaQuery.of(context).size.width / 12,
                          ),
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        "${iconpath}ic_bookmarkB.png",
                        height: 20,
                        width: 20,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "5 Years",
                          style: TextStyle(
                            color: Color.fromRGBO(91, 104, 137, 1),
                            fontFamily: "Rubik",
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          "Experiences",
                          maxLines: 2,
                          style: TextStyle(
                            fontFamily: "Rubik",
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textcolor,
                          ),
                        ),
                      ],
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
                    topRight: Radius.circular(45),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              "About Doctor",
                              style: TextStyle(
                                color: Color.fromRGBO(91, 104, 137, 1),
                                fontFamily: "Rubik",
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        DoctorDescription,
                        style: TextStyle(
                          fontFamily: "Rubik",
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textcolor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              "Working Time",
                              style: TextStyle(
                                color: Color.fromRGBO(91, 104, 137, 1),
                                fontFamily: "Rubik",
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Mon - fri 09.00am - 08.30pm",
                        style: TextStyle(
                          fontFamily: "Rubik",
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textcolor,
                        ),
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 80,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 60,
                          itemBuilder: (context, index) {
                            final now = DateTime.now();
                            final date = now.add(Duration(days: index));
                            return Obx(
                              () => GestureDetector(
                                onTap: () {
                                  controller.updateSelected(
                                      index,
                                      controller.getFullDayOfWeek(date.weekday),
                                      date.day,
                                      controller.getMonthOfYear(date.month));
                                },
                                child: Container(
                                  width: 60,
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    // ignore: unrelated_type_equality_checks
                                    color: controller.selectedIndex == index
                                        ? const Color.fromRGBO(236, 238, 249, 1)
                                        : Colors.white,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        _getDayOfWeek(date.weekday),
                                        style: const TextStyle(
                                            color:
                                                Color.fromRGBO(91, 104, 137, 1),
                                            fontWeight: FontWeight.w800,
                                            fontFamily: "Rubik"),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        '${date.day}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "Rubik"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: const Color.fromRGBO(236, 238, 249, 1),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.fav.value =
                                        !controller.fav.value;
                                  },
                                  child: const Icon(
                                    Icons.favorite,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(AppointmentScreen(
                                      day: controller.selectedDay.value,
                                      date: controller.selectedDate.value
                                          .toString(),
                                      month:
                                          controller.selectedMonth.toString(),
                                    ));
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: const Color.fromRGBO(
                                          236, 238, 249, 1),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Book appointment",
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(91, 104, 137, 1),
                                            fontWeight: FontWeight.w800,
                                            fontFamily: "Rubik"),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

String _getDayOfWeek(int weekday) {
  switch (weekday) {
    case DateTime.monday:
      return 'Mon';
    case DateTime.tuesday:
      return 'Tue';
    case DateTime.wednesday:
      return 'Wed';
    case DateTime.thursday:
      return 'Thu';
    case DateTime.friday:
      return 'Fri';
    case DateTime.saturday:
      return 'Sat';
    case DateTime.sunday:
      return 'Sun';
    default:
      return '';
  }
}
