import 'package:buku_kia/themes/color.dart';
import 'package:flutter/material.dart';

class BoxGreen extends StatelessWidget {
  final Widget widget;
  BoxGreen({
    required this.widget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width;
    return Container(
      width: size * 0.8,
      decoration: BoxDecoration(
        border: Border.all(
          color: hijauTua,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(
          30,
        ),
        color: hijauMuda,
      ),
      child: widget,
    );
  }
}
