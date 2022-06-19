import 'dart:ui';

import 'package:buku_kia/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//judul besar
TextStyle judulHitamPudarTextStyle = GoogleFonts.poppins(
  color: subtitleHitam,
  fontSize: 15,
  fontWeight: FontWeight.w900,
);

TextStyle peringatanMerahTextStyle = GoogleFonts.poppins(
  color: merahBox,
  fontSize: 15,
  fontWeight: FontWeight.w900,
);

//subjudulbesar
TextStyle subjudulHitamPudarTextStyle = GoogleFonts.poppins(
  color: subtitleHitam,
  fontSize: 10,
  fontWeight: FontWeight.w800,
);

TextStyle judulAppBAr = GoogleFonts.poppins(
  color: putih,
  fontSize: 20,
  fontWeight: FontWeight.w700,
  shadows: <Shadow>[
    const Shadow(
      offset: Offset(5.0, 5.0),
      blurRadius: 25.0,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
  ],
);

TextStyle daftarIsi = GoogleFonts.poppins(
  color: putih,
  fontSize: 10,
  fontWeight: FontWeight.w600,
);

TextStyle judulBiru = GoogleFonts.poppins(
  color: subtitleBiru,
  fontSize: 11,
  fontWeight: FontWeight.w900,
);

TextStyle penjelasanTextStyle = GoogleFonts.roboto(
  color: putih,
  fontSize: 13,
);

TextStyle deskripsiHitamTextStyle = GoogleFonts.roboto(
  color: Colors.black,
  fontSize: 11,
);

TextStyle textLogoTextStyle = GoogleFonts.poppins(
  color: putih,
  fontWeight: FontWeight.bold,
  fontSize: 10,
);
