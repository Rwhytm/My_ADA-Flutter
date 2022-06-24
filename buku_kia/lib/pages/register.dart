import 'package:buku_kia/commons/services.dart';
import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/widgets/judul_besar.dart';
import 'package:buku_kia/widgets/rounded_button.dart';
import 'package:buku_kia/widgets/rounded_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _registering = false;
  TextEditingController nikController = TextEditingController(text: "");
  TextEditingController namaIbuController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundPink,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const JudulBesar(judul: "Buat Akun"),
              SvgPicture.asset(
                "assets/images/signup.svg",
                height: size.height * 0.35,
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedInputField(
                controller: nikController,
                hintText: "Masukkan NIK",
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedInputField(
                controller: namaIbuController,
                hintText: "Masukkan Nama Ibu",
              ),
              RoundedButton(
                text: "Register",
                press: () async {
                  await AuthServices.signUp(
                    nikController.text,
                    namaIbuController.text,
                  );
                },
              ),
            ],
          ),
        ),
      )),
    );
  }
}
