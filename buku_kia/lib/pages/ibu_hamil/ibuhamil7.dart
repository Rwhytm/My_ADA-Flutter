import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/themes/font.dart';
import 'package:buku_kia/widgets/deskripsi_widget.dart';
import 'package:buku_kia/widgets/judul_besar.dart';
import 'package:buku_kia/widgets/list_deskripsi.dart';
import 'package:buku_kia/widgets/subtitle_biru.dart';
import 'package:flutter/material.dart';

class IbuHamil7 extends StatelessWidget {
  const IbuHamil7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
          children: [
            const JudulBesar(judul: "PERSIAPAN MELAHIRKAN (BERSALIN)"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Image.asset(
                        'assets/images/konsultasi.png',
                        width: 150,
                      ),
                    ),
                    Container(
                      width: width * 0.5,
                      child: Column(
                        children: const <Widget>[
                          ListDeskripsiWidget(
                            nomor: " - ",
                            deskripsi:
                                "Tanyakan	kepada bidan dan dokter tanggal perkiraan persalinan.",
                            padding: 25,
                          ),
                          ListDeskripsiWidget(
                            nomor: " - ",
                            deskripsi:
                                "Suami atau keluarga mendampingi ibu saat periksa kehamilan.",
                            padding: 25,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Image.asset(
                        'assets/images/asuransi.png',
                        width: 150,
                      ),
                    ),
                    Container(
                      width: width * 0.5,
                      child: Column(
                        children: const <Widget>[
                          ListDeskripsiWidget(
                            nomor: " - ",
                            deskripsi:
                                "Persiapkan tabungan atau dana cadangan untuk biaya persalinan dan biaya lainnya.",
                            padding: 25,
                          ),
                          ListDeskripsiWidget(
                            nomor: " - ",
                            deskripsi:
                                "Siapkan Kartu Jaminan Kesehatan Nasional.",
                            padding: 25,
                          ),
                          ListDeskripsiWidget(
                            nomor: " - ",
                            deskripsi:
                                "Untuk memperoleh Kartu JKN, daftarkan diri anda ke kantor BPJS Kesehatan setempat, atau tanyakan ke petugas Puskesmas.",
                            padding: 25,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Image.asset(
                        'assets/images/rumah.png',
                        width: 150,
                      ),
                    ),
                    Container(
                      width: width * 0.5,
                      child: Column(
                        children: const <Widget>[
                          ListDeskripsiWidget(
                            nomor: " - ",
                            deskripsi:
                                "Rencanakan	melahirkan ditolong oleh dokter atau bidan di fasilitas kesehatan.",
                            padding: 25,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Image.asset(
                        'assets/images/baju.png',
                        width: 150,
                      ),
                    ),
                    Container(
                      width: width * 0.5,
                      child: Column(
                        children: const <Widget>[
                          ListDeskripsiWidget(
                            nomor: " - ",
                            deskripsi:
                                "Siapkan KTP, Kartu Keluarga, dan keperluan lain untuk ibu dan bayi yang akan dilahirkan.",
                            padding: 25,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Image.asset(
                        'assets/images/sakit.png',
                        width: 150,
                      ),
                    ),
                    Container(
                      width: width * 0.5,
                      child: Column(
                        children: const <Widget>[
                          ListDeskripsiWidget(
                            nomor: " - ",
                            deskripsi:
                                "Siapkan lebih dari 1 orang yang memiliki golongan darah yang sama dan bersedia menjadi pendonor jika diperlukan.",
                            padding: 25,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Image.asset(
                        'assets/images/ambulance.png',
                        width: 150,
                      ),
                    ),
                    Container(
                      width: width * 0.5,
                      child: Column(
                        children: const <Widget>[
                          ListDeskripsiWidget(
                            nomor: " - ",
                            deskripsi:
                                "Suami, keluarga dan masyarakat. menyiapkan kendaraan jika sewaktu-waktu diperlukan.",
                            padding: 25,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Image.asset(
                        'assets/images/nempel.png',
                        width: 150,
                      ),
                    ),
                    Container(
                      width: width * 0.5,
                      child: Column(
                        children: const <Widget>[
                          ListDeskripsiWidget(
                            nomor: " - ",
                            deskripsi:
                                "Pastikan ibu hamil dan keluarga menyepakati amanat persalinan dalam stiker P4K dan sudah ditempelkan di depan rumah ibu hamil.",
                            padding: 25,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Image.asset(
                        'assets/images/konsultasi2.png',
                        width: 150,
                      ),
                    ),
                    Container(
                      width: width * 0.5,
                      child: Column(
                        children: const <Widget>[
                          ListDeskripsiWidget(
                            nomor: " - ",
                            deskripsi:
                                "Rencanakan ikut Keluarga Berencana (KB) setelah bersalin. Tanyakan ke petugas kesehatan tentang cara ber-KB.",
                            padding: 25,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
