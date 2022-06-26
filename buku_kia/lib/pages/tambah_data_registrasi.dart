import 'package:buku_kia/commons/services.dart';
import 'package:buku_kia/pages/wrapper.dart';
import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/widgets/rounded_button.dart';
import 'package:buku_kia/widgets/rounded_input_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TambahRegistrasi extends StatefulWidget {
  const TambahRegistrasi({Key? key}) : super(key: key);

  @override
  State<TambahRegistrasi> createState() => _TambahRegisterState();
}

class _TambahRegisterState extends State<TambahRegistrasi> {
  TextEditingController noRegistrasiController =
      TextEditingController(text: "");
  TextEditingController nomorUrutKahortController =
      TextEditingController(text: "");
  TextEditingController tanggalMenerimaController =
      TextEditingController(text: "");
  TextEditingController namaTenagaKesehatanController =
      TextEditingController(text: "");
  TextEditingController noHPTenagaKesehatanController =
      TextEditingController(text: "");

  //ibu registrasi
  TextEditingController ttdIbuController = TextEditingController(text: "");
  TextEditingController kehamilankeController = TextEditingController(text: "");
  TextEditingController agamaIbuController = TextEditingController(text: "");
  TextEditingController pendidikanIbuController =
      TextEditingController(text: "");
  TextEditingController goldarIbuController = TextEditingController(text: "");
  TextEditingController pekerjaanIbuController =
      TextEditingController(text: "");
  TextEditingController noJknController = TextEditingController(text: "");

  //ayah registrasi
  TextEditingController namaAyahController = TextEditingController(text: "");
  TextEditingController ttdAyahController = TextEditingController(text: "");
  TextEditingController agamaAyahController = TextEditingController(text: "");
  TextEditingController pendidikanAyahController =
      TextEditingController(text: "");
  TextEditingController goldarAyahController = TextEditingController(text: "");
  TextEditingController pekerjaanAyahController =
      TextEditingController(text: "");

  //rumah
  TextEditingController alamatRumahController = TextEditingController(text: "");
  TextEditingController kecamatanController = TextEditingController(text: "");
  TextEditingController kabupatenController = TextEditingController(text: "");
  TextEditingController noHPDihubungiController =
      TextEditingController(text: "");

  //anak
  TextEditingController namaAnakController = TextEditingController(text: "");
  TextEditingController ttdAnakController = TextEditingController(text: "");
  TextEditingController anakKeController = TextEditingController(text: "");
  TextEditingController noAkteController = TextEditingController(text: "");

  // static FirebaseAuth _auth = FirebaseAuth.instance;
  // static User user = _auth.currentUser!;
  // final id = user.uid;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                controller: noRegistrasiController,
                hintText: "Nomor Registrasi",
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedInputField(
                keyboard: TextInputType.number,
                controller: nomorUrutKahortController,
                hintText: "Nomor Urut Kahort",
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedInputField(
                keyboard: TextInputType.datetime,
                controller: tanggalMenerimaController,
                hintText: "Tanggal Menerima Buku",
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedInputField(
                keyboard: TextInputType.name,
                controller: namaTenagaKesehatanController,
                hintText: "Nama Petugas",
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedInputField(
                keyboard: TextInputType.number,
                controller: noHPTenagaKesehatanController,
                hintText: "No. HP Petugas",
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "IDENTITAS KELUARGA",
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Text(
                "Identitas Ibu",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              RoundedInputField(
                keyboard: TextInputType.name,
                controller: ttdIbuController,
                hintText: "Tempat/tanggal lahir Ibu",
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedInputField(
                keyboard: TextInputType.name,
                controller: kehamilankeController,
                hintText: "Kehamilan Ke-",
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedInputField(
                keyboard: TextInputType.name,
                controller: agamaIbuController,
                hintText: "Agama Ibu",
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedInputField(
                keyboard: TextInputType.name,
                controller: pendidikanIbuController,
                hintText: "Pendidikan Ibu",
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedInputField(
                keyboard: TextInputType.name,
                controller: goldarIbuController,
                hintText: "Golongan Darah Ibu",
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedInputField(
                keyboard: TextInputType.name,
                controller: pekerjaanIbuController,
                hintText: "Pekerjaan Ibu",
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedInputField(
                keyboard: TextInputType.number,
                controller: noJknController,
                hintText: "No. JKN",
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Identitas Ayah",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              RoundedInputField(
                keyboard: TextInputType.name,
                controller: namaAyahController,
                hintText: "Nama Suami",
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedInputField(
                keyboard: TextInputType.name,
                controller: ttdAyahController,
                hintText: "Tempat/tanggal lahir Ayah",
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedInputField(
                keyboard: TextInputType.name,
                controller: agamaAyahController,
                hintText: "Agama Ayah",
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedInputField(
                keyboard: TextInputType.name,
                controller: pendidikanAyahController,
                hintText: "Pendidikan Ayah",
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedInputField(
                keyboard: TextInputType.name,
                controller: goldarAyahController,
                hintText: "Golongan Darah Ayah",
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedInputField(
                keyboard: TextInputType.name,
                controller: pekerjaanAyahController,
                hintText: "Pekerjaan Ayah",
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Data Rumah",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              RoundedInputField(
                keyboard: TextInputType.streetAddress,
                controller: alamatRumahController,
                hintText: "Alamat Rumah",
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedInputField(
                keyboard: TextInputType.name,
                controller: kecamatanController,
                hintText: "Kecamatan",
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedInputField(
                keyboard: TextInputType.name,
                controller: kabupatenController,
                hintText: "Kabupaten/Kota",
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedInputField(
                keyboard: TextInputType.number,
                controller: noHPDihubungiController,
                hintText: "Nomor yang bisa dihubungi",
              ),
              Text(
                "Data Anak",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              RoundedInputField(
                keyboard: TextInputType.name,
                controller: namaAnakController,
                hintText: "Nama Anak",
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedInputField(
                keyboard: TextInputType.name,
                controller: ttdAnakController,
                hintText: "Tempat/tanggal lahir Anak",
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedInputField(
                keyboard: TextInputType.number,
                controller: anakKeController,
                hintText: "Anak ke-",
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedInputField(
                keyboard: TextInputType.number,
                controller: noAkteController,
                hintText: "No. Akte Kelahiran",
              ),
              const SizedBox(
                height: 25,
              ),
              RoundedButton(
                text: "Simpan",
                press: () async {
                  await AuthServices.registrasi(
                    noRegistrasiController.text,
                    nomorUrutKahortController.text,
                    ttdIbuController.text,
                    namaTenagaKesehatanController.text,
                    noHPTenagaKesehatanController.text,
                    ttdIbuController.text,
                    kehamilankeController.text,
                    agamaIbuController.text,
                    pendidikanIbuController.text,
                    goldarIbuController.text,
                    pekerjaanIbuController.text,
                    noJknController.text,
                    namaAyahController.text,
                    ttdAyahController.text,
                    agamaAyahController.text,
                    pendidikanAyahController.text,
                    goldarAyahController.text,
                    pekerjaanAyahController.text,
                    alamatRumahController.text,
                    kecamatanController.text,
                    kabupatenController.text,
                    noHPDihubungiController.text,
                    namaAnakController.text,
                    ttdAnakController.text,
                    anakKeController.text,
                    noAkteController.text,
                  )
                      .then(
                        (value) => ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Berhasil melakukan registrasi'),
                          ),
                        ),
                      )
                      .onError(
                        (error, stackTrace) =>
                            ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Gagal melakukan registrasi'),
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
