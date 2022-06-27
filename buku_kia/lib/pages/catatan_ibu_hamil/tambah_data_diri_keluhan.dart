import 'package:buku_kia/commons/services.dart';
import 'package:buku_kia/pages/wrapper.dart';
import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/widgets/rounded_button.dart';
import 'package:buku_kia/widgets/rounded_input_field.dart';
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
                  hintText: "Penggunaan kontrasepsi sebelum kehamilan ini",
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
                    ;

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
        ),
      ),
    );
  }
}
