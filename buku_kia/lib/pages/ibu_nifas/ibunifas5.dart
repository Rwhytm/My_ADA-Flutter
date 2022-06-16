import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/themes/font.dart';
import 'package:buku_kia/widgets/deskripsi_widget.dart';
import 'package:buku_kia/widgets/judul_besar.dart';
import 'package:buku_kia/widgets/list_deskripsi.dart';
import 'package:buku_kia/widgets/peringatan_widget.dart';
import 'package:buku_kia/widgets/subtitle_biru.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IbuNifas5 extends StatelessWidget {
  const IbuNifas5({Key? key}) : super(key: key);

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
            const JudulBesar(judul: "TANDA BAHAYA PADA IBU NIFAS"),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                color: merahBox,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                width: width * 0.8,
                child: Center(
                    child: Text(
                  'Segera bawa ibu nifas ke fasilitas kesehatan (Puskesmas atau Rumah Sakit) bila ditemukan salah satu tanda bahaya di bawah ini',
                  style: GoogleFonts.poppins(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                'assets/images/bahaya_nifas.png',
                width: 350,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                color: hijauMuda,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                width: width * 0.8,
                child: Center(
                    child: Text(
                  'Tanyakan kepada bidan/perawat/dokter untuk penjelasan lebih lanjut terkait Keluarga Berencana',
                  style: GoogleFonts.poppins(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
