import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/widgets/judul_besar.dart';
import 'package:buku_kia/widgets/list_deskripsi.dart';
import 'package:buku_kia/widgets/subjudulBesar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimPeneliti extends StatelessWidget {
  const TimPeneliti({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: orangeMuda,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: orangeTua,
        centerTitle: true,
        title: Text(
          'TIM PENELITI',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: const <Widget>[
            JudulBesar(judul: "Tim Peneliti"),
            ListDeskripsiWidget(
              nomor: '1.',
              deskripsi:
                  'Yuniarti, SST, M.Kes ( Jurusan kebidanan Poltekkes Kemenkes Bengkulu)',
              padding: 15,
            ),
            ListDeskripsiWidget(
              nomor: '2.',
              deskripsi:
                  'DR. Susilo Damarini. SKM, MPH ( Jurusan kebidanan Poltekkes Kemenkes Bengkulu)',
              padding: 15,
            ),
            ListDeskripsiWidget(
              nomor: '3.',
              deskripsi:
                  'Elvi Destariyani, SST, M.Kes ( Jurusan kebidanan Poltekkes Kemenkes Bengkulu)',
              padding: 15,
            ),
            ListDeskripsiWidget(
              nomor: '4.',
              deskripsi:
                  'Erlin Puspita, SST, M.Keb ( Jurusan kebidanan Poltekkes Kemenkes Jakarta I )',
              padding: 15,
            ),
          ],
        ),
      ),
    );
  }
}
