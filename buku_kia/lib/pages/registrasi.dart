import 'package:buku_kia/commons/services.dart';
import 'package:buku_kia/pages/daftar_isi.dart';
import 'package:buku_kia/pages/ibu_nifas/ibunifas3.dart';
import 'package:buku_kia/pages/tambah_data_registrasi.dart';
import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/themes/font.dart';
import 'package:buku_kia/widgets/deskripsi_widget.dart';
import 'package:buku_kia/widgets/list_register.dart';
import 'package:buku_kia/widgets/subjudulBesar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Registrasi extends StatefulWidget {
  Registrasi({Key? key}) : super(key: key);
  @override
  State<Registrasi> createState() => _RegistrasiState();
}

class _RegistrasiState extends State<Registrasi> {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static User user = _auth.currentUser!;
  final Stream<QuerySnapshot> data_user = FirebaseFirestore.instance
      .collection('pasiens')
      .doc(user.uid)
      .collection('data_pasien')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const DaftarIsi(),
                  ),
                );
              },
            ),
            backgroundColor: orangeTua,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Registrasi",
                    style: judulAppBAr,
                  ),
                ),
              ),
            ],
            centerTitle: false,
          ),
          body: ListView.builder(
            itemCount: data.size == 0 ? 1 : data.size,
            itemBuilder: (BuildContext context, int index) {
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
              return data.size != 0
                  ? Container(
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
                                  children: <Widget>[
                                    ListRegistrasi(
                                      pertanyaan: "Nomor Registrasi Ibu",
                                      jawaban:
                                          "${data.docs[index]["nomor registrasi ibu"]}",
                                    ),
                                    ListRegistrasi(
                                      pertanyaan: "Nomor Urut di Kohort Ibu",
                                      jawaban:
                                          "${data.docs[index]["nomor urut di kahort ibu"]}",
                                    ),
                                    ListRegistrasi(
                                      pertanyaan: "Tanggal menerima buku KIA",
                                      jawaban:
                                          "${data.docs[index]["tanggal menerima buku kia"]}",
                                    ),
                                    ListRegistrasi(
                                      pertanyaan:
                                          "Nama & No. Telp. Tenaga Kesehatan",
                                      jawaban:
                                          "${data.docs[index]["nama petugas"]} ${data.docs[index]["nomor petugas"]}",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
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
                                  children: <Widget>[
                                    const SubJudulBesar(
                                        judul: "IDENTITAS KELUARGA"),
                                    ListRegistrasi(
                                      pertanyaan: "Nama Ibu",
                                      jawaban: "jawaban",
                                    ),
                                    ListRegistrasi(
                                      pertanyaan: "Tempat/Tgl. Lahir",
                                      jawaban:
                                          (data.docs[index]["TTL ibu"] != null
                                              ? "${data.docs[index]["TTL ibu"]}"
                                              : "tidak ada data"),
                                    ),
                                    ListRegistrasi(
                                      pertanyaan: "Kehamilan ke",
                                      jawaban: data.docs[index]
                                                  ["kehamilan ke-"] !=
                                              null
                                          ? "${data.docs[index]["kehamilan ke-"]}"
                                          : "tidak ada data",
                                    ),
                                    ListRegistrasi(
                                      pertanyaan: "Agama",
                                      jawaban: data.docs[index]["agama ibu"] !=
                                              null
                                          ? "${data.docs[index]["agama ibu"]}"
                                          : "tidak ada data",
                                    ),
                                    ListRegistrasi(
                                      pertanyaan: "Pendidikan",
                                      jawaban: data.docs[index]
                                                  ["pendidikan ibu"] !=
                                              null
                                          ? "${data.docs[index]["pendidikan ibu"]}"
                                          : "Tidak ada data",
                                    ),
                                    ListRegistrasi(
                                      pertanyaan: "Golongan Darah",
                                      jawaban: data.docs[index]
                                                  ["golongan darah ibu"] !=
                                              null
                                          ? "${data.docs[index]["golongan darah ibu"]}"
                                          : "tidak ada data",
                                    ),
                                    ListRegistrasi(
                                      pertanyaan: "Pekerjaan",
                                      jawaban: data.docs[index]
                                                  ["pekerjaan ibu"] !=
                                              null
                                          ? "${data.docs[index]["pekerjaan ibu"]}"
                                          : "tidak ada data",
                                    ),
                                    ListRegistrasi(
                                      pertanyaan: "No. JKN",
                                      jawaban:
                                          data.docs[index]["no JKN"] != null
                                              ? "${data.docs[index]["no JKN"]}"
                                              : "tidak ada data",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
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
                                  children: <Widget>[
                                    ListRegistrasi(
                                      pertanyaan: "Nama Suami",
                                      jawaban: data.docs[index]["nama suami"] !=
                                              null
                                          ? "${data.docs[index]["nama suami"]}"
                                          : "tidak ada data",
                                    ),
                                    ListRegistrasi(
                                      pertanyaan: "Tempat/Tgl. Lahir",
                                      jawaban: data.docs[index]["TTL ayah"] !=
                                              null
                                          ? "${data.docs[index]["TTL ayah"]}"
                                          : "tidak ada data",
                                    ),
                                    ListRegistrasi(
                                      pertanyaan: "Agama",
                                      jawaban: data.docs[index]
                                                  ["agama suami"] !=
                                              null
                                          ? "${data.docs[index]["agama suami"]}"
                                          : "tidak ada data",
                                    ),
                                    ListRegistrasi(
                                      pertanyaan: "Pendidikan",
                                      jawaban: data.docs[index]
                                                  ["pendidikan suami"] !=
                                              null
                                          ? "${data.docs[index]["pendidikan suami"]}"
                                          : "tidak ada data",
                                    ),
                                    ListRegistrasi(
                                      pertanyaan: "Golongan Darah",
                                      jawaban: data.docs[index]
                                                  ["golongan darah suami"] !=
                                              null
                                          ? "${data.docs[index]["golongan darah suami"]}"
                                          : "tidak ada data",
                                    ),
                                    ListRegistrasi(
                                      pertanyaan: "Pekerjaan",
                                      jawaban: data.docs[index]
                                                  ["pekerjaan suami"] !=
                                              null
                                          ? "${data.docs[index]["pekerjaan suami"]}"
                                          : "tidak ada data",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
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
                                  children: <Widget>[
                                    ListRegistrasi(
                                      pertanyaan: "Alamat Rumah",
                                      jawaban: data.docs[index]
                                                  ["alamat rumah"] !=
                                              null
                                          ? "${data.docs[index]["alamat rumah"]}"
                                          : "tidak ada data",
                                    ),
                                    ListRegistrasi(
                                      pertanyaan: "Kecamatan",
                                      jawaban: data.docs[index]["kecamatan"] !=
                                              null
                                          ? "${data.docs[index]["kecamatan"]}"
                                          : "tidak ada data",
                                    ),
                                    ListRegistrasi(
                                      pertanyaan: "Kabupaten/Kota",
                                      jawaban: data.docs[index]["kabupaten"] !=
                                              null
                                          ? "${data.docs[index]["kabupaten"]}"
                                          : "tidak ada data",
                                    ),
                                    ListRegistrasi(
                                      pertanyaan:
                                          "No. Telp. yang bisa dihubungi",
                                      jawaban: data.docs[index][
                                                  "nomor yang bisa dihubungi"] !=
                                              null
                                          ? "${data.docs[index]["nomor yang bisa dihubungi"]}"
                                          : "tidak ada data",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
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
                                  children: <Widget>[
                                    ListRegistrasi(
                                      pertanyaan: "Nama Anak",
                                      jawaban: data.docs[index]["nama anak"] !=
                                              null
                                          ? "${data.docs[index]["nama anak"]}"
                                          : "tidak ada data",
                                    ),
                                    ListRegistrasi(
                                      pertanyaan: "Tempat/Tgl. Lahir",
                                      jawaban: data.docs[index]["TTL anak"] !=
                                              null
                                          ? "${data.docs[index]["TTL anak"]}"
                                          : "tidak ada data",
                                    ),
                                    ListRegistrasi(
                                      pertanyaan: "Anak ke",
                                      jawaban:
                                          data.docs[index]["anak ke"] != null
                                              ? "${data.docs[index]["anak ke"]}"
                                              : "tidak ada data",
                                    ),
                                    ListRegistrasi(
                                      pertanyaan: "No. Akte Kelahiran",
                                      jawaban: data.docs[index]["Nomor Akte"] !=
                                              null
                                          ? "${data.docs[index]["Nomor Akte"]}"
                                          : "tidak da data",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 100,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Container(
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
                                      jawaban: "-",
                                    ),
                                    ListRegistrasi(
                                      pertanyaan: "Nomor Urut di Kohort Ibu",
                                      jawaban: "-",
                                    ),
                                    ListRegistrasi(
                                      pertanyaan: "Tanggal menerima buku KIA",
                                      jawaban: "-",
                                    ),
                                    ListRegistrasi(
                                      pertanyaan:
                                          "Nama & No. Telp. Tenaga Kesehatan",
                                      jawaban: "-",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
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
                                      jawaban: "-",
                                    ),
                                    ListRegistrasi(
                                        pertanyaan: "Tempat/Tgl. Lahir",
                                        jawaban: "-"),
                                    ListRegistrasi(
                                        pertanyaan: "Kehamilan ke",
                                        jawaban: "-"),
                                    ListRegistrasi(
                                        pertanyaan: "Agama", jawaban: "-"),
                                    ListRegistrasi(
                                        pertanyaan: "Pendidikan", jawaban: "-"),
                                    ListRegistrasi(
                                        pertanyaan: "Golongan Darah",
                                        jawaban: "-"),
                                    ListRegistrasi(
                                        pertanyaan: "Pekerjaan", jawaban: "-"),
                                    ListRegistrasi(
                                        pertanyaan: "No. JKN", jawaban: "-"),
                                  ],
                                ),
                              ),
                              const SizedBox(
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
                                      jawaban: "-",
                                    ),
                                    ListRegistrasi(
                                      pertanyaan: "Tempat/Tgl. Lahir",
                                      jawaban: "-",
                                    ),
                                    ListRegistrasi(
                                      pertanyaan: "Agama",
                                      jawaban: "-",
                                    ),
                                    ListRegistrasi(
                                      pertanyaan: "Pendidikan",
                                      jawaban: "-",
                                    ),
                                    ListRegistrasi(
                                      pertanyaan: "Golongan Darah",
                                      jawaban: "-",
                                    ),
                                    ListRegistrasi(
                                      pertanyaan: "Pekerjaan",
                                      jawaban: "-",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
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
                                      jawaban: "-",
                                    ),
                                    ListRegistrasi(
                                      pertanyaan: "Kecamatan",
                                      jawaban: "-",
                                    ),
                                    ListRegistrasi(
                                      pertanyaan: "Kabupaten/Kota",
                                      jawaban: "-",
                                    ),
                                    ListRegistrasi(
                                        pertanyaan:
                                            "No. Telp. yang bisa dihubungi",
                                        jawaban: "-"),
                                  ],
                                ),
                              ),
                              const SizedBox(
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
                                      jawaban: "-",
                                    ),
                                    ListRegistrasi(
                                      pertanyaan: "Tempat/Tgl. Lahir",
                                      jawaban: "-",
                                    ),
                                    ListRegistrasi(
                                      pertanyaan: "Anak ke",
                                      jawaban: "-",
                                    ),
                                    ListRegistrasi(
                                      pertanyaan: "No. Akte Kelahiran",
                                      jawaban: "-",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 100,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: data.size == 0
              ? Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned(
                      bottom: 20,
                      right: 30,
                      child: FloatingActionButton(
                        backgroundColor: putih,
                        heroTag: 'next',
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const TambahRegistrasi(),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.add,
                          size: 30,
                          color: orangeTua,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    )

                    // Add more floating buttons if you want
                    // There is no limit
                  ],
                )
              : Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned(
                      bottom: 20,
                      right: 30,
                      child: FloatingActionButton(
                        backgroundColor: putih,
                        heroTag: 'next',
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const TambahRegistrasi(),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.edit,
                          size: 30,
                          color: orangeTua,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    )

                    // Add more floating buttons if you want
                    // There is no limit
                  ],
                ),
        );
      },
    );
  }
}
