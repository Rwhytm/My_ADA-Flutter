import 'dart:ffi';

import 'package:buku_kia/themes/font.dart';
import 'package:flutter/material.dart';

class SubTitleBiru extends StatelessWidget {
  final String angka;
  final String judul;
  final double padding;
  const SubTitleBiru({
    required this.angka,
    required this.judul,
    required this.padding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: padding,
        right: 4,
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          angka,
          style: judulBiru,
        ),
        const SizedBox(
          width: 2,
        ),
        Flexible(
          child: Text(
            judul,
            style: judulBiru,
          ),
        )
      ]),
    );
  }
}
