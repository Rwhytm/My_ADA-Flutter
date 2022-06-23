import 'package:buku_kia/themes/font.dart';
import 'package:buku_kia/widgets/deskripsi_widget.dart';
import 'package:flutter/material.dart';

class ListRegistrasi extends StatelessWidget {
  final String jawaban;
  final String pertanyaan;
  const ListRegistrasi({
    required this.pertanyaan,
    required this.jawaban,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        DeskripsiWidget(
          deskripsi: pertanyaan,
          padding: 15,
        ),
        const DeskripsiWidget(
          deskripsi: ':',
          padding: 0,
        ),
        DeskripsiWidget(
          deskripsi: jawaban,
          padding: 15,
        ),
      ],
    );
  }
}
