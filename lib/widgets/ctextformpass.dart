import 'package:flutter/material.dart';

class CTextFormPass extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextStyle hintStyle;
  final BorderRadius borderRadius;

  const CTextFormPass({
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
  // ignore: library_private_types_in_public_api
  _CTextFormPassState createState() => _CTextFormPassState();
}

class _CTextFormPassState extends State<CTextFormPass> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: widget.controller,
        obscureText: _obscureText,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          label: Text(widget.labelText),
          labelStyle: const TextStyle(
              fontFamily: "Roboto",
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(195, 185, 185, 1)),
          hintText: widget.hintText,
          hintStyle: widget.hintStyle,
          border: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromRGBO(221, 221, 221, 1)),
            borderRadius: widget.borderRadius,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
