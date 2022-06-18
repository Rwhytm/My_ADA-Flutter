import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/themes/font.dart';
import 'package:buku_kia/widgets/deskripsi_widget.dart';
import 'package:buku_kia/widgets/judul_besar.dart';
import 'package:buku_kia/widgets/list_deskripsi.dart';
import 'package:buku_kia/widgets/peringatan_widget.dart';
import 'package:buku_kia/widgets/subtitle_biru.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IbuNifas3 extends StatelessWidget {
  const IbuNifas3({Key? key}) : super(key: key);

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
            const JudulBesar(judul: "CARA MENYUSUI BAYI "),
            const SizedBox(
              height: 5,
            ),
            DeskripsiWidget(
                deskripsi: 'Cara menyusui yang benar :', padding: 3),
            ListDeskripsiWidget(
                nomor: " - ",
                deskripsi:
                    "Susui bayi sesering mungkin, semau bayi, paling sedikit 8 kali sehari.",
                padding: 15),
            ListDeskripsiWidget(
                nomor: " - ",
                deskripsi:
                    "Bila bayi tidur lebih dari 3 jam, bangunkan, lalu susui",
                padding: 15),
            ListDeskripsiWidget(
                nomor: " - ",
                deskripsi:
                    "Susui sampai payudara terasa kosong, lalu pindah ke payudara sisi yang lain",
                padding: 15),
            ListDeskripsiWidget(
                nomor: " - ",
                deskripsi:
                    "Bila bayi sudah kenyang, tapi payudara masih terasa penuh/kencang, perlu dikosongkan dengan diperah untuk disimpan. Hal ini agar payudara tetap memproduksi ASI yang cukup.",
                padding: 15),
            const JudulBesar(judul: "Posisi dan pelekatan menyusui yang benar"),
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
                        'assets/images/menyusui1.png',
                        width: 150,
                      ),
                    ),
                    Container(
                      width: width * 0.5,
                      child: ListDeskripsiWidget(
                        nomor: " - ",
                        deskripsi:
                            "Pastikan posisi ibu ada dalam posisi yang nyaman Susui sampai payudara terasa kosong, lalu pindah ke payudara sisi yang lain",
                        padding: 15,
                      ),
                    ),
                    Container(
                      width: width * 0.5,
                      child: ListDeskripsiWidget(
                        nomor: " - ",
                        deskripsi:
                            "Kepala dan badan bayi berada dalam garis lurus",
                        padding: 15,
                      ),
                    ),
                    Container(
                      width: width * 0.5,
                      child: ListDeskripsiWidget(
                        nomor: " - ",
                        deskripsi:
                            "Wajah bayi menghadap payudara, hidung berhadapan dengan puting.",
                        padding: 15,
                      ),
                    ),
                    Container(
                      width: width * 0.5,
                      child: ListDeskripsiWidget(
                        nomor: " - ",
                        deskripsi:
                            "Ibu harus memeluk badan bayi dekat dengan badannya.",
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
                        'assets/images/menyusui2.png',
                        width: 150,
                      ),
                    ),
                    Container(
                      width: width * 0.5,
                      child: ListDeskripsiWidget(
                        nomor: " - ",
                        deskripsi:
                            "Jika bayi baru lahir, Ibu harus menyangga seluruh badan bayi.",
                        padding: 15,
                      ),
                    ),
                    Container(
                      width: width * 0.5,
                      child: ListDeskripsiWidget(
                        nomor: " - ",
                        deskripsi:
                            "Sebagian besar areola (bagian hitam disekitar puting) masuk ke dalam mulut bayi.",
                        padding: 15,
                      ),
                    ),
                    Container(
                      width: width * 0.5,
                      child: ListDeskripsiWidget(
                        nomor: " - ",
                        deskripsi: "Mulut terbuka lebar.",
                        padding: 15,
                      ),
                    ),
                    Container(
                      width: width * 0.5,
                      child: ListDeskripsiWidget(
                        nomor: " - ",
                        deskripsi: "Bibir bawah melengkung ke luar.",
                        padding: 15,
                      ),
                    ),
                    Container(
                      width: width * 0.5,
                      child: ListDeskripsiWidget(
                        nomor: " - ",
                        deskripsi: "Dagu menyentuh payudara ibu.",
                        padding: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Center(
              child: const JudulBesar(judul: "Posisi Menyusui Bayi Kembar :"),
            ),
            Padding(
              padding: EdgeInsets.all(25),
              child: Center(
                child: Image.asset(
                  'assets/images/menyusuikembar.png',
                  width: 350,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
