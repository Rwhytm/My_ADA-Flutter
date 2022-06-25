import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

//register pasien
  static Future<User?> signUpPasien(String nik, String nama) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: nik + "@kia.com", password: nama.toUpperCase());

      User? firebaseUser = result.user;
      await FirebaseFirestore.instance
          .collection('pasiens')
          .add({'nama': nama.toUpperCase(), "nik": nik})
          .then(
            (value) => print('Pasien berhasil ditambah'),
          )
          .catchError(
            (error) => print('Pasien gagal ditambahkan $error'),
          );
      return firebaseUser;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //login
  static Future<User?> signIn(String nik, String nama) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: nik + "@kia.com",
        password: nama.toUpperCase(),
      );

      User? firebaseUser = result.user;
      return firebaseUser;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //logout
  static Future<User?> signOut() async {
    await _auth.signOut();
  }

  static Stream<User?> get FirebaseUserStream => _auth.authStateChanges();
}
