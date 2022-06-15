import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/themes/font.dart';
import 'package:buku_kia/widgets/box_green.dart';
import 'package:buku_kia/widgets/deskripsi_widget.dart';
import 'package:buku_kia/widgets/subjudulBesar.dart';
import 'package:buku_kia/widgets/subtitle_biru.dart';
import 'package:flutter/material.dart';

class IbuHamil3 extends StatelessWidget {
  const IbuHamil3({Key? key}) : super(key: key);

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
                            angka: '9.',
                            judul: 'Konseling penjelasan',
                            padding: 5),
                        DeskripsiWidget(
                            deskripsi:
                                'Tenaga kesehatan memberi penjelasan mengenai perawatan kehamilan, pencegahan kelainan bawaan, persalinan dan inisiasi menyusu dini (IMD), nifas, perawatan bayi baru lahir, ASI eksklusif, Keluarga Berencana dan imunisasi pada bayi. Penjelasan ini diberikan secara bertahap pada saat kunjungan ibu hamil.',
                            padding: 15),
                        SubTitleBiru(
                            angka: '10.',
                            judul: 'Tata laksana atau mendapatkan pengobatan',
                            padding: 5),
                        DeskripsiWidget(
                            deskripsi:
                                'jika ibu mempunyai masalah kesehatan pada saat hamil.',
                            padding: 15),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/images/periksa_kehamilan4.png',
                    width: 150,
                  ),
                ],
              ),
            ),
            Center(
              child: BoxGreen(
                widget: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    SubTitleBiru(
                      angka: '',
                      judul: "Ikuti kelas ibu",
                      padding: 15,
                    ),
                    SubJudulBesar(
                      judul: "1. Kelas Ibu Hamil",
                    ),
                    DeskripsiWidget(
                        deskripsi:
                            "Di kelas ibu hamil, ibu mendapatkan informasi dan saling bertukar informasi mengenai ke hamilan, persalinan, nifas serta perawatan bayi baru lahir. ikuti kelas ibu hamil paling sedikit 4 kali pertemuan, sebaiknya 1 kali pertemuan dihadiri bersama suami/keluarga.",
                        padding: 15),
                    SubJudulBesar(
                      judul: "2. Kelas Ibu Balita",
                    ),
                    DeskripsiWidget(
                        deskripsi:
                            "Di kelas ibu balita, ibu mendapatkan informasi dan saling bertukar informasi mengenai tumbuh kembang, imunisasi, gizi, perawatan bayi dan balita serta penyakit yang sering pada bayi dan balita.",
                        padding: 15),
                    Padding(
                      padding: EdgeInsets.only(top: 25, bottom: 25),
                      child: Center(
                        child: SubTitleBiru(
                            angka: '',
                            judul: 'Tata laksana atau mendapatkan pengobatan',
                            padding: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
