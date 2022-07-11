import 'package:buku_kia/themes/color.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class RoundedInputField extends StatelessWidget {
  final String? hintText;
  final String? label;
  final IconData? icon;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final TextInputType keyboard;
  const RoundedInputField(
      {Key? key,
      this.controller,
      this.hintText,
      this.icon = Icons.person,
      this.onChanged,
      this.label,
      required this.keyboard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.8,
      child: TextFormField(
        keyboardType: keyboard,
        controller: controller,
        onChanged: onChanged,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          floatingLabelAlignment: FloatingLabelAlignment.center,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          alignLabelWithHint: true,
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(27),
          ),
          fillColor: Colors.white70,
          filled: true,
        ),
      ),
    );
  }
}
