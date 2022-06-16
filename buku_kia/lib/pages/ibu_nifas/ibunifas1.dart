import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/themes/font.dart';
import 'package:buku_kia/widgets/box_green.dart';
import 'package:buku_kia/widgets/deskripsi_widget.dart';
import 'package:buku_kia/widgets/judul_besar.dart';
import 'package:buku_kia/widgets/list_deskripsi.dart';
import 'package:buku_kia/widgets/subjudulBesar.dart';
import 'package:buku_kia/widgets/subtitle_biru.dart';
import 'package:flutter/material.dart';

class IbuNifas1 extends StatelessWidget {
  const IbuNifas1({Key? key}) : super(key: key);

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
                'Ibu Nifas',
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        ListDeskripsiWidget(
                          nomor: '1.',
                          deskripsi:
                              "Pelayanan kesehatan ibu nifas oleh bidan dan dokter dilaksanakan minimal 3 kali yaitu:",
                          padding: 5,
                        ),
                        ListDeskripsiWidget(
                          nomor: ' - ',
                          deskripsi:
                              "Pertama: 6 jam - 3 hari setelah melahirkan.",
                          padding: 5,
                        ),
                        ListDeskripsiWidget(
                          nomor: ' - ',
                          deskripsi:
                              "Kedua: hari ke 4 - 28 hari setelah melahirkan.",
                          padding: 5,
                        ),
                        ListDeskripsiWidget(
                          nomor: ' - ',
                          deskripsi:
                              "Ketiga: hari ke 29 - 42 hari setelah melahirkan.",
                          padding: 5,
                        ),
                        ListDeskripsiWidget(
                          nomor: '2.',
                          deskripsi: "Pelayanan kesehatan ibu nifas meliputi:",
                          padding: 5,
                        ),
                        ListDeskripsiWidget(
                          nomor: ' - ',
                          deskripsi: "Menanyakan kondisi ibu nifas secara umum",
                          padding: 5,
                        ),
                        ListDeskripsiWidget(
                          nomor: ' - ',
                          deskripsi:
                              "Pengukuran tekanan darah, suhu tubuh, pernapasan, dan nadi.",
                          padding: 5,
                        ),
                        ListDeskripsiWidget(
                          nomor: ' - ',
                          deskripsi: "Pemeriksaan lokhia dan perdarahan",
                          padding: 5,
                        ),
                        ListDeskripsiWidget(
                          nomor: ' - ',
                          deskripsi:
                              "Pemeriksaan kondisi jalan lahir dan tanda infeksi",
                          padding: 5,
                        ),
                        ListDeskripsiWidget(
                          nomor: ' - ',
                          deskripsi:
                              "Pemeriksaan kontraksi rahim dan tinggi fundus uteri",
                          padding: 5,
                        ),
                        ListDeskripsiWidget(
                          nomor: ' - ',
                          deskripsi:
                              "Pemeriksaan payudara dan anjuran pemberian ASI Eksklusif",
                          padding: 5,
                        ),
                        ListDeskripsiWidget(
                          nomor: ' - ',
                          deskripsi: "Pemberian Kapsul Vit. A",
                          padding: 5,
                        ),
                        ListDeskripsiWidget(
                          nomor: ' - ',
                          deskripsi: "Pelayanan kontrasepsi Pasca Persalinan",
                          padding: 5,
                        ),
                        ListDeskripsiWidget(
                          nomor: ' - ',
                          deskripsi: "Konseling.",
                          padding: 5,
                        ),
                        ListDeskripsiWidget(
                          nomor: ' - ',
                          deskripsi:
                              "Tatalaksana pada ibu nifas sakit atau ibu nifas dengan komplikasi.",
                          padding: 5,
                        ),
                        ListDeskripsiWidget(
                          nomor: ' - ',
                          deskripsi: "Memberikan nasihat yaitu:",
                          padding: 5,
                        ),
                        ListDeskripsiWidget(
                          nomor: ' - ',
                          deskripsi: "Konseling.",
                          padding: 5,
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/images/periksa_nifas.png',
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
                        'assets/images/turu.png',
                        width: 170,
                      ),
                    ],
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const <Widget>[
                        ListDeskripsiWidget(
                          nomor: ' - ',
                          deskripsi:
                              "Makan makanan yang beraneka ragam yang mengandung karbohidrat, protein hewani, protein nabati, sayur, dan buah-buahan",
                          padding: 5,
                        ),
                        ListDeskripsiWidget(
                          nomor: ' - ',
                          deskripsi:
                              "Kebutuhan air minum pada ibu menyusul pada 6 bulan pertama adalah 14 gelas sehari dan pada 6 bulan kedua adalah 12 gelas sehari.",
                          padding: 5,
                        ),
                        ListDeskripsiWidget(
                          nomor: ' - ',
                          deskripsi:
                              "Menjaga kebersihan diri, termasuk kebersihan daerah kemaluan, ganti pembalut sesering mungkin.",
                          padding: 5,
                        ),
                        ListDeskripsiWidget(
                          nomor: ' - ',
                          deskripsi:
                              "Istirahat cukup, saat bayi tidur ibu istirahat",
                          padding: 5,
                        ),
                        ListDeskripsiWidget(
                          nomor: ' - ',
                          deskripsi:
                              "Bagi ibu yang melahirkan dengan cara operasi caesar maka harus menjaga	kebersihan luka bekas operasi.",
                          padding: 5,
                        ),
                        ListDeskripsiWidget(
                          nomor: ' - ',
                          deskripsi:
                              "Cara menyusui yang benar dan hanya memberi ASI saja selama 6 bulan.",
                          padding: 5,
                        ),
                        ListDeskripsiWidget(
                          nomor: ' - ',
                          deskripsi: "Perawatan bayi yang benar.",
                          padding: 5,
                        ),
                        ListDeskripsiWidget(
                          nomor: ' - ',
                          deskripsi:
                              "Jangan membiarkan bayi menangis terlalu lama, karena akan membuat bayi stress.",
                          padding: 5,
                        ),
                        ListDeskripsiWidget(
                          nomor: ' - ',
                          deskripsi:
                              "Lakukan stimulasi komunikasi dengan bayi sedini mungkin bersama suami dan keluarga",
                          padding: 5,
                        ),
                        ListDeskripsiWidget(
                          nomor: ' - ',
                          deskripsi:
                              "Untuk berkonsultasi kepada tenaga kesehatan untuk pelayanan KB setelah persalinan. Memberikan nasihat yaitu:",
                          padding: 5,
                        ),
                      ],
                    ),
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
