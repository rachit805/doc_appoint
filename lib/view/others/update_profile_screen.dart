import 'package:Doctor/controller/update_profile_controller.dart';
import 'package:Doctor/utils/colors.dart';
import 'package:Doctor/utils/constant.dart';
import 'package:Doctor/view/others/calling_with_doctor.dart';
import 'package:Doctor/widgets/cbutton2.dart';
import 'package:Doctor/widgets/ctextformfield.dart';
import 'package:Doctor/widgets/custom_appbar.dart';
import 'package:Doctor/widgets/dob_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class UpdateProfileScreen extends StatelessWidget {
  UpdateProfileScreen({Key? key}) : super(key: key);

  final UpdateProfileController controller = UpdateProfileController();

  @override
  Widget build(BuildContext context) {
    double sH = MediaQuery.of(context).size.height;

    return GestureDetector(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: CAppBar(
            title: "",
            backgroundColor: Colors.white,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: [
                    const Text(
                      "Set up your profile",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Update your profile to connect with your doctor with a better impression.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(171, 172, 187, 1),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: sH / 25,
                    ),
                    Center(
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(237, 238, 239, 1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Obx(() {
                                final image = controller.image;
                                return image != null
                                    ? Image.file(
                                        image,
                                        width: double.infinity,
                                        height: double.infinity,
                                        fit: BoxFit.cover,
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.all(30),
                                        child: Image.asset(
                                            "${iconpath}ic_update_profile.png"),
                                      );
                              }),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.camera_alt),
                            onPressed: () async {
                              await controller.getImage();
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: sH / 25,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "${iconpath}ic_gender.png",
                          width: 30,
                          height: 30,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const CText2(
                          text: "Gender",
                          color: AppColors.textcolor,
                          size: 15,
                          weight: FontWeight.w600,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Obx(
                            () => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: const Color.fromRGBO(221, 221, 221, 1),
                                ),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  style: const TextStyle(
                                      fontFamily: "Rubik",
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                  borderRadius: BorderRadius.circular(10),
                                  icon: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: const Color.fromRGBO(
                                            224, 215, 215, 0.63),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12),
                                      child: Image.asset(
                                        "${iconpath}ic_down.png",
                                      ),
                                    ),
                                  ),
                                  padding: const EdgeInsets.only(left: 10),
                                  hint: const Text('Select your Gender'),
                                  value: controller.selectedGender.value,
                                  onChanged: (String? gender) {
                                    if (gender != null) {
                                      controller.updateSelectedGender(gender);
                                    }
                                  },
                                  items: controller.genders
                                      .map<DropdownMenuItem<String>>(
                                    (String newValue) {
                                      return DropdownMenuItem<String>(
                                        value: newValue,
                                        child: Text(newValue),
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "${iconpath}ic_dob.png",
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const CText2(
                          text: "Date of Birth",
                          color: AppColors.textcolor,
                          size: 15,
                          weight: FontWeight.w600,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CdobTextField(
                        controller: controller.dobController,
                        labelText: "Select your DOB",
                        hintText: "DOB"),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "${iconpath}ic_loc.png",
                          width: 25,
                          height: 25,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const CText2(
                          text: "Address",
                          color: AppColors.textcolor,
                          size: 15,
                          weight: FontWeight.w600,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CTextFormField(
                      controller: controller.addressController,
                      labelText: "Enter your address",
                      hintText: "",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CButton2(
                onTap: () {
                  Get.snackbar("Profile Data", "Profile Updated Successfully!",
                      backgroundColor: Colors.greenAccent);
                  Future.delayed(const Duration(seconds: 1), () {
                    Navigator.pop(context);
                  });
                },
                text: "Complete",
                backgroundcolor: const Color.fromRGBO(236, 238, 249, 1),
                textcolor: const Color.fromRGBO(85, 84, 120, 1),
                containerHeight: 60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
