import 'package:Doctor/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Doctor/widgets/c_text.dart';
import 'package:Doctor/widgets/cbutton.dart';
import 'package:Doctor/data/onboarding_data.dart';

class OnBoardScreen extends StatelessWidget {
  final OnBoardController controller = Get.put(OnBoardController());

  OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: controller.onPageChanged,
              controller: controller.pageController,
              scrollDirection: Axis.horizontal,
              itemCount: onboardingData.length,
              itemBuilder: (_, i) {
                return Column(
                  children: [
                    Image.asset(
                      onboardingData[i].image,
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Text(
                        onboardingData[i].title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 45),
                      child: Text(
                        onboardingData[i].description,
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(179, 179, 179, 1),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                onboardingData.length,
                (index) => buildDot(context, index),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: CButton(
              onTap: () {
                controller.nextPage();
              },
              text: "Get Started",
            ),
          ),
          const SizedBox(height: 15),
          InkWell(
            onTap: () {
              controller.skip();
            },
            child: const CText(text: "Skip"),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  GestureDetector buildDot(BuildContext context, int index) {
    final OnBoardController controller = Get.find();
    return GestureDetector(
      onTap: () {
        controller.pageController.jumpToPage(index);
      },
      child: Container(
        height: 10,
        width: 10,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: controller.currentIndex.value == index
              ? const Color.fromRGBO(187, 206, 255, 1)
              : const Color.fromRGBO(223, 223, 223, 1),
        ),
      ),
    );
  }
}
