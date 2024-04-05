import 'package:Doctor/controller/alldoctor_controller.dart';
import 'package:Doctor/data/doctors_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Doctor/utils/colors.dart';
import 'package:Doctor/utils/constant.dart';
import 'package:Doctor/view/others/about_doctor.dart';

class AllDoctors extends StatelessWidget {
  const AllDoctors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllDoctorsController());

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight + 60),
          child: AppBar(
            toolbarHeight: kToolbarHeight + 60,
            automaticallyImplyLeading: false,
            leading: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: InkWell(
                onTap: () {},
                child: Image.asset(
                  "${imagepath}user_icon.png",
                  height: 50,
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 20),
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/icons/ic_cal.png",
                    width: 30,
                    height: 50,
                  ),
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(35),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(249, 249, 255, 1),
                    borderRadius: BorderRadius.circular(38),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: Container(
                          margin: const EdgeInsets.all(5),
                          child: Image.asset(
                            "assets/icons/ic_search.png",
                            height: 15,
                          ),
                        ),
                        hintText: "Search doctor, categories, topic...",
                        hintStyle: const TextStyle(
                          fontSize: 13,
                          color: Color.fromRGBO(179, 179, 179, 1),
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 5, right: 5),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: const Color.fromRGBO(180, 182, 207, 1),
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  controller: controller.tabController,
                  tabs: DoctorCategory.map((category) {
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          category,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: "Rubik",
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  indicator: BoxDecoration(
                    color: controller.tabController.indexIsChanging
                        ? const Color.fromRGBO(232, 233, 255, 1)
                        : const Color.fromRGBO(249, 249, 255, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  dividerColor: Colors.white,
                  onTap: (index) {
                    controller.tabController.animateTo(index);
                  },
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
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AboutDoctor(
                                    docname: doctor.name,
                                    docimage: doctor.image,
                                    specialist: doctor.description,
                                  ),
                                ),
                              );
                            },
                            child: ListTile(
                              leading: ClipRRect(
                                child: SizedBox(
                                  height: 150,
                                  width: 60,
                                  child: Image.asset(
                                    doctor.image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              title: Text(
                                doctor.name,
                                style: const TextStyle(
                                  fontFamily: "Rubik",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: Color.fromRGBO(91, 104, 137, 1),
                                ),
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
                                            color: AppColors.textcolor,
                                          ),
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
                                          color: AppColors.textcolor,
                                        ),
                                      ),
                                      Text(
                                        "(${doctor.review.toString()} Reviews)",
                                        style: const TextStyle(
                                          fontFamily: "Rubik",
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.textcolor,
                                        ),
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
