import 'package:flutter/material.dart';

class CTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextStyle hintStyle;

  final BorderRadius borderRadius;

  const CTextFormField({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.hintStyle = const TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: 18,
      color: Color.fromRGBO(131, 134, 158, 1),
    ),
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
              fontFamily: "Roboto",
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(195, 185, 185, 1)),
          hintText: hintText,
          hintStyle: hintStyle,
          border: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromRGBO(221, 221, 221, 1)),
            borderRadius: borderRadius,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter text';
          }
          return null;
        },
      ),
    );
  }
}
