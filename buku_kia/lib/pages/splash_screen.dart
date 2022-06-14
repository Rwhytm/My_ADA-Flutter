import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              "BUKU KIA",
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            Image.asset(
              'assets/images/sampul.png',
              width: 300,
            ),
          ],
        ),
      ),
    );
  }
}
