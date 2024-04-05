import 'package:flutter/material.dart';

class CButton extends StatelessWidget {
  const CButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromRGBO(236, 238, 249, 1),
        ),
        height: 55,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(85, 84, 120, 1),
            ),
          ),
        ),
      ),
    );
  }
}
