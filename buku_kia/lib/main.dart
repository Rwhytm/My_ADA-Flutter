import 'package:buku_kia/pages/ibu_bersalin/ibubersalin1.dart';
import 'package:buku_kia/pages/ibu_bersalin/ibubersalin2.dart';
import 'package:buku_kia/pages/ibu_bersalin/ibubersalin3.dart';
import 'package:buku_kia/pages/ibu_hamil/ibuhamil1.dart';
import 'package:buku_kia/pages/ibu_hamil/ibuhamil2.dart';
import 'package:buku_kia/pages/ibu_hamil/ibuhamil3.dart';
import 'package:buku_kia/pages/ibu_hamil/ibuhamil4.dart';
import 'package:buku_kia/pages/ibu_hamil/ibuhamil5.dart';
import 'package:buku_kia/pages/ibu_hamil/ibuhamil6.dart';
import 'package:buku_kia/pages/ibu_hamil/ibuhamil7.dart';
import 'package:buku_kia/pages/ibu_hamil/ibuhamil8.dart';
import 'package:buku_kia/pages/ibu_nifas/ibunifas1.dart';
import 'package:buku_kia/pages/ibu_nifas/ibunifas2.dart';
import 'package:buku_kia/pages/ibu_nifas/ibunifas3.dart';
import 'package:buku_kia/pages/ibu_nifas/ibunifas4.dart';
import 'package:buku_kia/pages/ibu_nifas/ibunifas5.dart';
import 'package:buku_kia/pages/keluarga_berencana/keluargaberencana.dart';
import 'package:buku_kia/pages/penjelasan_umum.dart';
import 'package:buku_kia/pages/splash_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: KeluargaBerencana(),
    );
  }
}
