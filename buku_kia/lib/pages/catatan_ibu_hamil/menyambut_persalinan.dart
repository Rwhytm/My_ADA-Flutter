import 'package:buku_kia/pages/catatan_ibu_hamil/menu.dart';
import 'package:buku_kia/pages/catatan_ibu_hamil/tambah_data_menyambut.dart';
import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/widgets/deskripsi_widget.dart';
import 'package:buku_kia/widgets/judul_besar.dart';
import 'package:buku_kia/widgets/list_register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MenyambutPersalinan extends StatefulWidget {
  MenyambutPersalinan({Key? key}) : super(key: key);

  @override
  State<MenyambutPersalinan> createState() => _MenyambutPersalinanState();
}

class _MenyambutPersalinanState extends State<MenyambutPersalinan> {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static User user = _auth.currentUser!;

  final Stream<QuerySnapshot> data_user = FirebaseFirestore.instance
      .collection('pasiens')
      .doc(user.uid)
      .collection('data_menyambut_persalinan')
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
                            builder: (context) => TambahDataMenyambut(),
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
                            builder: (context) => TambahDataMenyambut(),
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
            itemCount: (data.size == 0 ? 1 : data.size),
            itemBuilder: (BuildContext context, int index) {
              return data.size != 0
                  ? SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: JudulBesar(judul: "MENYAMBUT\nPERSALINAN"),
                          ),
                          Column(
                            children: <Widget>[
                              const ListRegistrasi(
                                pertanyaan: "Saya ",
                                jawaban: "-",
                              ),
                              const ListRegistrasi(
                                pertanyaan: "Alamat",
                                jawaban: "- ",
                              ),
                              const DeskripsiWidget(
                                  deskripsi:
                                      'Memberikan kepercayaan kepada nama-nama ini untuk membantu persalinan saya agar aman dan selamat, yang diperkirakan pada',
                                  padding: 15),
                              const ListRegistrasi(
                                pertanyaan: "Bulan",
                                jawaban: "-",
                              ),
                              const ListRegistrasi(
                                pertanyaan: "Tahun",
                                jawaban: "-",
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      'assets/images/cium.png',
                                      height: 80,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      DeskripsiWidget(
                                        deskripsi: 'Penolong Persalinan',
                                        padding: 0,
                                      ),
                                      DeskripsiWidget(
                                        deskripsi: 'Dokter/Bidan',
                                        padding: 0,
                                      ),
                                      DeskripsiWidget(
                                        deskripsi: '-',
                                        padding: 0,
                                      ),
                                      DeskripsiWidget(
                                        deskripsi: '-',
                                        padding: 0,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      'assets/images/cium.png',
                                      height: 80,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      DeskripsiWidget(
                                        deskripsi:
                                            'Untuk Dana Persalinan, disiapkan\nsendiri/ditanggung JKN/dibatu oleh :',
                                        padding: 0,
                                      ),
                                      DeskripsiWidget(
                                        deskripsi: '-',
                                        padding: 0,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      'assets/images/cium.png',
                                      height: 80,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      DeskripsiWidget(
                                        deskripsi:
                                            'Untk kendaraan/ambulan desa oleh :',
                                        padding: 0,
                                      ),
                                      DeskripsiWidget(
                                        deskripsi: '-',
                                        padding: 0,
                                      ),
                                      DeskripsiWidget(
                                        deskripsi: '-',
                                        padding: 0,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      'assets/images/cium.png',
                                      height: 80,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      DeskripsiWidget(
                                        deskripsi:
                                            'Metode KB setelah melahirkan yang dipilih :',
                                        padding: 0,
                                      ),
                                      DeskripsiWidget(
                                        deskripsi: '-',
                                        padding: 0,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      'assets/images/cium.png',
                                      height: 80,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      DeskripsiWidget(
                                        deskripsi:
                                            'Untuk sumbangan darah (golongan darah - )\ndibantu oleh :',
                                        padding: 0,
                                      ),
                                      DeskripsiWidget(
                                        deskripsi: '-',
                                        padding: 0,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: JudulBesar(judul: "MENYAMBUT\nPERSALINAN"),
                          ),
                          Column(
                            children: <Widget>[
                              const ListRegistrasi(
                                pertanyaan: "Saya ",
                                jawaban: "-",
                              ),
                              const ListRegistrasi(
                                pertanyaan: "Alamat",
                                jawaban: "- ",
                              ),
                              const DeskripsiWidget(
                                  deskripsi:
                                      'Memberikan kepercayaan kepada nama-nama ini untuk membantu persalinan saya agar aman dan selamat, yang diperkirakan pada',
                                  padding: 15),
                              const ListRegistrasi(
                                pertanyaan: "Bulan",
                                jawaban: "-",
                              ),
                              const ListRegistrasi(
                                pertanyaan: "Tahun",
                                jawaban: "-",
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      'assets/images/cium.png',
                                      height: 80,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      DeskripsiWidget(
                                        deskripsi: 'Penolong Persalinan',
                                        padding: 0,
                                      ),
                                      DeskripsiWidget(
                                        deskripsi: 'Dokter/Bidan',
                                        padding: 0,
                                      ),
                                      DeskripsiWidget(
                                        deskripsi: '-',
                                        padding: 0,
                                      ),
                                      DeskripsiWidget(
                                        deskripsi: '-',
                                        padding: 0,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      'assets/images/cium.png',
                                      height: 80,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      DeskripsiWidget(
                                        deskripsi:
                                            'Untuk Dana Persalinan, disiapkan\nsendiri/ditanggung JKN/dibatu oleh :',
                                        padding: 0,
                                      ),
                                      DeskripsiWidget(
                                        deskripsi: '-',
                                        padding: 0,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      'assets/images/cium.png',
                                      height: 80,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      DeskripsiWidget(
                                        deskripsi:
                                            'Untk kendaraan/ambulan desa oleh :',
                                        padding: 0,
                                      ),
                                      DeskripsiWidget(
                                        deskripsi: '-',
                                        padding: 0,
                                      ),
                                      DeskripsiWidget(
                                        deskripsi: '-',
                                        padding: 0,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      'assets/images/cium.png',
                                      height: 80,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      DeskripsiWidget(
                                        deskripsi:
                                            'Metode KB setelah melahirkan yang dipilih :',
                                        padding: 0,
                                      ),
                                      DeskripsiWidget(
                                        deskripsi: '-',
                                        padding: 0,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipOval(
                                    child: Image.asset(
                                      'assets/images/cium.png',
                                      height: 80,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 30,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      DeskripsiWidget(
                                        deskripsi:
                                            'Untuk sumbangan darah (golongan darah - )\ndibantu oleh :',
                                        padding: 0,
                                      ),
                                      DeskripsiWidget(
                                        deskripsi: '-',
                                        padding: 0,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                            ],
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
