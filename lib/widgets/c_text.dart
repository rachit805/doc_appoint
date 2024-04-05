import 'package:flutter/material.dart';

class CText extends StatelessWidget {
  const CText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: const TextStyle(
            fontSize: 18,
            color: Color.fromRGBO(227, 227, 229, 1),
            fontFamily: "Roboto",
            fontWeight: FontWeight.w600),
        textAlign: TextAlign.center);
  }
}
