import 'package:Doctor/data/all_doctor_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Doctor/model/all_doctor_model.dart';

class AllDoctorsController extends GetxController
    // ignore: deprecated_member_use
    with
        // ignore: deprecated_member_use
        SingleGetTickerProviderMixin {
  late TabController tabController;

  final List<List<AllDoctorsModel>> tabsData = [
    AllDoctorsData,
    CardioDoctors,
    DentistDoctors,
    PsychoDoctors,
    NeuroDoctors,
    HeartDoctors,
  ].obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabsData.length, vsync: this);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
