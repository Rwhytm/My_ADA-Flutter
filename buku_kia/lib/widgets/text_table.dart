import 'package:buku_kia/themes/font.dart';
import 'package:flutter/material.dart';

class TextTable extends StatelessWidget {
  final String text;
  final TextAlign align;
  const TextTable({
    required this.text,
    required this.align,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textTableStyle,
      textAlign: align,
    );
  }
}
