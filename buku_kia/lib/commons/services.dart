import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

//register admin
  static Future<User?> signUp(String nik, String nama) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: nik + "@kia.com", password: nama);

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
}
