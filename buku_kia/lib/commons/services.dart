import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static User user = _auth.currentUser!;
  final id = user.uid;
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

  //registrasi
  static Future<User?> registrasi(
    String noreg,
    String nourutKahort,
    String tanggalMenerima,
    String namaPetugas,
    String noHPPetugas,
    String ttdIbu,
    String kehamilanKe,
    String agamaIbu,
    String pendidikanIbu,
    String goldarIbu,
    String pekerjaanIbu,
    String noJKN,
    String namaSuami,
    String ttdAyah,
    String agamaAyah,
    String pendidikanAyah,
    String goldarAyah,
    String pekerjaanAyah,
    String alamatRumah,
    String kecamatan,
    String kabupaten,
    String noHp,
    String namaAnak,
    String ttdAnak,
    String anakKe,
    String noAkte,
  ) async {
    await FirebaseFirestore.instance
        .collection('pasiens')
        .doc(user.uid)
        .collection('data_pasien')
        .add({
      'nomor registrasi ibu': noreg,
      'nomor urut di kahort ibu': nourutKahort,
      'tanggal menerima buku kia': tanggalMenerima,
      'TTL ibu': ttdIbu,
      'kehamilan ke-': kehamilanKe,
      'agama ibu': agamaIbu,
      'pendidikan ibu': pendidikanIbu,
      'golongan darah ibu': goldarIbu,
      'pekerjaan ibu': pekerjaanIbu,
      'no JKN': noJKN,
      'nama suami': namaSuami,
      'TTL ayah': ttdAyah,
      'agama suami': agamaAyah,
      'pendidikan suami': pendidikanAyah,
      'golongan darah suami': goldarAyah,
      'pekerjaan suami': pekerjaanAyah,
      'alamat rumah': alamatRumah,
      'kecamatan': kecamatan,
      'kabupaten': kabupaten,
      'nomor yang bisa dihubungi': noHp,
      'nama anak': namaAnak,
      'TTL anak': ttdAnak,
      'anak ke': anakKe,
      'Nomor Akte': noAkte,
    });
  }

  static Stream<User?> get FirebaseUserStream => _auth.authStateChanges();
}
