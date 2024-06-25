import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePageController extends GetxController {
  final searchLog = TextEditingController().obs;
  final searchLogSM = TextEditingController().obs;
  final nama = TextEditingController().obs;
  final nohp = TextEditingController().obs;
  final alamat = TextEditingController().obs;
  final umur = TextEditingController().obs;
  final tipekelas = TextEditingController().obs;
  final jumlahsesi = TextEditingController().obs;
  final statuspembayaran = TextEditingController().obs;
  final nominalpembayaran = TextEditingController().obs;
  final tanggal = DateTime.now();
  final tanggalinput = DateTime.now();

  Future addMuridDP(
      String nama,
      String nohp,
      String alamat,
      int umur,
      String tipekelas,
      int jumlahsesi,
      String statuspembayaran,
      int nominalpembayaran) async {
    await FirebaseFirestore.instance.collection('murid_list').add({
      'nama': nama,
      'nohp': nohp,
      'alamat': alamat,
      'umur': umur,
      'tipekelas': tipekelas,
      'jumlahsesi': jumlahsesi,
      'statuspembayaran': statuspembayaran,
      'nominalpembayaranDP': nominalpembayaran,
      'nominalpembayaranLunas': null,
      'tanggaldp': tanggal,
      'tanggallunas': null,
      'tanggalinput': tanggalinput,
      'absen1': null,
      'absen2': null,
      'absen3': null,
    });
  }

  Future addMuridLunas(
      String nama,
      String nohp,
      String alamat,
      int umur,
      String tipekelas,
      int jumlahsesi,
      String statuspembayaran,
      int nominalpembayaran) async {
    await FirebaseFirestore.instance.collection('murid_list').add({
      'nama': nama,
      'nohp': nohp,
      'alamat': alamat,
      'umur': umur,
      'tipekelas': tipekelas,
      'jumlahsesi': jumlahsesi,
      'statuspembayaran': statuspembayaran,
      'nominalpembayaranDP': null,
      'nominalpembayaranLunas': nominalpembayaran,
      'tanggaldp': null,
      'tanggallunas': tanggal,
      'tanggalinput': tanggalinput,
      'absen1': null,
      'absen2': null,
      'absen3': null,
    });
  }
}
