import 'package:buku_kia/commons/services.dart';
import 'package:buku_kia/pages/catatan_ibu_hamil/keluhan.dart';
import 'package:buku_kia/pages/wrapper.dart';
import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/widgets/rounded_button.dart';
import 'package:buku_kia/widgets/rounded_input_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TambahDataDiriKeluhan extends StatefulWidget {
  const TambahDataDiriKeluhan({Key? key}) : super(key: key);

  @override
  State<TambahDataDiriKeluhan> createState() => _TambahDataDiriKeluhan();
}

class _TambahDataDiriKeluhan extends State<TambahDataDiriKeluhan> {
  TextEditingController hariPertamaController = TextEditingController(text: "");
  TextEditingController hariTaksiranController =
      TextEditingController(text: "");
  TextEditingController lingkarLenganAtasController =
      TextEditingController(text: "");
  TextEditingController tinggiBadanController = TextEditingController(text: "");
  TextEditingController golonganDarahController =
      TextEditingController(text: "");
  TextEditingController penggunaanKontrasepsiController =
      TextEditingController(text: "");
  TextEditingController riwayatPenyakitController =
      TextEditingController(text: "");
  TextEditingController riwayatAlergiController =
      TextEditingController(text: "");

  static FirebaseAuth _auth = FirebaseAuth.instance;
  static User user = _auth.currentUser!;
  final Stream<QuerySnapshot> data_user = FirebaseFirestore.instance
      .collection('pasiens')
      .doc(user.uid)
      .collection('data_pasien')
      .snapshots();
  @override
  Widget build(BuildContext context) {
//  Size size = MediaQuery.of(context).size;
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
        return data.size == 0
            ? Scaffold(
                backgroundColor: backgroundPink,
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "MASUKKAN DATA",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RoundedInputField(
                            keyboard: TextInputType.name,
                            controller: hariPertamaController,
                            hintText: "Hari Pertama Haid terakhir (HPHT)",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RoundedInputField(
                            keyboard: TextInputType.name,
                            controller: hariTaksiranController,
                            hintText: "Hari Taksiran Persalinan(HTP), tanggal",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RoundedInputField(
                            keyboard: TextInputType.number,
                            controller: lingkarLenganAtasController,
                            hintText: "Lingkar Lengan Atas",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RoundedInputField(
                            keyboard: TextInputType.number,
                            controller: tinggiBadanController,
                            hintText: "Tinggi Badan",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RoundedInputField(
                            keyboard: TextInputType.name,
                            controller: golonganDarahController,
                            hintText: "Golongan darah",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RoundedInputField(
                            keyboard: TextInputType.name,
                            controller: penggunaanKontrasepsiController,
                            hintText:
                                "Penggunaan kontrasepsi sebelum kehamilan ini",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RoundedInputField(
                            keyboard: TextInputType.name,
                            controller: riwayatPenyakitController,
                            hintText: "Riwayat penyakit ibu",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RoundedInputField(
                            keyboard: TextInputType.name,
                            controller: riwayatAlergiController,
                            hintText: "Riwayat alergi",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          RoundedButton(
                            text: "Simpan",
                            press: () async {
                              await AuthServices.keluhanDataDiri(
                                      hariPertamaController.text,
                                      hariTaksiranController.text,
                                      lingkarLenganAtasController.text,
                                      tinggiBadanController.text,
                                      golonganDarahController.text,
                                      penggunaanKontrasepsiController.text,
                                      riwayatPenyakitController.text,
                                      riwayatAlergiController.text)
                                  .then(
                                    (value) => ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Berhasil Menambahkan data'),
                                      ),
                                    ),
                                  )
                                  .onError(
                                    (error, stackTrace) =>
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                      const SnackBar(
                                        content: Text('Gagal Menambahkan data'),
                                      ),
                                    ),
                                  );

                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Keluhan();
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : Scaffold(
                backgroundColor: backgroundPink,
                body: SafeArea(
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: [
                          Text(
                            "UBAH DATA",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RoundedInputField(
                            keyboard: TextInputType.name,
                            controller: hariPertamaController,
                            hintText: "Hari Pertama Haid terakhir (HPHT)",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RoundedInputField(
                            keyboard: TextInputType.name,
                            controller: hariTaksiranController,
                            hintText: "Hari Taksiran Persalinan(HTP), tanggal",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RoundedInputField(
                            keyboard: TextInputType.number,
                            controller: lingkarLenganAtasController,
                            hintText: "Lingkar Lengan Atas",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RoundedInputField(
                            keyboard: TextInputType.number,
                            controller: tinggiBadanController,
                            hintText: "Tinggi Badan",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RoundedInputField(
                            keyboard: TextInputType.name,
                            controller: golonganDarahController,
                            hintText: "Golongan darah",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RoundedInputField(
                            keyboard: TextInputType.name,
                            controller: penggunaanKontrasepsiController,
                            hintText:
                                "Penggunaan kontrasepsi sebelum kehamilan ini",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RoundedInputField(
                            keyboard: TextInputType.name,
                            controller: riwayatPenyakitController,
                            hintText: "Riwayat penyakit ibu",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RoundedInputField(
                            keyboard: TextInputType.name,
                            controller: riwayatAlergiController,
                            hintText: "Riwayat alergi",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          RoundedButton(
                            text: "Simpan",
                            press: () async {
                              await AuthServices.keluhanDataDiri(
                                      hariPertamaController.text,
                                      hariTaksiranController.text,
                                      lingkarLenganAtasController.text,
                                      tinggiBadanController.text,
                                      golonganDarahController.text,
                                      penggunaanKontrasepsiController.text,
                                      riwayatPenyakitController.text,
                                      riwayatAlergiController.text)
                                  .then(
                                    (value) => ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Berhasil Menambahkan data'),
                                      ),
                                    ),
                                  )
                                  .onError(
                                    (error, stackTrace) =>
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                      const SnackBar(
                                        content: Text('Gagal Menambahkan data'),
                                      ),
                                    ),
                                  );

                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return Keluhan();
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
