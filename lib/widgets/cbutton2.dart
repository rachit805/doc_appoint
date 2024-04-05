import 'package:flutter/material.dart';

class CButton2 extends StatelessWidget {
  const CButton2({
    Key? key,
    required this.onTap,
    required this.text,
    required this.backgroundcolor,
    required this.textcolor,
    required this.containerHeight,
  }) : super(key: key);

  final VoidCallback onTap;
  final String text;
  final Color backgroundcolor;
  final Color textcolor;
  final double containerHeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundcolor,
        ),
        height: containerHeight,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w700,
              color: textcolor,
            ),
          ),
        ),
      ),
    );
  }
}
