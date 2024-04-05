import 'package:Doctor/utils/colors.dart';
import 'package:Doctor/utils/constant.dart';
import 'package:Doctor/widgets/custom_appbar.dart';
import 'package:Doctor/controller/my_appointments_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAppointmentsScreen extends StatelessWidget {
  MyAppointmentsScreen({super.key});
  final MyAppointmentsController controller =
      Get.put(MyAppointmentsController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CAppBar(
            title: "My appointments",
            backgroundColor: Colors.white,
            trailingactions: [
              Padding(
                padding: EdgeInsets.all(10),
                child: CircleAvatar(
                  backgroundColor: Color.fromRGBO(242, 251, 255, 1),
                  child: Icon(
                    Icons.add,
                    color: Color.fromRGBO(98, 124, 154, 1),
                  ),
                ),
              )
            ],
          )),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 5, right: 5),
              child: SizedBox(
                height: 40,
                width: double.infinity,
                child: TabBar(
                  labelColor: const Color.fromRGBO(15, 53, 88, 1),
                  unselectedLabelColor: const Color.fromRGBO(180, 182, 207, 1),
                  dividerColor: Colors.white,
                  controller: controller.tabController,
                  indicator: BoxDecoration(
                    color: controller.tabController.index == 0
                        ? const Color.fromRGBO(236, 238, 249, 1)
                        : const Color.fromRGBO(250, 250, 250, 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  tabs: const [
                    Tab(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 15, right: 15, top: 5, bottom: 5),
                        child: Text(
                          "Upcoming",
                          style: TextStyle(
                            fontFamily: "Rubik",
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 25, right: 25, top: 5, bottom: 5),
                        child: Text(
                          "Past",
                          style: TextStyle(
                            fontFamily: "Rubik",
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: controller.tabsData.map((tabData) {
                  return ListView.builder(
                    itemCount: tabData.length,
                    itemBuilder: (context, index) {
                      final doctor = tabData[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 20,
                        ),
                        child: Card(
                          child: GestureDetector(
                            child: ListTile(
                              leading: Stack(
                                children: [
                                  ClipRRect(
                                    child: SizedBox(
                                      height: 150,
                                      width: 60,
                                      child: Image.asset(
                                        doctor.image,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Image.asset(
                                          "${iconpath}ic_video.png"),
                                    ),
                                  ),
                                ],
                              ),
                              title: Text(
                                doctor.name,
                                style: const TextStyle(
                                    fontFamily: "Rubik",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                    color: Color.fromRGBO(91, 104, 137, 1)),
                              ),
                              subtitle: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          doctor.description,
                                          maxLines: 2,
                                          style: const TextStyle(
                                              fontStyle: FontStyle.italic,
                                              fontFamily: "Rubik",
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.textcolor),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.amberAccent,
                                        size: 15,
                                      ),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        doctor.rating.toString(),
                                        style: const TextStyle(
                                            fontFamily: "Rubik",
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.textcolor),
                                      ),
                                      Text(
                                        "(${doctor.review.toString()} Reviews)",
                                        style: const TextStyle(
                                            fontFamily: "Rubik",
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.textcolor),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
