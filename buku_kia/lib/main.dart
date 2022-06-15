import 'package:buku_kia/pages/ibu_hamil/ibuhamil1.dart';
import 'package:buku_kia/pages/ibu_hamil/ibuhamil2.dart';
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
      home: IbuHamil2(),
    );
  }
}
