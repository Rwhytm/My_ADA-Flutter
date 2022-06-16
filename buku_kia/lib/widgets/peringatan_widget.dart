import 'package:buku_kia/themes/font.dart';
import 'package:flutter/material.dart';

class PeringatanWidget extends StatelessWidget {
  final String text;
  const PeringatanWidget({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        text,
        style: peringatanMerahTextStyle,
      ),
    );
  }
}
