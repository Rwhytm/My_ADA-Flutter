import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

//register admin
  static Future<User?> signUp(String nik, String nama) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: nik + "@gmail.com", password: nama);

      User? firebaseUser = result.user;

      // await FirebaseCore.instance.createUserInFirestore(
      //   types.User(
      //     firstName: username,
      //     id: result.user!.uid,
      //     role: types.Role.admin,
      //   ),
      // );

      return firebaseUser;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
