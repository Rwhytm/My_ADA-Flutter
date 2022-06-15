import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/themes/font.dart';
import 'package:buku_kia/widgets/deskripsi_widget.dart';
import 'package:buku_kia/widgets/subjudulBesar.dart';
import 'package:buku_kia/widgets/subtitle_biru.dart';
import 'package:flutter/material.dart';

class IbuHamil2 extends StatelessWidget {
  const IbuHamil2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        SubTitleBiru(
                            angka: '5.',
                            judul: 'Penentuan letak janin',
                            padding: 5),
                        DeskripsiWidget(
                            deskripsi:
                                'apabila trimester III bagian bawah janin bukan kepala atau kepala belum masuk panggul, kemungkinan ada kelainan letak atau ada masalah lain. Bila denyut jantung janin kurang dari 120 kali/menit atau lebih dari 160 kali/menit menunjukkan ada tanda GAWAT JANIN,SEGERA RUJUK.',
                            padding: 15),
                        SubTitleBiru(
                            angka: '2.',
                            judul: 'Pengukuran tekanan darah (tensi)',
                            padding: 5),
                        DeskripsiWidget(
                            deskripsi:
                                'oleh petugas untuk selanjutnya bilamana diperlukan mendapatkan suntikan tetanus toksoid sesuai anjuran petugas kesehatan untuk mencegah tetanus pada Ibu dan Bayi.',
                            padding: 15),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/images/periksa_kehamilan2.png',
                    width: 150,
                  ),
                ],
              ),
            ),
            const SubJudulBesar(
              judul:
                  "Tabel rentang waktu pemberian imunisasi TT dan lama perlindungannya :",
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.all(10),
                child: Image.asset(
                  'assets/images/tabel_imunisasi.png',
                  width: 360,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        SubTitleBiru(
                            angka: '7.',
                            judul: 'Pemberian tablet tambah darah',
                            padding: 5),
                        DeskripsiWidget(
                            deskripsi:
                                'ibu hamil sejak awal kehamilan	minum	1	tablet tambah darah setiap hari  minimal selama 90 hari. Tablet	 tambah	 darah	 diminum pada malam hari untuk mengurangi rasa mual.',
                            padding: 15),
                        SubTitleBiru(
                            angka: '2.',
                            judul: 'Pengukuran tekanan darah (tensi)',
                            padding: 5),
                        DeskripsiWidget(
                            deskripsi:
                                'oleh petugas untuk selanjutnya bilamana diperlukan mendapatkan suntikan tetanus toksoid sesuai anjuran petugas kesehatan untuk mencegah tetanus pada Ibu dan Bayi.',
                            padding: 15),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/images/periksa_kehamilan3.png',
                    width: 150,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
