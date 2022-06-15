import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/themes/font.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BoxPenjelasan extends StatelessWidget {
  final String judul;
  final String deskripsi;
  final String textlogo;
  const BoxPenjelasan(
      {required this.judul,
      required this.deskripsi,
      required this.textlogo,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.all(5),
      width: width * 0.9,
      decoration: BoxDecoration(
        color: putih,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(37),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: bundaranUngu,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                textlogo,
                style: textLogoTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  judul,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: judulBiru,
                ),
                Text(
                  deskripsi,
                  overflow: TextOverflow.visible,
                  style: deskripsiHitamTextStyle,
                  textAlign: TextAlign.left,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
