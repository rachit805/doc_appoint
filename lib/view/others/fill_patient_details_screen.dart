import 'package:Doctor/utils/constant.dart';
import 'package:Doctor/widgets/cbutton.dart';
import 'package:Doctor/controller/patient_details_contrller.dart';
import 'package:Doctor/view/others/appointment_completed_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Doctor/widgets/ctextformfield.dart';
import 'package:Doctor/widgets/custom_appbar.dart';

class FillPatientDetails extends StatelessWidget {
  const FillPatientDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PatientDetailsController controller =
        Get.put(PatientDetailsController());

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CAppBar(
            title: "Patient's Details",
            backgroundColor: Colors.white,
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color.fromRGBO(224, 215, 215, 0.63),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "${iconpath}ic_profile.png",
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CTextFormField(
                        controller: controller.nameController,
                        labelText: "Name",
                        hintText: "",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color.fromRGBO(224, 215, 215, 0.63),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(
                          "${iconpath}ic_agerange.png",
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Expanded(
                      child: Text(
                        "select your age range or type",
                        style: TextStyle(
                          color: Color.fromRGBO(120, 123, 152, 1),
                          fontFamily: "Rubik",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      String textValue;
                      if (index == 0) {
                        textValue = "10+";
                      } else if (index == 1) {
                        textValue = "20+";
                      } else if (index == 2) {
                        textValue = "30+";
                      } else {
                        return GestureDetector(
                          onTap: () {
                            controller.ageIndex = index.obs;
                          },
                          child: Container(
                            width: 80,
                            height: 80,
                            margin: const EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(236, 238, 249, 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: "",
                                    hintStyle: TextStyle(
                                      color: Color.fromRGBO(120, 123, 152, 1),
                                      fontFamily: "Rubik",
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  style: const TextStyle(
                                    color: Color.fromRGBO(120, 123, 152, 1),
                                    fontFamily: "Rubik",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                      return GestureDetector(
                        onTap: () {
                          controller.selectedIndex.value = index;
                        },
                        child: Obx(() => Container(
                              width: 80,
                              height: 80,
                              margin: const EdgeInsets.only(right: 20),
                              decoration: BoxDecoration(
                                color: controller.selectedIndex.value == index
                                    ? const Color.fromRGBO(187, 206, 2551, 1)
                                    : const Color.fromRGBO(236, 238, 249, 1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  textValue,
                                  style: TextStyle(
                                    color:
                                        controller.selectedIndex.value == index
                                            ? Colors.white
                                            : const Color.fromRGBO(
                                                120, 123, 152, 1),
                                    fontFamily: "Rubik",
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            )),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color.fromRGBO(224, 215, 215, 0.63),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Image.asset(
                          "${iconpath}ic_down.png",
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CTextFormField(
                        controller: controller.countryController,
                        labelText: "Your Country",
                        hintText: "",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color.fromRGBO(224, 215, 215, 0.63),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "${iconpath}ic_phone.png",
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: CTextFormField(
                        controller: controller.phoneController,
                        labelText: "Phone number",
                        hintText: "",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color.fromRGBO(224, 215, 215, 0.63),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "${iconpath}ic_gender.png",
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      "Gender",
                      style: TextStyle(
                        color: Color.fromRGBO(120, 123, 152, 1),
                        fontFamily: "Rubik",
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: controller.selectMale,
                          child: Obx(
                            () => Container(
                              alignment: Alignment.topLeft,
                              // height: 38,
                              // width: 80,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromRGBO(
                                    224,
                                    215,
                                    215,
                                    0.63,
                                  ),
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.elliptical(50, 50),
                                  bottomLeft: Radius.elliptical(50, 50),
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 18,
                                    backgroundColor: const Color.fromRGBO(
                                      236,
                                      238,
                                      249,
                                      1,
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      color: controller.isMaleSelected.value
                                          ? const Color.fromRGBO(
                                              133,
                                              136,
                                              255,
                                              1,
                                            )
                                          : Colors.transparent,
                                    ),
                                  ),
                                  const Center(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      child: Text(
                                        "Male",
                                        style: TextStyle(
                                          fontFamily: "Rubik",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(
                                            155,
                                            157,
                                            177,
                                            1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: controller.selectFemale,
                          child: Obx(
                            () => Container(
                              alignment: Alignment.topLeft,
                              // height: 38,
                              // width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromRGBO(
                                    224,
                                    215,
                                    215,
                                    0.63,
                                  ),
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.elliptical(50, 50),
                                  bottomLeft: Radius.elliptical(50, 50),
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 18,
                                    backgroundColor: const Color.fromRGBO(
                                      236,
                                      238,
                                      249,
                                      1,
                                    ),
                                    child: Icon(
                                      Icons.check,
                                      color: controller.isFemaleSelected.value
                                          ? const Color.fromRGBO(
                                              133,
                                              136,
                                              255,
                                              1,
                                            )
                                          : Colors.transparent,
                                    ),
                                  ),
                                  const Center(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      child: Text(
                                        "Female",
                                        style: TextStyle(
                                          fontFamily: "Rubik",
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromRGBO(
                                            155,
                                            157,
                                            177,
                                            1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Text(
                      "Write your problem",
                      style: TextStyle(
                        color: Color.fromRGBO(120, 123, 152, 1),
                        fontFamily: "Rubik",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color.fromRGBO(
                        224,
                        215,
                        215,
                        0.63,
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText:
                            "I am a cardio patient. Feel sick last 3 weeks need to talk about cardio problem.",
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(120, 123, 152, 1),
                          fontFamily: "Rubik",
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        color: Color.fromRGBO(120, 123, 152, 1),
                        fontFamily: "Rubik",
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: CButton(
                        onTap: () {
                          Get.to(() => const AppointmentCompleteScreen());
                        },
                        text: "Continue")),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
