import 'package:buku_kia/pages/ibu_bersalin/ibubersalin1.dart';
import 'package:buku_kia/pages/ibu_hamil/ibuhamil1.dart';
import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/themes/font.dart';
import 'package:flutter/material.dart';

class DaftarIsi extends StatelessWidget {
  const DaftarIsi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        padding: EdgeInsets.all(25),
        color: Color(0xffD9D9D9),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
                        color: Color(0xffDB65B8),
                        borderRadius: BorderRadius.circular(27),
                      ),
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/cium.png',
                            width: 100,
                          ),
                          Text(
                            "Ibu Bersalin",
                            style: daftarIsi,
                          ),
                        ],
                      ),
                    ),
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
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(27),
                        color: Color(0xffDB65B8),
                      ),
                      width: 150,
                      height: 150,
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/makan.png',
                            width: 100,
                          ),
                          Text(
                            "Ibu Bersalin",
                            style: daftarIsi,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: GestureDetector(
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
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Color(0xffDB65B8),
                          borderRadius: BorderRadius.circular(27),
                        ),
                        child: Column(
                          children: <Widget>[
                            Image.asset(
                              'assets/images/form.png',
                              width: 100,
                            ),
                            Text(
                              "Ibu Bersalin",
                              style: daftarIsi,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Color(0xffDB65B8),
                        borderRadius: BorderRadius.circular(27),
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/bersalin.png',
                            width: 100,
                          ),
                          Text(
                            "Ibu Bersalin",
                            style: daftarIsi,
                          ),
                        ],
                      ),
                    ),
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
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: Color(0xffDB65B8),
                        borderRadius: BorderRadius.circular(27),
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/obat.png',
                            width: 100,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Ibu Bersalin",
                            style: daftarIsi,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
