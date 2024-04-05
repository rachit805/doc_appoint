import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Doctor/data/onboarding_data.dart';
import 'package:Doctor/view/auth/first_screen.dart';

class OnBoardController extends GetxController {
  final RxInt currentIndex = 0.obs;
  final PageController pageController = PageController();

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  void nextPage() {
    if (currentIndex.value < onboardingData.length - 1) {
      currentIndex.value++;
      pageController.animateToPage(
        currentIndex.value,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      Get.to(() => const FirstScreen());
    }
  }

  // void dotfornext() {
  //   if (currentIndex.value < onboardingData.length - 1) {
  //     currentIndex.value++;
  //     pageController.animateToPage(
  //       currentIndex.value,
  //       duration: const Duration(milliseconds: 500),
  //       curve: Curves.ease,
  //     );
  //   }
  // }

  void skip() {
    Get.to(() => const FirstScreen());
  }
}
