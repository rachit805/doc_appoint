import 'package:Doctor/utils/colors.dart';
import 'package:flutter/material.dart';

class CAppBar extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final List<Widget>? trailingactions;

  const CAppBar({
    super.key,
    this.trailingactions,
    required this.title,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      actions: trailingactions,
      leadingWidth: 50,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: const Color.fromRGBO(237, 237, 237, 1), width: 1.5),
            ),
            child: const Center(
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
                size: 15,
              ),
            ),
          ),
        ),
      ),
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w800,
          fontFamily: "Rubik",
          color: AppColors.appbartextcolor,
        ),
      ),
    );
  }
}
