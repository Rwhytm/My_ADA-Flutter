import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/themes/font.dart';
import 'package:buku_kia/widgets/box_green.dart';
import 'package:buku_kia/widgets/deskripsi_widget.dart';
import 'package:buku_kia/widgets/judul_besar.dart';
import 'package:buku_kia/widgets/list_deskripsi.dart';
import 'package:buku_kia/widgets/subjudulBesar.dart';
import 'package:buku_kia/widgets/subtitle_biru.dart';
import 'package:flutter/material.dart';

class IbuHamil4 extends StatelessWidget {
  const IbuHamil4({Key? key}) : super(key: key);

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
            const JudulBesar(judul: "PERAWATAN SEHARI-HARI"),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        SubTitleBiru(
                            angka: '1.',
                            judul:
                                'Makan beragam makanan secara proporsional dengan pola gizi seimbang dan 1 porsi lebih banyak daripada sebelum hamil.',
                            padding: 5),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/images/perawatan_sehari-hari1.png',
                    width: 150,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/istirahat_cukup1.png',
                        width: 150,
                      ),
                      Image.asset(
                        'assets/images/istirahat_cukup2.png',
                        width: 150,
                      ),
                    ],
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        SubTitleBiru(
                            angka: '2.',
                            judul: 'Istirahat yang cukup',
                            padding: 15),
                        ListDeskripsiWidget(
                          nomor: "1.",
                          deskripsi:
                              "Di kelas ibu hamil, ibu mendapatkan informasi dan saling bertukar informasi mengenai ke hamilan, persalinan, nifas serta perawatan bayi baru lahir. ikuti kelas ibu hamil paling sedikit 4 kali pertemuan, sebaiknya 1 kali pertemuan dihadiri bersama suami/keluarga.",
                          padding: 15,
                        ),
                        ListDeskripsiWidget(
                          nomor: "2.",
                          deskripsi: "Posisi tidur sebaiknya miring ke kiri.",
                          padding: 15,
                        ),
                        ListDeskripsiWidget(
                          nomor: "3.",
                          deskripsi:
                              "Pada daerah endemis malaria gunakan kelambu berinsektisida.",
                          padding: 15,
                        ),
                        ListDeskripsiWidget(
                          nomor: "4.",
                          deskripsi:
                              "Bersama dengan suami lakukan	rangsangan/stimulasi pada janin dengan sering mengelus-elus perut ibu dan ajak janin bicara sejak usia kandungan 4 bulan.",
                          padding: 15,
                        ),
                      ],
                    ),
                  ),
                ],
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
                            angka: '2.',
                            judul: 'Istirahat yang cukup',
                            padding: 15),
                        ListDeskripsiWidget(
                          nomor: "1.",
                          deskripsi:
                              "Cuci tangan dengan sabun dan air bersih mengalir sebelum makan, setelah buang air besar dan buang air kecil.",
                          padding: 15,
                        ),
                        ListDeskripsiWidget(
                          nomor: "2.",
                          deskripsi:
                              "Menyikat gigi secara benar dan teratur minimal setelah sarapan dan sebelum tidur.",
                          padding: 15,
                        ),
                        ListDeskripsiWidget(
                          nomor: "3.",
                          deskripsi: "Mandi 2 kali sehari",
                          padding: 15,
                        ),
                        ListDeskripsiWidget(
                          nomor: "4.",
                          deskripsi: "Bersihkan payudara dan daerah kemaluan.",
                          padding: 15,
                        ),
                        ListDeskripsiWidget(
                          nomor: "5.",
                          deskripsi:
                              "Ganti pakaian dan pakaian dalam setiap hari.",
                          padding: 15,
                        ),
                        ListDeskripsiWidget(
                          nomor: "6.",
                          deskripsi:
                              "Periksakan gigi ke fasilitas kesehatan pada saat periksa kehamilan.",
                          padding: 15,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/keramas.png',
                        width: 150,
                      ),
                    ],
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
