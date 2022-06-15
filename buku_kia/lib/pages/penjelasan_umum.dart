import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/themes/font.dart';
import 'package:buku_kia/widgets/box_penjelasan.dart';
import 'package:flutter/material.dart';

class Penjelasan extends StatelessWidget {
  const Penjelasan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPink,
      appBar: AppBar(
        backgroundColor: appBarUngu,
        actions: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'Penjelasan Umum',
              style: judulAppBAr,
            ),
          ),
        ],
        centerTitle: false,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        child: Center(
          child: Column(
            children: const <Widget>[
              BoxPenjelasan(
                judul: "Buku KIA dibaca dan  dimengerti",
                deskripsi:
                    "oleh ibu, suami dan anggota keluarga lain. jangan malu untuk bertanya kepada dokter, bidan dan perawat, petugas kesehatan lain dan kader lain jika ada hal yang tidak dimengerti. ",
                textlogo: "Buku KIA dibaca dan  dimengerti",
              ),
              BoxPenjelasan(
                judul: "Buku KIA selalu dibawa",
                deskripsi: "list",
                textlogo: "Selalu dibawa",
              ),
              BoxPenjelasan(
                judul: "Buku KIA dijaga, jangan rusak dan hilang",
                deskripsi:
                    "karena buku KIA berisi informasi dan catatan pentingkesehatan ibu dan anak. Buku KIA juga digunakan pada jaminan kesehatan dan pihak lain diluar sektor kesehatan.",
                textlogo: "Jangan Rusak dan hilang",
              ),
              BoxPenjelasan(
                judul: "",
                deskripsi:
                    "tenaga kesehatan dan kader menjelaskan isi buku KIA kepada ibu dan keluarga dan meminta untuk menerapkannya.",
                textlogo: "Menjelaskan Buku KIA",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
