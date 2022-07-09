import 'package:buku_kia/pages/catatan_ibu_hamil/keluhan.dart';
import 'package:buku_kia/pages/catatan_ibu_hamil/pemeriksaan.dart';
import 'package:buku_kia/pages/catatan_ibu_hamil/tambah_data_diri_pemeriksaan.dart';
import 'package:buku_kia/pages/catatan_ibu_hamil/tambah_tabel_keluhan.dart';
import 'package:buku_kia/pages/catatan_ibu_hamil/tambah_tabel_pemeriksaan.dart';
import 'package:buku_kia/pages/daftar_isi.dart';
import 'package:buku_kia/pages/ibu_hamil/ibuhamil3.dart';
import 'package:buku_kia/themes/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TabelKeluhan extends StatefulWidget {
  TabelKeluhan({Key? key}) : super(key: key);

  @override
  State<TabelKeluhan> createState() => _TabelKeluhan();
}

class _TabelKeluhan extends State<TabelKeluhan> {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static User user = _auth.currentUser!;

  final Stream<QuerySnapshot> data_user = FirebaseFirestore.instance
      .collection('pasiens')
      .doc(user.uid)
      .collection('data_keluhan')
      .snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
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
            leading: Text(''),
            actions: [
              // data.size == 0
              //     ?
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TambahTableKeluhan(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )
              // : const Text('')
            ],
            backgroundColor: orangeTua,
            title: Text(
              'Pemeriksaan Ibu Hamil',
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
          ),
          body: ListView.builder(
            itemCount: data.size == 0 ? 1 : data.size,
            itemBuilder: (BuildContext context, int index) {
              return data.size != 0
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            'Pemeriksaan Ke - ' + (index + 1).toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: DataTable(
                            columns: const <DataColumn>[
                              DataColumn(
                                label: Flexible(
                                  child: Text(
                                    'Tanggal',
                                    style: TextStyle(),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Flexible(
                                  child: Text(
                                    'Keluhan\nSekarang',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    softWrap: true,
                                    textWidthBasis: TextWidthBasis.parent,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Flexible(
                                  child: Text(
                                    'Tekanan\ndarah\n(mmHg)',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Flexible(
                                  child: Text(
                                    'Berat\nBadan\n(Kg)',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Flexible(
                                  child: Text(
                                    'Umur\nKehamilan\n(Minggu)',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Flexible(
                                  child: Text(
                                    'Tinggi\nFundus\n(cm)',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Flexible(
                                  child: Text(
                                    'Letak\nJanin',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Flexible(
                                  child: Text(
                                    'Denyut\nJantung Janin\n permenit',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ),
                              ),
                            ],
                            rows: <DataRow>[
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Text(
                                    '${data.docs[index]['tanggal']}',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  )),
                                  DataCell(
                                    Text(
                                        '${data.docs[index]['keluhan sekarang']}'),
                                  ),
                                  DataCell(
                                    Text(
                                        '${data.docs[index]['tekanan darah']}'),
                                  ),
                                  DataCell(
                                    Text('${data.docs[index]['berat badan']}'),
                                  ),
                                  DataCell(
                                    Text(
                                        '${data.docs[index]['umur kehamilan']}'),
                                  ),
                                  DataCell(
                                    Text(
                                        '${data.docs[index]['tinggi fundus']}'),
                                  ),
                                  DataCell(
                                    Text('${data.docs[index]['letak janin']}'),
                                  ),
                                  DataCell(
                                    Text(
                                        '${data.docs[index]['denyut jantung']}'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Container(
                      child: Center(
                        child: Text(
                          'Tidak Ada Data',
                          style: GoogleFonts.poppins(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
            },
          ),
          // floatingActionButtonLocation:
          //     FloatingActionButtonLocation.centerFloat,
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
                        builder: (context) => Keluhan(),
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
                        builder: (context) => const DaftarIsi(),
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
