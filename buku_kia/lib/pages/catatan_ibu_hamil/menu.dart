import 'package:buku_kia/commons/services.dart';
import 'package:buku_kia/pages/catatan_ibu_hamil/keluhan.dart';
import 'package:buku_kia/pages/catatan_ibu_hamil/menyambut_persalinan.dart';
import 'package:buku_kia/pages/catatan_ibu_hamil/pemeriksaan.dart';
import 'package:buku_kia/pages/daftar_isi.dart';
import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/themes/font.dart';
import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const DaftarIsi()),
            );
          },
        ),
        backgroundColor: backgroundPink,
        title: Text(
          'Form Pemeriksaan',
          style: judulAppBAr,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(25),
        color: const Color(0xffFF93DF),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MenyambutPersalinan(),
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
                                "Menyambut Persalinan",
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
                            builder: (context) => Pemeriksaan(),
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
                                "Pemeriksaan",
                                textAlign: TextAlign.center,
                                style: daftarIsi,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Keluhan()),
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
                            'assets/images/form.png',
                            width: 100,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Keluhan",
                            style: daftarIsi,
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
    );
  }
}
