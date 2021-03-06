import 'package:buku_kia/commons/services.dart';
import 'package:buku_kia/pages/register.dart';
import 'package:buku_kia/pages/wrapper.dart';
import 'package:buku_kia/themes/color.dart';
import 'package:buku_kia/widgets/judul_besar.dart';
import 'package:buku_kia/widgets/rounded_button.dart';
import 'package:buku_kia/widgets/rounded_input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _RegisterState();
}

class _RegisterState extends State<Login> {
  bool _login = false;
  TextEditingController nikController = TextEditingController(text: "");
  TextEditingController namaIbuController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: orangeTua,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // SvgPicture.asset(
              //   "assets/images/nurse1.png",
              //   height: size.height * 0.35,
              // ),
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                "assets/images/nurse1.png",
                height: size.height * 0.35,
              ),

              Text(
                "LOGIN",
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
                hintText: "Masukkan nama Ibu",
              ),
              const SizedBox(
                height: 25,
              ),
              RoundedButton(
                text: "Login",
                press: () async {
                  await AuthServices.signIn(
                    nikController.text,
                    namaIbuController.text,
                  ).then(
                    (value) => ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(value != null
                            ? "Login Berhasil"
                            : "Data Anda Salah"),
                      ),
                    ),
                  );

                  await Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Wrapper(),
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Belum memiliki akun ?",
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
                            return Register();
                          },
                        ),
                      );
                    },
                    child: Text(
                      'Register',
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.blue,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
