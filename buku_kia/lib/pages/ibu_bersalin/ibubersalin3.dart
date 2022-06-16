import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/themes/font.dart';
import 'package:buku_kia/widgets/deskripsi_widget.dart';
import 'package:buku_kia/widgets/judul_besar.dart';
import 'package:buku_kia/widgets/list_deskripsi.dart';
import 'package:buku_kia/widgets/peringatan_widget.dart';
import 'package:buku_kia/widgets/subtitle_biru.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IbuBersalin3 extends StatelessWidget {
  const IbuBersalin3({Key? key}) : super(key: key);

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
                'Ibu Bersalin',
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
            const Center(
                child: PeringatanWidget(text: "TANDA BAHAYA PADA PERSALINAN")),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Image.asset(
                        'assets/images/pendarahan.png',
                        width: 150,
                      ),
                    ),
                    Container(
                      width: width * 0.5,
                      child: const SubTitleBiru(
                        angka: "",
                        judul: "Pendarahan lewat jalan lahir",
                        padding: 15,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Image.asset(
                        'assets/images/kejang.png',
                        width: 150,
                      ),
                    ),
                    Container(
                      width: width * 0.5,
                      child: const SubTitleBiru(
                        angka: "",
                        judul: "Pendarahan lewat jalan lahir",
                        padding: 15,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Image.asset(
                        'assets/images/ketuban.png',
                        width: 150,
                      ),
                    ),
                    Container(
                      width: width * 0.5,
                      child: const SubTitleBiru(
                        angka: "",
                        judul: "Air ketuban keruh dan berbau",
                        padding: 15,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Image.asset(
                        'assets/images/keluar_tangan.png',
                        width: 150,
                      ),
                    ),
                    Container(
                      width: width * 0.5,
                      child: const SubTitleBiru(
                        angka: "",
                        judul:
                            "Tali pusar atau tangan bayi keluar dari jalan lahir",
                        padding: 15,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Image.asset(
                        'assets/images/mengejan.png',
                        width: 150,
                      ),
                    ),
                    Container(
                      width: width * 0.5,
                      child: const SubTitleBiru(
                        angka: "",
                        judul: "Ibu tidak kuat mengejan",
                        padding: 15,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Image.asset(
                        'assets/images/gelisah.png',
                        width: 150,
                      ),
                    ),
                    Container(
                      width: width * 0.5,
                      child: const SubTitleBiru(
                        angka: "",
                        judul:
                            "Ibu gelisah atau mengalami kesakitan yang hebat",
                        padding: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                color: merahBox,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                width: width * 0.8,
                child: Center(
                    child: Text(
                  'Jika muncul salah satu tanda di atas SEGERA RUJUK IBU KE RUMAH SAKIT',
                  style: GoogleFonts.poppins(
                    color: putih,
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
