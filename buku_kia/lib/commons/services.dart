import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // static Future<String?> pasienSignUp(String nik, String nama) async {
  //   try {} catch (e) {}
  // }

//register admin
  static Future<User?> signUp(String nik, String nama) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: nik + "@gmail.com", password: nama);

      User? firebaseUser = result.user;
      await FirebaseFirestore.instance
          .collection('pasien')
          .add({'nama': nama, "nik": nik})
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
}
