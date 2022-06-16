import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/themes/font.dart';
import 'package:buku_kia/widgets/deskripsi_widget.dart';
import 'package:buku_kia/widgets/judul_besar.dart';
import 'package:buku_kia/widgets/list_deskripsi.dart';
import 'package:buku_kia/widgets/peringatan_widget.dart';
import 'package:buku_kia/widgets/subtitle_biru.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IbuNifas2 extends StatelessWidget {
  const IbuNifas2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: orangeMuda,
      appBar: AppBar(
        backgroundColor: orangeTua,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Ibu Nifas',
                style: judulAppBAr,
              ),
            ),
          ),
        ],
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
                child: JudulBesar(
                    judul:
                        "Hal-hal yang harus dihindari oleh ibu bersalin dan selama nifas")),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Image.asset(
                        'assets/images/membuang.png',
                        width: 150,
                      ),
                    ),
                    Container(
                      width: width * 0.5,
                      child: const SubTitleBiru(
                        angka: "",
                        judul:
                            "Membuang ASI yang pertama keluar (kolostrum) karena sangat berguna untuk kekebalan tubuh anak",
                        padding: 15,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Image.asset(
                        'assets/images/mengikat.png',
                        width: 150,
                      ),
                    ),
                    Container(
                      width: width * 0.5,
                      child: const SubTitleBiru(
                        angka: "",
                        judul: "Mengikat perut terlalu kencang",
                        padding: 15,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Image.asset(
                        'assets/images/membersihkan.png',
                        width: 150,
                      ),
                    ),
                    Container(
                      width: width * 0.5,
                      child: const SubTitleBiru(
                        angka: "",
                        judul:
                            "Membersihkan payudara dengan alkohol/povidon iodine obat merah atau sabun karena bisa terminum oleh bayi",
                        padding: 15,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                      child: Image.asset(
                        'assets/images/menempel.png',
                        width: 150,
                      ),
                    ),
                    Container(
                      width: width * 0.5,
                      child: const SubTitleBiru(
                        angka: "",
                        judul:
                            "Menempelkan daun daunan pada kemaluan karena akan menimbulkan infeksi",
                        padding: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                color: hijauMuda,
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                width: width * 0.8,
                child: Center(
                    child: Text(
                  'Tanyakan pada dokter, bidan dan perawat mengenai kondisi kesehatan ibu nifas',
                  style: GoogleFonts.poppins(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
