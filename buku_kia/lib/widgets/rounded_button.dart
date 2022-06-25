import 'package:buku_kia/themes/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color? color, textColor;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = putih,
    this.textColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.7,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: newElevatedButton(),
      ),
    );
  }

  //Used:ElevatedButton as FlatButton is deprecated.
  //Here we have to apply customizations to Button by inheriting the styleFrom

  Widget newElevatedButton() {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      onPressed: press != null
          ? () {
              press();
            }
          : null,
      style: ElevatedButton.styleFrom(
        primary: color,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        textStyle: GoogleFonts.poppins(
          color: textColor,
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
