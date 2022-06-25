import 'package:buku_kia/pages/daftar_isi.dart';
import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/themes/font.dart';
import 'package:buku_kia/widgets/deskripsi_widget.dart';
import 'package:buku_kia/widgets/judul_besar.dart';
import 'package:buku_kia/widgets/list_deskripsi.dart';
import 'package:buku_kia/widgets/peringatan_widget.dart';
import 'package:buku_kia/widgets/subjudulBesar.dart';
import 'package:buku_kia/widgets/subtitle_biru.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KeluargaBerencana extends StatelessWidget {
  const KeluargaBerencana({Key? key}) : super(key: key);

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
                'Keluarga Berencana',
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
            const SizedBox(
              height: 15,
            ),
            const DeskripsiWidget(
                deskripsi:
                    'KB Pasca persalinan adalah pemanfaatan atau penggunaan alat kontrasepsi langsung sesudah melahirkan sampai 6 minggu/42 hari sesudah melahirkan. Prinsip pemilihan metode kontrasepsi yang digunakan tidak mengganggu produksi ASI.',
                padding: 15),
            const SubJudulBesar(judul: "Mengapa perlu ikut ber KB?"),
            const ListDeskripsiWidget(
                nomor: " - ",
                deskripsi:
                    "Mengatur jarak dan mencegah kehamilan agar tidak terlalu rapat (minimal 2 tahun setelah melahirkan)",
                padding: 15),
            const ListDeskripsiWidget(
                nomor: " - ",
                deskripsi: "Mencegah kehamilan yang tidak diinginkan",
                padding: 15),
            const ListDeskripsiWidget(
                nomor: " - ",
                deskripsi:
                    "Menjaga dan meningkatkan kesehatan ibu, bayi dan balita.",
                padding: 15),
            const ListDeskripsiWidget(
                nomor: " - ",
                deskripsi:
                    "Ibu memiliki waktu dan perhatian yang cukup untuk dirinya sendiri, anak dan keluarga",
                padding: 15),
            const SubJudulBesar(judul: "Metode kontrasepsi jangka panjang:"),
            const ListDeskripsiWidget(
                nomor: " - ",
                deskripsi:
                    "Metode Operasi Wanita (MOW), metode Operasi Pria (MOP)",
                padding: 15),
            const ListDeskripsiWidget(
                nomor: " - ",
                deskripsi:
                    "Alat Kontrasepsi Dalam Rahim (AKDR)/spiral, jangka waktu	penggunaan bisa sampai 10 tahun.",
                padding: 15),
            const ListDeskripsiWidget(
                nomor: " - ",
                deskripsi:
                    "Implan (alat kontrasepsi bawah kulit), jangka waktu penggunaan 3 tahun.",
                padding: 15),
            const SubJudulBesar(judul: "Metode kontrasepsi jangka pendek:"),
            const ListDeskripsiWidget(
                nomor: " - ",
                deskripsi:
                    "Suntik, terdapat 2 jenis suntikan yaitu suntikan 1 bulan dan suntikan 3 bulan. Untuk ibu menyusui, tidak disarankan menggunakan suntikan 1 bulan, karena akan mengganggu produksi ASI",
                padding: 15),
            const ListDeskripsiWidget(
                nomor: " - ", deskripsi: "Pil KB.", padding: 15),
            const ListDeskripsiWidget(
                nomor: " - ", deskripsi: "Kondom", padding: 15),
            Padding(
              padding: EdgeInsets.all(25),
              child: Center(
                child: Image.asset(
                  'assets/images/kontrasepsi.png',
                  width: 350,
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 30,
            bottom: 20,
            child: FloatingActionButton(
              backgroundColor: orangeTua,
              heroTag: 'back',
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_left,
                size: 40,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 30,
            child: FloatingActionButton(
              backgroundColor: orangeTua,
              heroTag: 'next',
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => new DaftarIsi(),
                  ),
                );
              },
              child: const Icon(
                Icons.home,
                size: 40,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          // Add more floating buttons if you want
          // There is no limit
        ],
      ),
    );
  }
}
