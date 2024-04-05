import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CdobTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;

  const CdobTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CdobTextFieldState createState() => _CdobTextFieldState();
}

class _CdobTextFieldState extends State<CdobTextField> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.controller.text = DateFormat('yyyy-MM-dd').format(selectedDate!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: widget.controller,
        readOnly: true,
        onTap: () => _selectDate(context),
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: const TextStyle(
              fontFamily: "Roboto",
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(195, 185, 185, 1)),
          hintText: widget.hintText,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(221, 221, 221, 1)),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
