import 'package:buku_kia/commons/services.dart';
import 'package:buku_kia/pages/registrasi.dart';
import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/widgets/rounded_button.dart';
import 'package:buku_kia/widgets/rounded_input_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TambahRegistrasi extends StatefulWidget {
  const TambahRegistrasi({Key? key}) : super(key: key);

  @override
  State<TambahRegistrasi> createState() => _TambahRegisterState();
}

class _TambahRegisterState extends State<TambahRegistrasi> {
  TextEditingController noRegistrasiController = TextEditingController();
  TextEditingController nomorUrutKahortController = TextEditingController();
  TextEditingController tanggalMenerimaController = TextEditingController();
  TextEditingController namaTenagaKesehatanController = TextEditingController();
  TextEditingController noHPTenagaKesehatanController = TextEditingController();

  //ibu registrasi

  TextEditingController namaIbuController = TextEditingController();
  TextEditingController ttdIbuController = TextEditingController();
  TextEditingController kehamilankeController = TextEditingController();
  TextEditingController agamaIbuController = TextEditingController();
  TextEditingController pendidikanIbuController = TextEditingController();
  TextEditingController goldarIbuController = TextEditingController();
  TextEditingController pekerjaanIbuController = TextEditingController();
  TextEditingController noJknController = TextEditingController();

  //ayah registrasi
  TextEditingController namaAyahController = TextEditingController();
  TextEditingController ttdAyahController = TextEditingController();
  TextEditingController agamaAyahController = TextEditingController();
  TextEditingController pendidikanAyahController = TextEditingController();
  TextEditingController goldarAyahController = TextEditingController();
  TextEditingController pekerjaanAyahController = TextEditingController();

  //rumah
  TextEditingController alamatRumahController = TextEditingController();
  TextEditingController kecamatanController = TextEditingController();
  TextEditingController kabupatenController = TextEditingController();
  TextEditingController noHPDihubungiController = TextEditingController();

  //anak
  TextEditingController namaAnakController = TextEditingController();
  TextEditingController ttdAnakController = TextEditingController();
  TextEditingController anakKeController = TextEditingController();
  TextEditingController noAkteController = TextEditingController();

  static FirebaseAuth _auth = FirebaseAuth.instance;
  static User user = _auth.currentUser!;
  final Stream<QuerySnapshot> data_user = FirebaseFirestore.instance
      .collection('pasiens')
      .doc(user.uid)
      .collection('data_pasien')
      .snapshots();

  void getData() async {
    //use a Async-await function to get the data
    final data = await FirebaseFirestore.instance
        .collection('pasiens')
        .doc(user.uid)
        .collection('data_pasien')
        .get(); //get the data
    QuerySnapshot snapshot = data;
    if (data.size != 0) {
      noRegistrasiController.text = snapshot.docs[0]['nomor registrasi ibu'];
      nomorUrutKahortController.text =
          snapshot.docs[0]['nomor urut di kahort ibu'];
      tanggalMenerimaController.text =
          snapshot.docs[0]['tanggal menerima buku kia'];
      namaTenagaKesehatanController.text = snapshot.docs[0]['nama petugas'];
      noHPTenagaKesehatanController.text = snapshot.docs[0]['nomor petugas'];

      namaIbuController.text = snapshot.docs[0]['nama ibu'];
      ttdIbuController.text = snapshot.docs[0]['TTL ibu'];
      kehamilankeController.text = snapshot.docs[0]['kehamilan ke-'];
      agamaIbuController.text = snapshot.docs[0]['agama ibu'];
      pendidikanIbuController.text = snapshot.docs[0]['pendidikan ibu'];
      goldarIbuController.text = snapshot.docs[0]['golongan darah ibu'];
      pekerjaanIbuController.text = snapshot.docs[0]['pekerjaan ibu'];
      noJknController.text = snapshot.docs[0]['no JKN'];

      namaAyahController.text = snapshot.docs[0]['nama suami'];
      ttdAyahController.text = snapshot.docs[0]['TTL ayah'];
      agamaAyahController.text = snapshot.docs[0]['agama suami'];
      pendidikanAyahController.text = snapshot.docs[0]['pendidikan suami'];
      goldarAyahController.text = snapshot.docs[0]['golongan darah suami'];
      pekerjaanAyahController.text = snapshot.docs[0]['pekerjaan suami'];

      alamatRumahController.text = snapshot.docs[0]['alamat rumah'];
      kecamatanController.text = snapshot.docs[0]['kecamatan'];
      kabupatenController.text = snapshot.docs[0]['kabupaten'];
      noHPDihubungiController.text =
          snapshot.docs[0]['nomor yang bisa dihubungi'];

      namaAnakController.text = snapshot.docs[0]['nama anak'];
      ttdAnakController.text = snapshot.docs[0]['TTL anak'];
      anakKeController.text = snapshot.docs[0]['anak ke'];
      noAkteController.text = snapshot.docs[0]['Nomor Akte'];
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder<QuerySnapshot>(
      stream: data_user,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        // snapshot == null ? print('yes') : print("no");
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
                      controller: namaIbuController,
                      hintText: "Nama Ibu",
                    ),
                    const SizedBox(
                      height: 10,
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
                          tanggalMenerimaController.text,
                          namaTenagaKesehatanController.text,
                          noHPTenagaKesehatanController.text,
                          namaIbuController.text,
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
                              (value) =>
                                  ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Berhasil melakukan registrasi'),
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

                        await Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Registrasi();
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
