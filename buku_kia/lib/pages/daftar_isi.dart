import 'package:buku_kia/commons/services.dart';
import 'package:buku_kia/pages/catatan_ibu_hamil/keluhan.dart';
import 'package:buku_kia/pages/catatan_ibu_hamil/menu.dart';
import 'package:buku_kia/pages/catatan_ibu_hamil/pemeriksaan.dart';
import 'package:buku_kia/pages/ibu_bersalin/ibubersalin1.dart';
import 'package:buku_kia/pages/ibu_hamil/ibuhamil1.dart';
import 'package:buku_kia/pages/ibu_nifas/ibunifas1.dart';
import 'package:buku_kia/pages/keluarga_berencana/keluargaberencana.dart';
import 'package:buku_kia/pages/registrasi.dart';
import 'package:buku_kia/pages/tim_peneliti.dart';
import 'package:buku_kia/pages/wrapper.dart';
import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/themes/font.dart';
import 'package:flutter/material.dart';

class DaftarIsi extends StatelessWidget {
  const DaftarIsi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.login_outlined,
          ),
          onPressed: () async {
            await AuthServices.signOut();

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Logout Berhasil'),
              ),
            );

            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const Wrapper(),
              ),
            );
          },
        ),
        backgroundColor: backgroundPink,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Daftar Isi',
                style: judulAppBAr,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(25, 0, 25, 25),
        color: const Color(0xffFF93DF),
        child: SingleChildScrollView(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Registrasi(),
                            ),
                          );
                        },
                        child: Container(
                          width: 150,
                          height: 150,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: catatanColor,
                            borderRadius: BorderRadius.circular(27),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/form.png',
                                width: 100,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Flexible(
                                child: Text(
                                  "Registrasi",
                                  textAlign: TextAlign.center,
                                  style: daftarIsi,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TimPeneliti(),
                            ),
                          );
                        },
                        child: Container(
                          width: 150,
                          height: 150,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: catatanColor,
                            borderRadius: BorderRadius.circular(27),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/form.png',
                                width: 100,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Flexible(
                                child: Text(
                                  "Tim Peneliti",
                                  textAlign: TextAlign.center,
                                  style: daftarIsi,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const IbuHamil1()),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: ibuHamilColor,
                          borderRadius: BorderRadius.circular(27),
                        ),
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Ibu Hamil",
                              style: daftarIsi,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Image.asset(
                              'assets/images/cium.png',
                              width: 100,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const IbuNifas1()),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(27),
                          color: ibuNifasColor,
                        ),
                        width: 150,
                        height: 150,
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/makan.png',
                              width: 100,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Ibu Nifas",
                              style: daftarIsi,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Menu()),
                          );
                        },
                        child: Container(
                          width: 150,
                          height: 150,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: catatanColor,
                            borderRadius: BorderRadius.circular(27),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/form.png',
                                width: 100,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Flexible(
                                child: Text(
                                  "Catatan Kesehatan Ibu Hamil",
                                  textAlign: TextAlign.center,
                                  style: daftarIsi,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const IbuBersalin1()),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: ibuBersalinColor,
                          borderRadius: BorderRadius.circular(27),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/bersalin.png',
                              width: 100,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Ibu Bersalin",
                              style: daftarIsi,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const KeluargaBerencana()),
                        );
                      },
                      child: Container(
                        width: 150,
                        height: 150,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: keluargaBerencanaColor,
                          borderRadius: BorderRadius.circular(27),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              child: Text(
                                "Keluarga Berencana",
                                style: daftarIsi,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Image.asset(
                              'assets/images/obat.png',
                              width: 100,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
