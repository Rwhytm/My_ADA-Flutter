import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/themes/font.dart';
import 'package:buku_kia/widgets/box_orange.dart';
import 'package:buku_kia/widgets/deskripsi_widget.dart';
import 'package:buku_kia/widgets/judul_besar.dart';
import 'package:buku_kia/widgets/subjudulBesar.dart';
import 'package:buku_kia/widgets/subtitle_biru.dart';
import 'package:flutter/material.dart';

class IbuBersalin2 extends StatelessWidget {
  const IbuBersalin2({Key? key}) : super(key: key);

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
            const JudulBesar(judul: 'PERIKSA KEHAMILAN'),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        DeskripsiWidget(
                            deskripsi:
                                'Didahului dengan mulas teratur, semakin lama semakin kuat dan sering.',
                            padding: 15),
                        DeskripsiWidget(
                            deskripsi:
                                'Pada kehamilan pertama, bayi biasanya lahir setelah 12 jam sejak mules teratur. Pada kehamilan kedua dan kehamilan berikutnya, biasanya bayi lahir setelah 8 jam sejak mules teratur. Ibu masih boleh berjalan, makan dan minum. Selama proses melahirkan sebaiknya ibu didampingi suami dan keluarga.',
                            padding: 15),
                        DeskripsiWidget(
                            deskripsi:
                                'Jika terasa sakit, tarik nafas panjang lewat hidung, lalu keluarkan lewat mulut.',
                            padding: 15),
                        DeskripsiWidget(
                            deskripsi:
                                'Jika terasa ingin buang air besarsegera beritahu bidan/dokter. Bidan atau dokter akan mengarahkan/ memimpin ibu mengejan sesuai dengan dorongan rasa ingin mengejan yang timbul.',
                            padding: 15),
                        DeskripsiWidget(
                            deskripsi:
                                'IMD adalah segera meletakkan bayi di dada ibu (ada kontak kulit ibu dan kulit bayi sekurang kurangnya 1 jam untuk memberikan kesempatan kepada bayi menyusu sesegera mungkin).',
                            padding: 15),
                        DeskripsiWidget(
                            deskripsi:
                                'IMD merangsang keluarnya ASI, memberi kekebalan pada bayi serta meningkatkan kekuatan batin antara ibu dan bayinya. IMD mencegah pendarahan pada ibu.',
                            padding: 15),
                        DeskripsiWidget(
                            deskripsi:
                                'Ibu dapat segera dipasang IUD dalam waktu 10 menit setelah plasenta lahir bila ibu dan suami sepakat untuk mengikuti KB dengan metode AKDR (Alat Kontrasepsi Dalam Rahim).',
                            padding: 15),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/images/proses_melahirkan.png',
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
