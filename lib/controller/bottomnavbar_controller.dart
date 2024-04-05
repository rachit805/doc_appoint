// controllers/home_controller.dart

import 'package:Doctor/utils/colors.dart';
import 'package:Doctor/view/bottom_navbar/categories_screen.dart';
import 'package:Doctor/view/bottom_navbar/documents_screen.dart';
import 'package:Doctor/view/bottom_navbar/home_screen.dart';
import 'package:Doctor/view/bottom_navbar/notifications_screen.dart';
import 'package:flutter/material.dart';

class HomeController {
  final BuildContext context;

  HomeController(this.context);

  int selectedIndex = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const NotificationsScreen(),
    const CategoriesScreen(),
    const DocumentsScreen(),
  ];

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: const Color.fromRGBO(252, 252, 255, 1),
      currentIndex: selectedIndex,
      iconSize: 20,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        _buildBottomNavigationBarItem(
          "assets/icons/ic_search.png",
          selectedIndex == 0,
        ),
        _buildBottomNavigationBarItem(
          "assets/icons/ic_notification.png",
          selectedIndex == 1,
        ),
        _buildBottomNavigationBarItem(
          "assets/icons/ic_category.png",
          selectedIndex == 2,
        ),
        _buildBottomNavigationBarItem(
          "assets/icons/ic_document.png",
          selectedIndex == 3,
        ),
      ],
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
    String iconPath,
    bool isSelected,
  ) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        iconPath,
        width: 25,
        height: 25,
        color: isSelected ? AppColors.selectedIconColor : null,
      ),
      label: "",
    );
  }

  Widget getCurrentScreen() {
    return screens[selectedIndex];
  }

  void _onItemTapped(int index) {
    selectedIndex = index;
  }
}
