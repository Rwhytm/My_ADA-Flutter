import 'package:buku_kia/themes/font.dart';
import 'package:flutter/material.dart';

class JudulBesar extends StatelessWidget {
  final String judul;
  const JudulBesar({
    required this.judul,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        judul,
        style: judulHitamPudarTextStyle,
      ),
    );
  }
}
