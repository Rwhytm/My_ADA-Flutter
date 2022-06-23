import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/themes/font.dart';
import 'package:buku_kia/widgets/deskripsi_widget.dart';
import 'package:buku_kia/widgets/list_register.dart';
import 'package:buku_kia/widgets/subjudulBesar.dart';
import 'package:flutter/material.dart';

class Registrasi extends StatefulWidget {
  Registrasi({Key? key}) : super(key: key);

  @override
  State<Registrasi> createState() => _RegistrasiState();
}

class _RegistrasiState extends State<Registrasi> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
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
      body: Container(
        padding: const EdgeInsets.all(10),
        color: orangeTua,
        height: height,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(10),
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(27),
                    color: orangeMuda,
                  ),
                  child: Column(
                    children: const <Widget>[
                      ListRegistrasi(
                        pertanyaan: "Nomor Registrasi Ibu",
                        jawaban: "jawaban",
                      ),
                      ListRegistrasi(
                        pertanyaan: "Nomor Urut di Kohort Ibu",
                        jawaban: "jawaban",
                      ),
                      ListRegistrasi(
                        pertanyaan: "Tanggal menerima buku KIA",
                        jawaban: "jawaban",
                      ),
                      ListRegistrasi(
                        pertanyaan: "Nama & No. Telp. Tenaga Kesehatan",
                        jawaban: "jawaban",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(27),
                    color: orangeMuda,
                  ),
                  child: Column(
                    children: const <Widget>[
                      SubJudulBesar(judul: "IDENTITAS KELUARGA"),
                      ListRegistrasi(
                        pertanyaan: "Nama Ibu",
                        jawaban: "jawaban",
                      ),
                      ListRegistrasi(
                        pertanyaan: "Tempat/Tgl. Lahir",
                        jawaban: "jawaban",
                      ),
                      ListRegistrasi(
                        pertanyaan: "Kehamilan ke",
                        jawaban: "jawaban",
                      ),
                      ListRegistrasi(
                        pertanyaan: "Agama",
                        jawaban: "jawaban",
                      ),
                      ListRegistrasi(
                        pertanyaan: "Pendidikan",
                        jawaban: "jawaban",
                      ),
                      ListRegistrasi(
                        pertanyaan: "Golongan Darah",
                        jawaban: "jawaban",
                      ),
                      ListRegistrasi(
                        pertanyaan: "Pekerjaan",
                        jawaban: "jawaban",
                      ),
                      ListRegistrasi(
                        pertanyaan: "No. JKN",
                        jawaban: "jawaban",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(27),
                    color: orangeMuda,
                  ),
                  child: Column(
                    children: const <Widget>[
                      ListRegistrasi(
                        pertanyaan: "Nama Suami",
                        jawaban: "jawaban",
                      ),
                      ListRegistrasi(
                        pertanyaan: "Tempat/Tgl. Lahir",
                        jawaban: "jawaban",
                      ),
                      ListRegistrasi(
                        pertanyaan: "Agama",
                        jawaban: "jawaban",
                      ),
                      ListRegistrasi(
                        pertanyaan: "Pendidikan",
                        jawaban: "jawaban",
                      ),
                      ListRegistrasi(
                        pertanyaan: "Golongan Darah",
                        jawaban: "jawaban",
                      ),
                      ListRegistrasi(
                        pertanyaan: "Pekerjaan",
                        jawaban: "jawaban",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(27),
                    color: orangeMuda,
                  ),
                  child: Column(
                    children: const <Widget>[
                      ListRegistrasi(
                        pertanyaan: "Alamat Rumah",
                        jawaban: "jawaban",
                      ),
                      ListRegistrasi(
                        pertanyaan: "Kecamatan",
                        jawaban: "jawaban",
                      ),
                      ListRegistrasi(
                        pertanyaan: "Kabupaten/Kota",
                        jawaban: "jawaban",
                      ),
                      ListRegistrasi(
                        pertanyaan: "No. Telp. yang bisa dihubungi",
                        jawaban: "jawaban",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(27),
                    color: orangeMuda,
                  ),
                  child: Column(
                    children: const <Widget>[
                      ListRegistrasi(
                        pertanyaan: "Nama Anak",
                        jawaban: "jawaban",
                      ),
                      ListRegistrasi(
                        pertanyaan: "Tempat/Tgl. Lahir",
                        jawaban: "jawaban",
                      ),
                      ListRegistrasi(
                        pertanyaan: "Anak ke",
                        jawaban: "jawaban",
                      ),
                      ListRegistrasi(
                        pertanyaan: "No. Akte Kelahiran",
                        jawaban: "jawaban",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
