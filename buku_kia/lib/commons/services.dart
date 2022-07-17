import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static User user = _auth.currentUser!;
  final id = user.uid;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference _pasien =
      FirebaseFirestore.instance.collection('pasiens');

//register pasien
  static Future<User?> signUpPasien(String nik, String nama) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: nik + "@kia.com", password: nama.toUpperCase());

      User? firebaseUser = result.user;
      await FirebaseFirestore.instance
          .collection('pasiens')
          .doc(user.uid)
          .set({'nama': nama.toUpperCase(), "nik": nik})
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
    String namaIbu,
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
        .doc(user.uid)
        .set({
      'nomor registrasi ibu': noreg,
      'nomor urut di kahort ibu': nourutKahort,
      'tanggal menerima buku kia': tanggalMenerima,
      'nama petugas': namaPetugas,
      'nomor petugas': noHPPetugas,
      'nama ibu': namaIbu,
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

  //edit registrasi
  static Future<User?> editregistrasi(
    String noreg,
    String nourutKahort,
    String tanggalMenerima,
    String namaPetugas,
    String noHPPetugas,
    String namaIbu,
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
        .doc(user.uid)
        .set({
      'nomor registrasi ibu': noreg,
      'nomor urut di kahort ibu': nourutKahort,
      'tanggal menerima buku kia': tanggalMenerima,
      'nama petugas': namaPetugas,
      'nomor petugas': noHPPetugas,
      'nama ibu': namaIbu,
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

  static Future getData() async {
    var snapshot = await FirebaseFirestore.instance
        .collection('pasiens')
        .doc(user.uid)
        .collection('data_pasien')
        .get();

    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  //tambah data diri pemeriksaan
  static Future<User?> pemeriksaanDataDiri(
    String hamilke,
    String jumlahPersalinan,
    String jumlahKeguguran,
    String jumlahAnakHidup,
    String jumlahAnakMati,
    String jumlahAnakKurangBulan,
    String jarakKehamilan,
    String statusImunisasi,
    String penolongPersalinan,
    String caraPersalinan,
  ) async {
    await FirebaseFirestore.instance
        .collection('pasiens')
        .doc(user.uid)
        .collection('data_diri_pemeriksaan')
        .doc(user.uid)
        .set({
      'hamil ke': hamilke,
      'jumlah persalinan': jumlahPersalinan,
      'jumlah keguguran': jumlahKeguguran,
      'jumlah anak hidup': jumlahAnakHidup,
      'jumlah anak kurang bulan': jumlahAnakKurangBulan,
      'jarak kehamilan': jarakKehamilan,
      'status imunisasi': statusImunisasi,
      'pertolongan persalinan': penolongPersalinan,
      'cara persalinan': caraPersalinan,
    });
  }

  //tambah data  pemeriksaan
  static Future<User?> pemeriksaanTabel(
    String kakiBengkak,
    String hasilPemeriksaan,
    String tindakan,
    String nasihat,
    String keterangan,
    String kapanHarusKembali,
  ) async {
    await FirebaseFirestore.instance
        .collection('pasiens')
        .doc(user.uid)
        .collection('data_pemeriksaan')
        .add({
      'kaki bengkak': kakiBengkak,
      'hasil laboratorium': hasilPemeriksaan,
      'tindakan': tindakan,
      'nasihat': nasihat,
      'keterangan': keterangan,
      'kapan harus kembali': kapanHarusKembali,
    });
  }

//tambah data  pemeriksaan Keluhan
  static Future<User?> KeluhanTabel(
    String tanggal,
    String keluhanSekarang,
    String id,
    String tekananDarah,
    String beratBadan,
    String umurKehamilan,
    String tinggiFundus,
    String letakJanin,
    String denyutJantung,
  ) async {
    await FirebaseFirestore.instance
        .collection('pasiens')
        .doc(user.uid)
        .collection('data_keluhan')
        .doc(user.uid + id)
        .set({
      'tanggal': tanggal,
      'keluhan sekarang': keluhanSekarang,
      'tekanan darah': tekananDarah,
      'berat badan': beratBadan,
      'umur kehamilan': umurKehamilan,
      'tinggi fundus': tinggiFundus,
      'letak janin': letakJanin,
      'denyut jantung': denyutJantung,
      'id': user.uid + id,
    });
  }

  //tambah data diri pemeriksaan
  static Future<User?> keluhanDataDiri(
    String hariPertamaHaid,
    String htp,
    String lingkarLenganAtas,
    String tinggiBadan,
    String golonganDarah,
    String penggunaanKontrasepsi,
    String riwayatPenyakitIbu,
    String riwayatAlergi,
  ) async {
    await FirebaseFirestore.instance
        .collection('pasiens')
        .doc(user.uid)
        .collection('data_diri_keluhan')
        .doc(user.uid)
        .set({
      'Hari Pertama HAID': hariPertamaHaid,
      'hari taksiran': htp,
      'lingkar lengan atas': lingkarLenganAtas,
      'tinggi badan': tinggiBadan,
      'golongan darah': golonganDarah,
      'penggunaan kontrasepsi': penggunaanKontrasepsi,
      'riwayat penyakit': riwayatPenyakitIbu,
      'riwayat Alergi': riwayatAlergi,
    });
  }

//tambah data diri pemeriksaan
  static Future<User?> menyambutData(
    String nama,
    String alamat,
    String bulan,
    String tahun,
    String dokter1,
    String dokter2,
    String dana,
    String kendaraan1,
    String kendaraan2,
    String kendaraan3,
    String metodekb,
    String goldar,
    String donor1,
    String donor2,
    String create,
  ) async {
    await FirebaseFirestore.instance
        .collection('pasiens')
        .doc(user.uid)
        .collection('data_menyambut_persalinan')
        .doc(user.uid)
        .set({
      'nama': nama,
      'alamat': alamat,
      'bulan': bulan,
      'tahun': tahun,
      'dokter1': dokter1,
      'dokter2': dokter2,
      'dana': dana,
      'kendaraan1': kendaraan1,
      'kendaraan2': kendaraan2,
      'kendaraan3': kendaraan3,
      'metodekb': metodekb,
      'goldar': goldar,
      'donor1': donor1,
      'donor2': donor2,
      'created_at': create,
      'updated_at': DateTime.now(),
    });
  }

  static Stream<User?> get firebaseUserStream => _auth.authStateChanges();
}
