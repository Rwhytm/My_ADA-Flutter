import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/themes/font.dart';
import 'package:buku_kia/widgets/list_deskripsi.dart';
import 'package:buku_kia/widgets/subtitle_biru.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IbuHamil6 extends StatelessWidget {
  const IbuHamil6({Key? key}) : super(key: key);

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
            Padding(
              padding: EdgeInsets.all(5),
              child: Center(
                child: Image.asset(
                  'assets/images/pola_makan.png',
                  width: 300,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Center(
                child: Image.asset(
                  'assets/images/sayur.png',
                  width: 500,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Center(
                child: Image.asset(
                  'assets/images/pola_makan2.png',
                  width: 350,
                ),
              ),
            ),
            Center(
              child: Container(
                width: size * 0.8,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: hijauMuda,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      'Tanyakan kepada Bidan/Perawat/Dokter untuk penjelasan lebih lanjut terkait kehamilan',
                      style: judulHitamPudarTextStyle,
                      textAlign: TextAlign.center,
                    ),
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
