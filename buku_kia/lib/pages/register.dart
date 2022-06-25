import 'package:buku_kia/commons/services.dart';
import 'package:buku_kia/pages/login.dart';
import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/widgets/judul_besar.dart';
import 'package:buku_kia/widgets/rounded_button.dart';
import 'package:buku_kia/widgets/rounded_input_field.dart';
import 'package:buku_kia/widgets/subjudulBesar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isSwitched = false;
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
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'PASIEN',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(
                        () {
                          isSwitched = value;
                        },
                      );
                    },
                  ),
                  Text(
                    'BIDAN',
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              )),
              SvgPicture.asset(
                "assets/images/signup.svg",
                height: size.height * 0.35,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                (isSwitched == true
                    ? "Register Sebagai Bidan"
                    : "Register Sebagai Pasien"),
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedInputField(
                keyboard: TextInputType.number,
                controller: nikController,
                hintText: "Masukkan NIK",
              ),
              const SizedBox(
                height: 10,
              ),
              RoundedInputField(
                keyboard: TextInputType.name,
                controller: namaIbuController,
                hintText: "Masukkan Nama Ibu",
              ),
              const SizedBox(
                height: 25,
              ),
              RoundedButton(
                text: "Register",
                press: () async {
                  try {
                    await AuthServices.signUp(
                      nikController.text,
                      namaIbuController.text,
                    );

                    await ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Berhasil melakukan registrasi'),
                      ),
                    );
                  } catch (e) {
                    await ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(e.toString()),
                      ),
                    );
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Sudah memiliki akun ?",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Login();
                            },
                          ),
                        );
                      },
                      child: Text(
                        'Login',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.blue,
                            fontWeight: FontWeight.w600),
                      ))
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
