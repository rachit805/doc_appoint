import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientDetailsController extends GetxController {
  final RxInt selectedIndex = 0.obs;
  RxInt ageIndex = 0.obs;
  final RxBool isMaleSelected = false.obs;
  final RxBool isFemaleSelected = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  void selectMale() {
    isMaleSelected.value = true;
    isFemaleSelected.value = false;
  }

  void selectFemale() {
    isMaleSelected.value = false;
    isFemaleSelected.value = true;
  }
}
