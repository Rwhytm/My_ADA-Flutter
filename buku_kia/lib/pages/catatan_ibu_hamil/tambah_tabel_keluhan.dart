import 'package:buku_kia/commons/services.dart';
import 'package:buku_kia/pages/catatan_ibu_hamil/keluhan.dart';
import 'package:buku_kia/pages/catatan_ibu_hamil/pemeriksaan.dart';
import 'package:buku_kia/pages/catatan_ibu_hamil/tabel_keluhan.dart';
import 'package:buku_kia/pages/wrapper.dart';
import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/widgets/rounded_button.dart';
import 'package:buku_kia/widgets/rounded_input_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TambahTableKeluhan extends StatefulWidget {
  const TambahTableKeluhan({Key? key}) : super(key: key);

  @override
  State<TambahTableKeluhan> createState() => _TambahTableKeluhan();
}

class _TambahTableKeluhan extends State<TambahTableKeluhan> {
  TextEditingController tanggalController = TextEditingController(text: "");
  TextEditingController keluhanController = TextEditingController(text: "");
  TextEditingController tekananDarahController =
      TextEditingController(text: "");
  TextEditingController beratBadanController = TextEditingController(text: "");
  TextEditingController umurKehamilanController =
      TextEditingController(text: "");
  TextEditingController tinggiFundusController =
      TextEditingController(text: "");
  TextEditingController letakJaninController = TextEditingController(text: "");
  TextEditingController denyutJantungController =
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
                appBar: AppBar(
                  backgroundColor: backgroundPink,
                  title: Text(
                    'Data Pemeriksaan Keluhan Ibu ',
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
                            "Data Pemeriksaan Keluhan",
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
                            controller: tanggalController,
                            hintText: "Tanggal",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RoundedInputField(
                            keyboard: TextInputType.name,
                            controller: keluhanController,
                            hintText: "Keluhan sekarang",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RoundedInputField(
                            keyboard: TextInputType.name,
                            controller: tekananDarahController,
                            hintText: "Tekanan Darah (mmHg)",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RoundedInputField(
                            keyboard: TextInputType.number,
                            controller: beratBadanController,
                            hintText: "Berat badan (Kg)",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RoundedInputField(
                            keyboard: TextInputType.number,
                            controller: umurKehamilanController,
                            hintText: "Umur kehamilan (minggu)",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RoundedInputField(
                            keyboard: TextInputType.number,
                            controller: tinggiFundusController,
                            hintText: "Tinggi fundus (cm)",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RoundedInputField(
                            keyboard: TextInputType.name,
                            controller: letakJaninController,
                            hintText: "Letak janin Kep/Su/Li",
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          RoundedInputField(
                            keyboard: TextInputType.name,
                            controller: denyutJantungController,
                            hintText: "Denyut jantung  janin/menit",
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          RoundedButton(
                            text: "Simpan",
                            press: () async {
                              await AuthServices.KeluhanTabel(
                                tanggalController.text,
                                keluhanController.text,
                                tekananDarahController.text,
                                beratBadanController.text,
                                umurKehamilanController.text,
                                tinggiFundusController.text,
                                letakJaninController.text,
                                denyutJantungController.text,
                                (data.size + 1).toString(),
                              )
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
                              await Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return TabelKeluhan();
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
                appBar: AppBar(
                  backgroundColor: backgroundPink,
                  title: Text(
                    'Data Pemeriksaan Keluhan Ibu ',
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
                          "Data Pemeriksaan Keluhan",
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
                          controller: tanggalController,
                          hintText: "Tanggal",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RoundedInputField(
                          keyboard: TextInputType.name,
                          controller: keluhanController,
                          hintText: "Keluhan sekarang",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RoundedInputField(
                          keyboard: TextInputType.name,
                          controller: tekananDarahController,
                          hintText: "Tekanan Darah (mmHg)",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RoundedInputField(
                          keyboard: TextInputType.number,
                          controller: beratBadanController,
                          hintText: "Berat badan (Kg)",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RoundedInputField(
                          keyboard: TextInputType.number,
                          controller: umurKehamilanController,
                          hintText: "Umur kehamilan (minggu)",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RoundedInputField(
                          keyboard: TextInputType.number,
                          controller: tinggiFundusController,
                          hintText: "Tinggi fundus (cm)",
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RoundedInputField(
                          keyboard: TextInputType.name,
                          controller: letakJaninController,
                          hintText: "Letak janin Kep/Su/Li",
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        RoundedInputField(
                          keyboard: TextInputType.name,
                          controller: denyutJantungController,
                          hintText: "Denyut jantung  janin/menit",
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        RoundedButton(
                          text: "Simpan",
                          press: () async {
                            await AuthServices.KeluhanTabel(
                              tanggalController.text,
                              keluhanController.text,
                              tekananDarahController.text,
                              beratBadanController.text,
                              umurKehamilanController.text,
                              tinggiFundusController.text,
                              letakJaninController.text,
                              denyutJantungController.text,
                              (data.size + 1).toString(),
                            )
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
                            await Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return TabelKeluhan();
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
      },
    );
  }
}
