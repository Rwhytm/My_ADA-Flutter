import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/themes/font.dart';
import 'package:buku_kia/widgets/judul_besar.dart';
import 'package:buku_kia/widgets/list_register.dart';
import 'package:buku_kia/widgets/subjudulBesar.dart';
import 'package:buku_kia/widgets/text_table.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Keluhan extends StatefulWidget {
  Keluhan({Key? key}) : super(key: key);

  @override
  State<Keluhan> createState() => _KeluhanState();
}

class _KeluhanState extends State<Keluhan> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: orangeTua,
        title: Text(
          'Catatan Kesehatan Ibu Hamil',
          style: judulAppBAr,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          )
        ],
        centerTitle: false,
      ),
      backgroundColor: putih,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const JudulBesar(judul: "Diisi oleh petugas kesehatan"),
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
                      pertanyaan: "Hari Pertama Haid Terakhir (HPHT), tanggal",
                      jawaban: "jawaban",
                    ),
                    ListRegistrasi(
                      pertanyaan: "Hari Taksiran Persalinan (HTP), tanggal",
                      jawaban: "jawaban",
                    ),
                    ListRegistrasi(
                      pertanyaan: "Lingkaran Lengan Atas",
                      jawaban: "jawaban",
                    ),
                    ListRegistrasi(
                      pertanyaan: "Golongan Darah",
                      jawaban: "jawaban",
                    ),
                    ListRegistrasi(
                      pertanyaan:
                          "Penggunaan kontrasepsi sebelum kehamilan ini",
                      jawaban: "jawaban",
                    ),
                    ListRegistrasi(
                      pertanyaan: "Riwayat penyakit yang diderita ibu",
                      jawaban: "jawaban",
                    ),
                    ListRegistrasi(
                      pertanyaan: "Riwayat Alergi",
                      jawaban: "jawaban",
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'Tambah Data',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
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
                      child: TextTable(text: 'Tgl', align: TextAlign.center),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: TextTable(
                          text: 'Keluhan Sekarang', align: TextAlign.center),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: TextTable(
                          text: 'Tekanan Darah (mmHg)',
                          align: TextAlign.center),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: TextTable(
                          text: 'Berat Badan (Kg)', align: TextAlign.center),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: TextTable(
                          text: 'Umur Kehamilan (Minggu)',
                          align: TextAlign.center),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: TextTable(
                          text: 'Tinggi Fundus (Cm)', align: TextAlign.center),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: TextTable(
                          text: 'Letak Janin Kep/Su/Li',
                          align: TextAlign.center),
                    ),
                    TableCell(
                      verticalAlignment: TableCellVerticalAlignment.middle,
                      child: TextTable(
                          text: 'Denyut Jantung Janin/Menit',
                          align: TextAlign.center),
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
