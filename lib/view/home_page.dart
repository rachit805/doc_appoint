import 'package:Doctor/widgets/exit_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_page_controller.dart';
import '../utils/colors.dart';
import '../view/bottom_navbar/home_screen.dart';
import '../view/bottom_navbar/notifications_screen.dart';
import '../view/others/my_appointments_screen.dart';
import '../view/others/setting_screen.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  List<Widget> screens = [
    const HomeScreen(),
    const NotificationsScreen(),
    SettingScreen(),
    MyAppointmentsScreen(),
  ];

  final HomePageController controller = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        if (controller.selectedIndex.value != 0) {
          controller.onItemTapped(0);
          return false;
        }
        bool exit = await showDialog(
          context: context,
          builder: (BuildContext context) {
            return const ExitConfirmationDialog();
          },
        );
        return exit == true;
      },
      child: Obx(
        () => Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: const Color.fromRGBO(252, 252, 255, 1),
            currentIndex: controller.selectedIndex.value,
            iconSize: 20,
            onTap: controller.onItemTapped,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Colors.blueAccent,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icons/ic_search.png",
                  width: 25,
                  height: 25,
                  color: controller.selectedIndex.value == 0
                      ? AppColors.selectedIconColor
                      : null,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icons/ic_notification.png",
                  width: 25,
                  height: 25,
                  color: controller.selectedIndex.value == 1
                      ? AppColors.selectedIconColor
                      : null,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icons/ic_category.png",
                  width: 25,
                  height: 25,
                  color: controller.selectedIndex.value == 2
                      ? AppColors.selectedIconColor
                      : null,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icons/ic_document.png",
                  width: 25,
                  height: 25,
                  color: controller.selectedIndex.value == 3
                      ? AppColors.selectedIconColor
                      : null,
                ),
                label: "",
              ),
            ],
          ),
          body: screens[controller.selectedIndex.value],
        ),
      ),
    );
  }
}
