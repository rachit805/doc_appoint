import 'package:Doctor/data/top_doctors_data.dart';
import 'package:Doctor/view/others/about_doctor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopDoctorsList extends StatelessWidget {
  const TopDoctorsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3.4,
      child: ListView.builder(
        itemCount: TopDoctorsData.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, i) {
          return GestureDetector(
            onTap: () {
              Get.to(AboutDoctor(
                docname: TopDoctorsData[i].title,
                docimage: TopDoctorsData[i].image,
                specialist: TopDoctorsData[i].category,
              ));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      TopDoctorsData[i].image,
                      width: 120,
                      height: MediaQuery.of(context).size.height / 4.5,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      TopDoctorsData[i].title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    TopDoctorsData[i].category,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color.fromRGBO(171, 172, 187, 1),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
