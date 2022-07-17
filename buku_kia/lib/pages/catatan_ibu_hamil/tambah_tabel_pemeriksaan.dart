import 'package:buku_kia/commons/services.dart';
import 'package:buku_kia/pages/catatan_ibu_hamil/pemeriksaan.dart';
import 'package:buku_kia/pages/catatan_ibu_hamil/tabel_pemeriksaan.dart';
import 'package:buku_kia/pages/wrapper.dart';
import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/widgets/rounded_button.dart';
import 'package:buku_kia/widgets/rounded_input_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TambahTablePemeriksaan extends StatefulWidget {
  const TambahTablePemeriksaan({Key? key}) : super(key: key);

  @override
  State<TambahTablePemeriksaan> createState() => _TambahTablePemeriksaan();
}

class _TambahTablePemeriksaan extends State<TambahTablePemeriksaan> {
  TextEditingController kakiBengkakController = TextEditingController(text: "");
  TextEditingController hasilPemeriksaanController =
      TextEditingController(text: "");
  TextEditingController tindakanController = TextEditingController(text: "");
  TextEditingController nasihatController = TextEditingController(text: "");
  TextEditingController keteranganController = TextEditingController(text: "");
  TextEditingController kapanKembaliController =
      TextEditingController(text: "");
  int datalength = 0;

  static FirebaseAuth _auth = FirebaseAuth.instance;
  static User user = _auth.currentUser!;
  void getData() async {
    //use a Async-await function to get the data
    final data = await FirebaseFirestore.instance
        .collection('pasiens')
        .doc(user.uid)
        .collection('data_pemeriksaan')
        .get(); //get the data
    datalength = data.size;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Widget build(BuildContext context) {
//  Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundPink,
        title: Text(
          'Data Pemeriksaan Ibu ',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      backgroundColor: pinkpudar,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                "Data Pemeriksaan",
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
                controller: kakiBengkakController,
                hintText: "Kaki Bengkak (Ya/Tidak)",
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedInputField(
                keyboard: TextInputType.name,
                controller: hasilPemeriksaanController,
                hintText: "Hasil Pemeriksaan Laboratorium",
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedInputField(
                keyboard: TextInputType.name,
                controller: tindakanController,
                hintText: "Tindakan (pemberian TT, Fe, Dll)",
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedInputField(
                keyboard: TextInputType.name,
                controller: nasihatController,
                hintText: "Nasihat yang disampaikan",
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedInputField(
                keyboard: TextInputType.name,
                controller: keteranganController,
                hintText: "Keterangan tempat & nama pemeriksa",
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedInputField(
                keyboard: TextInputType.name,
                controller: kapanKembaliController,
                hintText: "kapan harus kembali",
              ),
              const SizedBox(
                height: 25,
              ),
              RoundedButton(
                text: "Simpan",
                press: () async {
                  await AuthServices.pemeriksaanTabel(
                    kakiBengkakController.text,
                    hasilPemeriksaanController.text,
                    tindakanController.text,
                    nasihatController.text,
                    keteranganController.text,
                    kapanKembaliController.text,
                    datalength + 1,
                  )
                      .then(
                        (value) => ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Berhasil Menambahkan data'),
                          ),
                        ),
                      )
                      .onError(
                        (error, stackTrace) =>
                            ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Gagal Menambahkan data'),
                          ),
                        ),
                      );
                  await Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return TabelPemeriksaan();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
