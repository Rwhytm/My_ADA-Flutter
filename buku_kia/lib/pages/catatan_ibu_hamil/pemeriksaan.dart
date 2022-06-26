import 'package:buku_kia/commons/services.dart';
import 'package:buku_kia/pages/catatan_ibu_hamil/tambah_data_diri_pemeriksaan.dart';
import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/themes/font.dart';
import 'package:buku_kia/widgets/judul_besar.dart';
import 'package:buku_kia/widgets/list_register.dart';
import 'package:buku_kia/widgets/subjudulBesar.dart';
import 'package:buku_kia/widgets/text_table.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Pemeriksaan extends StatefulWidget {
  Pemeriksaan({Key? key}) : super(key: key);

  @override
  State<Pemeriksaan> createState() => _PemeriksaanState();
}

class _PemeriksaanState extends State<Pemeriksaan> {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static User user = _auth.currentUser!;
  final Stream<QuerySnapshot> data_user = FirebaseFirestore.instance
      .collection('pasiens')
      .doc(user.uid)
      .collection('data_diri_pemeriksaan')
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
            actions: [
              data_user == null
                  ? IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => TambahDataDiriPemeriksaan(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    )
                  : const Text('')
            ],
            backgroundColor: orangeTua,
            title: Text(
              'Catatan Kesehatan Ibu Hamil',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
          ),
          backgroundColor: putih,
          body: ListView.builder(
            itemCount: data.size,
            itemBuilder: (BuildContext context, int index) {
              return (data.size != 0)
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
                                    pertanyaan: "Hamil ke",
                                    jawaban:
                                        "${data.docs[index]['hamil ke']}    Jumlah persalinan ${data.docs[index]['jumlah persalinan']}   Jumlah keguguran ${data.docs[index]['jumlah keguguran']}",
                                  ),
                                  ListRegistrasi(
                                    pertanyaan: "Jumlah anak hidup",
                                    jawaban:
                                        "${data.docs[index]['jumlah anak hidup']} ",
                                  ),
                                  ListRegistrasi(
                                    pertanyaan:
                                        "Jumlah anak lahir kurang bulan",
                                    jawaban:
                                        "${data.docs[index]['jumlah anak kurang bulan']} anak ",
                                  ),
                                  ListRegistrasi(
                                    pertanyaan:
                                        "Jarak kehamilan ini dengan persalinan terakhir",
                                    jawaban:
                                        "${data.docs[index]['jarak kehamilan']}",
                                  ),
                                  ListRegistrasi(
                                    pertanyaan: "status imunisasi TT terakhir",
                                    jawaban:
                                        "${data.docs[index]['status imunisasi']}",
                                  ),
                                  ListRegistrasi(
                                    pertanyaan: "Penolong persalinan terakhir",
                                    jawaban:
                                        "${data.docs[index]['pertolongan persalinan']}",
                                  ),
                                  ListRegistrasi(
                                    pertanyaan: "Cara Persalinan terakhir",
                                    jawaban:
                                        "${data.docs[index]['cara persalinan']}",
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
                                    pertanyaan: "Hamil ke",
                                    jawaban:
                                        "tidak ada data    Jumlah persalinan tidak ada data   Jumlah keguguran tidak ada data",
                                  ),
                                  ListRegistrasi(
                                    pertanyaan: "Jumlah anak hidup",
                                    jawaban: "tidak ada data ",
                                  ),
                                  ListRegistrasi(
                                    pertanyaan:
                                        "Jumlah anak lahir kurang bulan",
                                    jawaban: "tidak ada data anak ",
                                  ),
                                  ListRegistrasi(
                                    pertanyaan:
                                        "Jarak kehamilan ini dengan persalinan terakhir",
                                    jawaban: "tidak ada data",
                                  ),
                                  ListRegistrasi(
                                    pertanyaan: "status imunisasi TT terakhir",
                                    jawaban: "tidak ada data",
                                  ),
                                  ListRegistrasi(
                                    pertanyaan: "Penolong persalinan terakhir",
                                    jawaban: "tidak ada data",
                                  ),
                                  ListRegistrasi(
                                    pertanyaan: "Cara Persalinan terakhir",
                                    jawaban: "tidak ada data",
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
        );
      },
    );
  }
}
