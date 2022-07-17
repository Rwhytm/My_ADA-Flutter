import 'package:buku_kia/commons/services.dart';
import 'package:buku_kia/pages/catatan_ibu_hamil/pesan_bidan_keluhan.dart';
import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/widgets/judul_besar.dart';
import 'package:buku_kia/widgets/rounded_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TambahPesanKeluhan extends StatefulWidget {
  TambahPesanKeluhan({Key? key}) : super(key: key);

  @override
  State<TambahPesanKeluhan> createState() => _TambahPesanKeluhanState();
}

class _TambahPesanKeluhanState extends State<TambahPesanKeluhan> {
  TextEditingController pesanController = TextEditingController();
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static User user = _auth.currentUser!;
  void getData() async {
    //use a Async-await function to get the data
    final data = await FirebaseFirestore.instance
        .collection('pasiens')
        .doc(user.uid)
        .collection('pesan_keluhan')
        .get(); //get the data
    QuerySnapshot snapshot = data;
    if (data.size != 0) {
      pesanController.text = snapshot.docs[0]['pesan'];
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPink,
      body: SafeArea(
        child: Column(
          children: [
            const JudulBesar(judul: 'Pesan dari Bidan'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: pesanController,
                minLines: 8,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  floatingLabelAlignment: FloatingLabelAlignment.center,
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  alignLabelWithHint: true,
                  hintText: 'Masukkan Pesan',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(27),
                  ),
                  fillColor: Colors.white70,
                  filled: true,
                ),
              ),
            ),
            RoundedButton(
              text: 'Simpan',
              press: () async {
                await AuthServices.pesanKeluhan(pesanController.text)
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
                      return PesanKeluhan();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
