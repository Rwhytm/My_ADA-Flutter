import 'package:buku_kia/commons/services.dart';
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
  TextEditingController hamilKeController = TextEditingController(text: "");
  TextEditingController jumlahPersalinanController = TextEditingController();
  TextEditingController jumlahKeguguranController = TextEditingController();
  TextEditingController jumlahAnakHidupController = TextEditingController();
  TextEditingController jumlahAnakMatiController = TextEditingController();
  TextEditingController jumlahAnakLahirKurangController =
      TextEditingController();
  TextEditingController jarakKehamilanController = TextEditingController();
  TextEditingController statusImunisasiController = TextEditingController();
  TextEditingController penolongPersalinanController = TextEditingController();
  TextEditingController caraPersalinanController = TextEditingController();

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
      hamilKeController.text = snapshot.docs[0]['hamil ke'];
      jumlahPersalinanController.text = snapshot.docs[0]['jumlah persalinan'];
      jumlahKeguguranController.text = snapshot.docs[0]['jumlah keguguran'];
      jumlahAnakHidupController.text = snapshot.docs[0]['jumlah anak hidup'];
      jumlahAnakLahirKurangController.text =
          snapshot.docs[0]['jumlah anak kurang bulan'];
      jarakKehamilanController.text = snapshot.docs[0]['jarak kehamilan'];
      statusImunisasiController.text = snapshot.docs[0]['status imunisasi'];
      penolongPersalinanController.text =
          snapshot.docs[0]['pertolongan persalinan'];
      caraPersalinanController.text = snapshot.docs[0]['cara persalinan'];
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
                        keyboard: TextInputType.number,
                        controller: hamilKeController,
                        hintText: "Hamil Ke-",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RoundedInputField(
                        keyboard: TextInputType.number,
                        controller: jumlahPersalinanController,
                        hintText: "Jumlah Persalinan",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RoundedInputField(
                        keyboard: TextInputType.number,
                        controller: jumlahKeguguranController,
                        hintText: "Jumlah Keguguran",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RoundedInputField(
                        keyboard: TextInputType.number,
                        controller: jumlahAnakHidupController,
                        hintText: "Jumlah Anak Hidup",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RoundedInputField(
                        keyboard: TextInputType.number,
                        controller: jumlahAnakLahirKurangController,
                        hintText: "Jumlah anak lahir kurang bulan",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RoundedInputField(
                        keyboard: TextInputType.name,
                        controller: jarakKehamilanController,
                        hintText:
                            "Jarak Kehamilan ini dengan persalinan terakhir",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RoundedInputField(
                        keyboard: TextInputType.name,
                        controller: statusImunisasiController,
                        hintText: "Status imunisasi TT terakhir",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RoundedInputField(
                        keyboard: TextInputType.name,
                        controller: penolongPersalinanController,
                        hintText: "Penolong persalinan terakhir",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RoundedInputField(
                        keyboard: TextInputType.name,
                        controller: caraPersalinanController,
                        hintText: "Cara persalinan terakhir",
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
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Pemeriksaan();
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
