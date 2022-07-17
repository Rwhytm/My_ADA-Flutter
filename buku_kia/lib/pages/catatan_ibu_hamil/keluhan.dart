import 'package:buku_kia/commons/services.dart';
import 'package:buku_kia/pages/catatan_ibu_hamil/menu.dart';
import 'package:buku_kia/pages/catatan_ibu_hamil/tabel_keluhan.dart';
import 'package:buku_kia/pages/catatan_ibu_hamil/tabel_pemeriksaan.dart';
import 'package:buku_kia/pages/catatan_ibu_hamil/tambah_data_diri_keluhan.dart';
import 'package:buku_kia/pages/catatan_ibu_hamil/tambah_data_diri_pemeriksaan.dart';
import 'package:buku_kia/pages/daftar_isi.dart';
import 'package:buku_kia/pages/ibu_hamil/ibuhamil2.dart';
import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/themes/font.dart';
import 'package:buku_kia/widgets/deskripsi_widget.dart';
import 'package:buku_kia/widgets/judul_besar.dart';
import 'package:buku_kia/widgets/list_register.dart';
import 'package:buku_kia/widgets/subjudulBesar.dart';
import 'package:buku_kia/widgets/text_table.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Keluhan extends StatefulWidget {
  Keluhan({Key? key}) : super(key: key);

  @override
  State<Keluhan> createState() => _Keluhan();
}

class _Keluhan extends State<Keluhan> {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static User user = _auth.currentUser!;

  final Stream<QuerySnapshot> data_user = FirebaseFirestore.instance
      .collection('pasiens')
      .doc(user.uid)
      .collection('data_diri_keluhan')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return StreamBuilder<QuerySnapshot>(
      stream: data_user,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Scaffold(
            body: Center(
              child: Text('Something went wrong'),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: Text('Loading....'),
            ),
          );
        }
        final data = snapshot.requireData;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const Menu()),
                );
              },
            ),
            actions: [
              data.size == 0
                  ? IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => TambahDataDiriKeluhan(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => TambahDataDiriKeluhan(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    )
            ],
            backgroundColor: orangeTua,
            title: Text(
              'Data Diri Keluhan Ibu ',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
          ),
          backgroundColor: putih,
          body: ListView.builder(
            itemCount: (data.size == 0 ? 1 : data.size),
            itemBuilder: (BuildContext context, int index) {
              return data.size != 0
                  ? SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const JudulBesar(
                              judul: "Diisi oleh petugas kesehatan"),
                          Center(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              width: width * 0.9,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(27),
                                color: orangeMuda,
                              ),
                              child: Column(
                                children: <Widget>[
                                  ListRegistrasi(
                                    pertanyaan:
                                        "Hari pertama Haid\nTerakhir (HPHT), tanggal",
                                    jawaban:
                                        "${data.docs[index]['Hari Pertama HAID']}",
                                  ),
                                  ListRegistrasi(
                                    pertanyaan:
                                        "Hari Taksiran\nPersalinan (HTP), tanggal",
                                    jawaban:
                                        "${data.docs[index]['hari taksiran']} ",
                                  ),
                                  ListRegistrasi(
                                    pertanyaan: "Lingkar lengan atas",
                                    jawaban:
                                        "${data.docs[index]['lingkar lengan atas']} cm ",
                                  ),
                                  ListRegistrasi(
                                    pertanyaan: 'Tinggi Badan',
                                    jawaban:
                                        '${data.docs[index]['tinggi badan']} cm',
                                  ),
                                  ListRegistrasi(
                                    pertanyaan: "Golongan darah : ",
                                    jawaban:
                                        "${data.docs[index]['golongan darah']}",
                                  ),
                                  ListRegistrasi(
                                    pertanyaan:
                                        "Penggunaan kontrasepsi\nsebelum kehamilan ini",
                                    jawaban:
                                        "${data.docs[index]['penggunaan kontrasepsi']}",
                                  ),
                                  ListRegistrasi(
                                    pertanyaan:
                                        "Riwayat penyakit\nyang diderita ibu",
                                    jawaban:
                                        "${data.docs[index]['riwayat penyakit']}",
                                  ),
                                  ListRegistrasi(
                                    pertanyaan: "Riwayat alergi",
                                    jawaban:
                                        "${data.docs[index]['riwayat Alergi']}",
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const JudulBesar(
                              judul: "Diisi oleh petugas kesehatan"),
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
                                    pertanyaan:
                                        "Hari pertama Haid Terakhir (HPHT), tanggal",
                                    jawaban: " - ",
                                  ),
                                  ListRegistrasi(
                                    pertanyaan:
                                        "Hari Taksiran Persalinan (HTP), tanggal",
                                    jawaban: " - ",
                                  ),
                                  ListRegistrasi(
                                    pertanyaan: "Lingkar lengan atas",
                                    jawaban: "-",
                                  ),
                                  ListRegistrasi(
                                    pertanyaan: "Golongan darah",
                                    jawaban: " - ",
                                  ),
                                  ListRegistrasi(
                                    pertanyaan:
                                        "Penggunaan kontrasepsi sebelum kehamilan ini",
                                    jawaban: " - ",
                                  ),
                                  ListRegistrasi(
                                    pertanyaan:
                                        "Riwayat penyakit yang diderita ibu",
                                    jawaban: " - ",
                                  ),
                                  ListRegistrasi(
                                    pertanyaan: "Riwayat alergi",
                                    jawaban: " - ",
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    );
            },
          ),
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                bottom: 20,
                right: 30,
                child: FloatingActionButton(
                  backgroundColor: orangeTua,
                  heroTag: 'next',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => new TabelKeluhan(),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.arrow_right,
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
      },
    );
  }
}
