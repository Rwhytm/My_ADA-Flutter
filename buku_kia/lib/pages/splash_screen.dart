import 'dart:async';

import 'package:buku_kia/pages/daftar_isi.dart';
import 'package:buku_kia/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    splashTimer();
    super.initState();
  }

  Future<Timer> splashTimer() async {
    return Timer(Duration(seconds: 4), onDone);
  }

  void onDone() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => DaftarIsi(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPink,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "BUKU KIA",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/images/sampul.png',
              width: 300,
            ),
          ],
        ),
      ),
    );
    ;
  }
}
