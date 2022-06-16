import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/themes/font.dart';
import 'package:buku_kia/widgets/deskripsi_widget.dart';
import 'package:buku_kia/widgets/judul_besar.dart';
import 'package:buku_kia/widgets/list_deskripsi.dart';
import 'package:buku_kia/widgets/peringatan_widget.dart';
import 'package:buku_kia/widgets/subtitle_biru.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IbuNifas4 extends StatelessWidget {
  const IbuNifas4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: orangeMuda,
      appBar: AppBar(
        backgroundColor: orangeTua,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Ibu Nifas',
                style: judulAppBAr,
              ),
            ),
          ),
        ],
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const JudulBesar(judul: "CARA MEMERAH DAN MENYIMPAN ASI"),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                'assets/images/memerah.png',
                width: 350,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const JudulBesar(judul: "PENYIMPANAN ASI PERAH (ASIP)"),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                'assets/images/suhu_asi.png',
                width: 350,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
