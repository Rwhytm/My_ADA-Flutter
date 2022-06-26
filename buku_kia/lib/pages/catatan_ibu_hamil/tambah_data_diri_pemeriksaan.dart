import 'package:buku_kia/commons/services.dart';
import 'package:buku_kia/pages/wrapper.dart';
import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/widgets/rounded_button.dart';
import 'package:buku_kia/widgets/rounded_input_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TambahDataDiriPemeriksaan extends StatefulWidget {
  const TambahDataDiriPemeriksaan({Key? key}) : super(key: key);

  @override
  State<TambahDataDiriPemeriksaan> createState() =>
      _TambahDataDiriPemeriksaanState();
}

class _TambahDataDiriPemeriksaanState extends State<TambahDataDiriPemeriksaan> {
  TextEditingController hamilKeController = TextEditingController(text: "");
  TextEditingController jumlahPersalinanController =
      TextEditingController(text: "");
  TextEditingController jumlahKeguguranController =
      TextEditingController(text: "");
  TextEditingController jumlahAnakHidupController =
      TextEditingController(text: "");
  TextEditingController jumlahAnakMatiController =
      TextEditingController(text: "");
  TextEditingController jumlahAnakLahirKurangController =
      TextEditingController(text: "");
  TextEditingController jarakKehamilanController =
      TextEditingController(text: "");
  TextEditingController statusImunisasiController =
      TextEditingController(text: "");
  TextEditingController penolongPersalinanController =
      TextEditingController(text: "");
  TextEditingController caraPersalinanController =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
//  Size size = MediaQuery.of(context).size;
    return Scaffold(
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
                controller: jumlahAnakMatiController,
                hintText: "Jumlah Lahir Mati",
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
                hintText: "Jarak Kehamilan ini dengan persalinan terakhir",
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
                  await AuthServices.pemeriksaanDataDiri(
                          hamilKeController.text,
                          jumlahPersalinanController.text,
                          jumlahKeguguranController.text,
                          jumlahAnakHidupController.text,
                          jumlahAnakMatiController.text,
                          jumlahAnakLahirKurangController.text,
                          jarakKehamilanController.text,
                          statusImunisasiController.text,
                          penolongPersalinanController.text,
                          caraPersalinanController.text)
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

                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Wrapper();
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
