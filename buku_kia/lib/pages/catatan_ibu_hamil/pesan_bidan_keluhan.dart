import 'package:buku_kia/pages/catatan_ibu_hamil/menu.dart';
import 'package:buku_kia/pages/catatan_ibu_hamil/tabel_keluhan.dart';
import 'package:buku_kia/pages/catatan_ibu_hamil/tambah_pesan_keluhan.dart';
import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/widgets/deskripsi_widget.dart';
import 'package:buku_kia/widgets/judul_besar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PesanKeluhan extends StatefulWidget {
  PesanKeluhan({Key? key}) : super(key: key);

  @override
  State<PesanKeluhan> createState() => _PesanKeluhanState();
}

class _PesanKeluhanState extends State<PesanKeluhan> {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static User user = _auth.currentUser!;

  final Stream<QuerySnapshot> data_user = FirebaseFirestore.instance
      .collection('pasiens')
      .doc(user.uid)
      .collection('pesan_keluhan')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => TabelKeluhan()),
                );
              },
            ),
            actions: [
              data.size == 0
                  ? IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => TambahPesanKeluhan(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => TambahPesanKeluhan(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    )
            ],
            backgroundColor: orangeTua,
            title: Text(
              'Pesan Bidan Terhadap Keluhan',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
          ),
          backgroundColor: putih,
          body: ListView.builder(
            itemCount: (data.size == 0 ? 1 : data.size),
            itemBuilder: (BuildContext context, int index) {
              return data.size != 0
                  ? SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: JudulBesar(judul: "Pesan Bidan"),
                          ),
                          Column(
                            children: <Widget>[
                              DeskripsiWidget(
                                deskripsi: '${data.docs[0]['pesan']}',
                                padding: 10,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: JudulBesar(judul: "Pesan Bidan"),
                          ),
                          Column(
                            children: const <Widget>[
                              SizedBox(
                                height: 100,
                              ),
                              Center(
                                  child: JudulBesar(judul: 'TIdak Ada Pesan'))
                            ],
                          ),
                        ],
                      ),
                    );
            },
          ),
          floatingActionButton: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                left: 30,
                bottom: 20,
                child: FloatingActionButton(
                  backgroundColor: orangeTua,
                  heroTag: 'back',
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => TabelKeluhan(),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.arrow_left,
                    size: 40,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                right: 30,
                child: FloatingActionButton(
                  backgroundColor: orangeTua,
                  heroTag: 'next',
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const Menu(),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.home,
                    size: 40,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
