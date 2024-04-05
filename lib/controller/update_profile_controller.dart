import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  final Rx<File?> _image = Rx<File?>(null);
  RxString selectedGender = ''.obs;

  File? get image => _image.value;
  List<String> genders = ['', 'Male', 'Female'].obs;

  TextEditingController dobController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController profilepicController = TextEditingController();

  void setImage(File file) {
    _image.value = file;
  }

  Future<void> getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setImage(File(pickedFile.path));
    }
  }

  void updateSelectedGender(String gender) {
    selectedGender.value = gender;
    update();
  }
}
