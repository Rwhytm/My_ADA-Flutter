import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/themes/font.dart';
import 'package:buku_kia/widgets/judul_besar.dart';
import 'package:buku_kia/widgets/list_register.dart';
import 'package:buku_kia/widgets/subjudulBesar.dart';
import 'package:buku_kia/widgets/text_table.dart';
import 'package:flutter/material.dart';

class Pemeriksaan extends StatefulWidget {
  Pemeriksaan({Key? key}) : super(key: key);

  @override
  State<Pemeriksaan> createState() => _PemeriksaanState();
}

class _PemeriksaanState extends State<Pemeriksaan> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orangeTua,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Catatan Kesehatan Ibu Hamil',
                style: judulAppBAr,
              ),
            ),
          ),
        ],
        centerTitle: false,
      ),
      backgroundColor: putih,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            JudulBesar(judul: "Diisi oleh petugas kesehatan"),
            Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                width: width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(27),
                  color: orangeMuda,
                ),
                child: Column(
                  children: const <Widget>[
                    ListRegistrasi(
                      pertanyaan: "Hamil ke",
                      jawaban: "jawaban",
                    ),
                    ListRegistrasi(
                      pertanyaan: "Jumlah anak hidup",
                      jawaban: "jawaban",
                    ),
                    ListRegistrasi(
                      pertanyaan: "Jumlah anak lahir kurang bulan",
                      jawaban: "jawaban",
                    ),
                    ListRegistrasi(
                      pertanyaan:
                          "Jarak kehamilan ini dengan persalinan terakhir",
                      jawaban: "jawaban",
                    ),
                    ListRegistrasi(
                      pertanyaan: "status imunisasi TT terakhir",
                      jawaban: "jawaban",
                    ),
                    ListRegistrasi(
                      pertanyaan: "Penolong persalinan terakhir",
                      jawaban: "jawaban",
                    ),
                    ListRegistrasi(
                      pertanyaan: "Cara Persalinan terakhir",
                      jawaban: "jawaban",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Table(
              border: TableBorder.all(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 2,
              ),
              children: const [
                TableRow(
                  children: [
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: TextTable(
                          text: 'Kaki Bengkak', align: TextAlign.center),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: TextTable(
                          text: 'Hasil Pemeriksaan Laboratorium',
                          align: TextAlign.center),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: TextTable(
                          text:
                              'Tindakan (Pemberian TT, Fe, terapi, rujukan, umpan balik)',
                          align: TextAlign.center),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: TextTable(
                          text: 'Nasihat yang disampaikan',
                          align: TextAlign.center),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: TextTable(
                          text: 'Keterangan \nTempat Pelayanan\nNama Pemeriksa',
                          align: TextAlign.center),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: TextTable(
                          text: 'Kapan Harus Kembali', align: TextAlign.center),
                    ),
                  ],
                ),
              ],
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(10),
                width: width * 0.991,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(27),
                  color: orangeMuda,
                ),
                child: Column(
                  children: const <Widget>[],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
