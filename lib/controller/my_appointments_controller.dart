import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Doctor/data/all_doctor_data.dart';
import 'package:Doctor/model/all_doctor_model.dart';

class MyAppointmentsController extends GetxController
    with
        // ignore: deprecated_member_use
        SingleGetTickerProviderMixin {
  late TabController tabController;

  final List<List<AllDoctorsModel>> tabsData = [
    AllDoctorsData,
    CardioDoctors,
  ].obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabsData.length, vsync: this);
  }

  // @override
  // void onClose() {
  //   tabController.dispose();
  //   super.onClose();
  // }
}
