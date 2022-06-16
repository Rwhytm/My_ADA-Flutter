import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/themes/font.dart';
import 'package:buku_kia/widgets/judul_besar.dart';
import 'package:buku_kia/widgets/list_deskripsi.dart';
import 'package:buku_kia/widgets/subtitle_biru.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IbuHamil8 extends StatelessWidget {
  const IbuHamil8({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
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
                'Ibu Hamil',
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
          children: <Widget>[
            const JudulBesar(judul: "TANDA BAHAYA PADA KEHAMILAN"),
            Center(
              child: Container(
                color: merahBox,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                width: size * 0.8,
                child: Center(
                    child: Text(
                  'Segera bawa ibu hamil ke puskesmas, rumah sakit, dokter dan bidan bila dijumpai keluhan dan tanda-tanda di bawah ini',
                  style: GoogleFonts.poppins(
                    color: putih,
                    fontWeight: FontWeight.w600,
                  ),
                )),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(25),
              child: Center(
                child: Image.asset(
                  'assets/images/tanda_bahaya.png',
                  width: 300,
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                width: size * 0.8,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: hijauMuda,
                ),
                child: Center(
                  child: Text(
                    'YANG HARUS DIHINDARI IBU SELAMA HAMIL',
                    style: judulHitamPudarTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
