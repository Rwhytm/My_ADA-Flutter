import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/themes/font.dart';
import 'package:buku_kia/widgets/box_penjelasan.dart';
import 'package:flutter/material.dart';

class Penjelasan extends StatelessWidget {
  const Penjelasan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPink,
      appBar: AppBar(
        backgroundColor: appBarUngu,
        actions: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'Penjelasan Umum',
              style: judulAppBAr,
            ),
          ),
        ],
        centerTitle: false,
      ),
      body: Column(
        children: const <Widget>[
          Center(
            child: BoxPenjelasan(
                judul: "Buku KIA dibaca dan  dimengerti",
                deskripsi:
                    "oleh ibu, suami dan anggota keluarga lain. jangan malu untuk bertanya kepada dokter, bidan dan perawat, petugas kesehatan lain dan kader lain jika ada hal yang tidak dimengerti. ",
                textlogo: "Buku KIA dibaca dan  dimengerti"),
          )
        ],
      ),
    );
  }
}
