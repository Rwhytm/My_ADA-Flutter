import 'package:buku_kia/commons/services.dart';
import 'package:buku_kia/pages/catatan_ibu_hamil/menyambut_persalinan.dart';
import 'package:buku_kia/pages/catatan_ibu_hamil/pemeriksaan.dart';
import 'package:buku_kia/pages/wrapper.dart';
import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/widgets/rounded_button.dart';
import 'package:buku_kia/widgets/rounded_input_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TambahDataMenyambut extends StatefulWidget {
  const TambahDataMenyambut({Key? key}) : super(key: key);

  @override
  State<TambahDataMenyambut> createState() => _TambahDataMenyambutState();
}

class _TambahDataMenyambutState extends State<TambahDataMenyambut> {
  TextEditingController namaController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController bulanController = TextEditingController();
  TextEditingController tahunController = TextEditingController();
  TextEditingController dokter1Controller = TextEditingController();
  TextEditingController dokter2Controller = TextEditingController();
  TextEditingController danaController = TextEditingController();
  TextEditingController kendaraan1Controller = TextEditingController();
  TextEditingController kendaraan2Controller = TextEditingController();
  TextEditingController kendaraan3Controller = TextEditingController();
  TextEditingController goldarController = TextEditingController();
  TextEditingController donor1Controller = TextEditingController();
  TextEditingController donor2Controller = TextEditingController();
  TextEditingController metodekbController = TextEditingController();
  TextEditingController createController = TextEditingController();

  static FirebaseAuth _auth = FirebaseAuth.instance;
  static User user = _auth.currentUser!;
  void getData() async {
    //use a Async-await function to get the data
    final data = await FirebaseFirestore.instance
        .collection('pasiens')
        .doc(user.uid)
        .collection('data_menyambut_persalinan')
        .get(); //get the data
    QuerySnapshot snapshot = data;
    if (data.size != 0) {
      namaController.text = snapshot.docs[0]['nama'];
      alamatController.text = snapshot.docs[0]['alamat'];
      bulanController.text = snapshot.docs[0]['bulan'];
      tahunController.text = snapshot.docs[0]['tahun'];
      dokter1Controller.text = snapshot.docs[0]['dokter1'];
      dokter2Controller.text = snapshot.docs[0]['dokter2'];
      danaController.text = snapshot.docs[0]['dana'];
      kendaraan1Controller.text = snapshot.docs[0]['kendaraan1'];
      kendaraan2Controller.text = snapshot.docs[0]['kendaraan2'];
      kendaraan3Controller.text = snapshot.docs[0]['kendaraan3'];
      metodekbController.text = snapshot.docs[0]['metodekb'];
      goldarController.text = snapshot.docs[0]['goldar'];
      donor1Controller.text = snapshot.docs[0]['donor1'];
      donor2Controller.text = snapshot.docs[0]['donor2'];
      createController.text = snapshot.docs[0]['created_at'];
    } else {
      createController.text = DateTime.now().toString();
    }
  }

  final Stream<QuerySnapshot> data_user = FirebaseFirestore.instance
      .collection('pasiens')
      .doc(user.uid)
      .collection('data_menyambut_persalinan')
      .snapshots();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

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
          return Scaffold(
            backgroundColor: backgroundPink,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        data.size == 0 ? "MASUKKAN DATA" : "MENGUBAH DATA",
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
                        controller: namaController,
                        hintText: "Nama",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RoundedInputField(
                        keyboard: TextInputType.name,
                        controller: alamatController,
                        hintText: "Alamat",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RoundedInputField(
                        keyboard: TextInputType.name,
                        controller: bulanController,
                        hintText: "Perkiraan Bulan",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RoundedInputField(
                        keyboard: TextInputType.name,
                        controller: tahunController,
                        hintText: "Perkiraan Tahun",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RoundedInputField(
                        keyboard: TextInputType.name,
                        controller: dokter1Controller,
                        hintText: "Dokter/Bidan 1",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RoundedInputField(
                        keyboard: TextInputType.name,
                        controller: dokter2Controller,
                        hintText: "Dokter/Bidan 2",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RoundedInputField(
                        keyboard: TextInputType.name,
                        controller: danaController,
                        hintText: "Asal Dana Persalinan",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RoundedInputField(
                        keyboard: TextInputType.name,
                        controller: kendaraan1Controller,
                        hintText: "No HP Kendaraan/ambulan 1",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RoundedInputField(
                        keyboard: TextInputType.name,
                        controller: kendaraan2Controller,
                        hintText: "No HP Kendaraan/ambulan 2",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RoundedInputField(
                        keyboard: TextInputType.name,
                        controller: kendaraan3Controller,
                        hintText: "No HP Kendaraan/ambulan 3",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RoundedInputField(
                        keyboard: TextInputType.name,
                        controller: metodekbController,
                        hintText: "Metode KB setelah melahirkan",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RoundedInputField(
                        keyboard: TextInputType.name,
                        controller: goldarController,
                        hintText: "Golongan Darah",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RoundedInputField(
                        keyboard: TextInputType.name,
                        controller: donor1Controller,
                        hintText: "Donor Darah 1 (nama, no HP)",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RoundedInputField(
                        keyboard: TextInputType.name,
                        controller: donor2Controller,
                        hintText: "Donor Darah 2 (nama, no HP)",
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
                          await AuthServices.menyambutData(
                            namaController.text,
                            alamatController.text,
                            bulanController.text,
                            tahunController.text,
                            dokter1Controller.text,
                            dokter2Controller.text,
                            danaController.text,
                            kendaraan1Controller.text,
                            kendaraan2Controller.text,
                            kendaraan3Controller.text,
                            metodekbController.text,
                            goldarController.text,
                            donor1Controller.text,
                            donor2Controller.text,
                            createController.text,
                          )
                              .then(
                                (value) =>
                                    ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(data.size == 0
                                        ? 'Berhasil Menambahkan data'
                                        : 'Berhasil Mengubah data'),
                                  ),
                                ),
                              )
                              .onError(
                                (error, stackTrace) =>
                                    ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(data.size == 0
                                        ? 'Gagal Menambahkan data'
                                        : 'Gagal Mengubah data'),
                                  ),
                                ),
                              );
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return MenyambutPersalinan();
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
        });
  }
}
