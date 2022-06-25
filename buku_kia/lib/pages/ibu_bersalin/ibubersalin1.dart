import 'package:buku_kia/pages/ibu_bersalin/ibubersalin2.dart';
import 'package:flutter/material.dart';

import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/themes/font.dart';
import 'package:buku_kia/widgets/judul_besar.dart';
import 'package:buku_kia/widgets/list_deskripsi.dart';
import 'package:buku_kia/widgets/subtitle_biru.dart';
import 'package:google_fonts/google_fonts.dart';

class IbuBersalin1 extends StatelessWidget {
  const IbuBersalin1({Key? key}) : super(key: key);

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
          children: <Widget>[
            const JudulBesar(judul: "TANDA AWAL PERSALINAN"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  'assets/images/mulas.png',
                  width: 150,
                ),
                SizedBox(
                  width: 20,
                ),
                Image.asset(
                  'assets/images/keluar_lendir.png',
                  width: 150,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(25),
              child: Center(
                child: Image.asset(
                  'assets/images/salaman.png',
                  width: 400,
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: 20,
            right: 30,
            child: FloatingActionButton(
              backgroundColor: orangeTua,
              heroTag: 'next',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => new IbuBersalin2(),
                  ),
                );
              },
              child: const Icon(
                Icons.arrow_right,
                size: 40,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          // Add more floating buttons if you want
          // There is no limit
        ],
      ),
    );
  }
}
