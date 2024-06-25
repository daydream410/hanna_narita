import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import '../routes/drawer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart' as xlsio;
import 'package:open_file/open_file.dart';

class ExportToExcel extends StatefulWidget {
  const ExportToExcel({super.key});

  @override
  State<ExportToExcel> createState() => _ExportToExcelState();
}

final fromdate = TextEditingController().obs;
final todate = TextEditingController().obs;
late DateTime fromdatee;
late DateTime todatee;

class _ExportToExcelState extends State<ExportToExcel> {
  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          elevation: 3,
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          title: Image.asset(
            'images/logo12.png',
            fit: BoxFit.cover,
            width: 250,
          ),
          centerTitle: true,
        ),
        drawer: const NavDrawer(),
        drawerEnableOpenDragGesture: true,
        endDrawerEnableOpenDragGesture: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Pilih Tanggal',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: fromdate.value,
                  decoration: InputDecoration(
                    labelText: 'DATE FROM',
                    labelStyle: const TextStyle(
                      color: Colors.black,
                    ),
                    filled: true,
                    prefixIcon: const Icon(
                      Icons.calendar_today,
                      color: Colors.black,
                    ),
                    enabledBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: HexColor('#E8C5E5'),
                      ),
                    ),
                  ),
                  readOnly: true,
                  onTap: () {
                    selectDateFrom();
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: todate.value,
                  decoration: InputDecoration(
                    labelText: 'DATE TO',
                    labelStyle: const TextStyle(
                      color: Colors.black,
                    ),
                    filled: true,
                    prefixIcon: const Icon(
                      Icons.calendar_today,
                      color: Colors.black,
                    ),
                    enabledBorder:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: HexColor('#E8C5E5'),
                      ),
                    ),
                  ),
                  readOnly: true,
                  onTap: () {
                    selectDateTo();
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: ElevatedButton(
                      // onPressed: createExcel,
                      onPressed: () {
                        // getData();
                        // createExcel();
                        if (fromdate.value.text == '' ||
                            todate.value.text == '') {
                          Get.snackbar(
                            'Warning',
                            'Silahkan Mengisi Tanggal!',
                            backgroundColor: HexColor('#F19ED2'),
                            colorText: Colors.black,
                          );
                        } else {
                          Get.snackbar(
                            'Success',
                            'Membuka Rekapan Excel Periode ${DateFormat('dd-MM-yyyy').format(fromdatee)} - ${DateFormat('dd-MM-yyyy').format(todatee)}',
                            backgroundColor: HexColor('#E8C5E5'),
                            colorText: Colors.black,
                          );
                          Timer(const Duration(seconds: 4), createExcel);
                          // createExcel();
                        }
                      },
                      child: const Text(
                        'Export To Excel',
                        style: TextStyle(color: Colors.black),
                      )),
                ),
              ],
            ),
          ),
        ));
  }

  Future<void> selectDateFrom() async {
    DateTime? pickedFrom = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: HexColor('#E8C5E5'), // header background color
              onPrimary: Colors.black, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: HexColor('#E8C5E5'), // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedFrom != null) {
      setState(() {
        fromdate.value.text = pickedFrom.toString().split(" ")[0];
        fromdatee = pickedFrom;
      });
      print(fromdate.value.text);
      print(fromdatee.toString());
    }
  }

  Future<void> selectDateTo() async {
    DateTime? pickedTo = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: HexColor('#E8C5E5'), // header background color
              onPrimary: Colors.black, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: HexColor('#E8C5E5'), // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedTo != null) {
      setState(() {
        todate.value.text = pickedTo.toString().split(" ")[0];
        todatee = pickedTo;
      });
      print(todate.value.text);
    }
  }

  Future<void> createExcel() async {
    var collection = FirebaseFirestore.instance.collection('murid_list').where(
        'tanggalinput',
        isGreaterThanOrEqualTo: fromdatee,
        isLessThanOrEqualTo: todatee);
    var querySnapshot = await collection.get();

    final xlsio.Workbook workbook = xlsio.Workbook();
    final xlsio.Worksheet sheet = workbook.worksheets[0];

    sheet.getRangeByName('A1').columnWidth = 4;
    sheet.getRangeByName('B1').columnWidth = 15;
    sheet.getRangeByName('C1').columnWidth = 15;
    sheet.getRangeByName('D1').columnWidth = 15;
    sheet.getRangeByName('E1').columnWidth = 15;
    sheet.getRangeByName('F1').columnWidth = 15;
    sheet.getRangeByName('G1').columnWidth = 15;
    sheet.getRangeByName('H1').columnWidth = 20;
    sheet.getRangeByName('I1').columnWidth = 20;
    sheet.getRangeByName('J1').columnWidth = 20;
    sheet.getRangeByName('K1').columnWidth = 20;
    sheet.getRangeByName('L1').columnWidth = 20;
    sheet.getRangeByName('M1').columnWidth = 20;

    sheet.getRangeByName('A1').setText('No');
    sheet.getRangeByName('B1').setText('Nama Lengkap');
    sheet.getRangeByName('C1').setText('Umur (Tahun)');
    sheet.getRangeByName('D1').setText('Nomor HP');
    sheet.getRangeByName('E1').setText('Alamat');
    sheet.getRangeByName('F1').setText('Tipe Kelas');
    sheet.getRangeByName('G1').setText('Jumlah Sesi');
    sheet.getRangeByName('H1').setText('Status Pembayaran');
    sheet.getRangeByName('I1').setText('Tanggal DP');
    sheet.getRangeByName('J1').setText('Nominal DP');
    sheet.getRangeByName('K1').setText('Tanggal Lunas');
    sheet.getRangeByName('L1').setText('Nominal Lunas');
    sheet.getRangeByName('M1').setText('Tanggal Daftar');
    int no = 0;
    // ignore: prefer_typing_uninitialized_variables
    var tanggalDP;
    var tanggalLunas;
    for (var i = 0; i < querySnapshot.docs.length; i++) {
      no++;
      var tanggalDaftar = querySnapshot.docs[i]['tanggalinput'].toDate();
      if (querySnapshot.docs[i]['tanggaldp'] != null) {
        tanggalDP = querySnapshot.docs[i]['tanggaldp'].toDate();
      }
      if (querySnapshot.docs[i]['tanggallunas'] != null) {
        tanggalLunas = querySnapshot.docs[i]['tanggallunas'].toDate();
      }
      sheet.getRangeByIndex(i + 2, 1).setText(no.toString());
      sheet
          .getRangeByIndex(i + 2, 2)
          .setText(querySnapshot.docs[i]['nama'].toString());
      sheet
          .getRangeByIndex(i + 2, 3)
          .setText(querySnapshot.docs[i]['umur'].toString());
      sheet
          .getRangeByIndex(i + 2, 4)
          .setText(querySnapshot.docs[i]['nohp'].toString());
      sheet
          .getRangeByIndex(i + 2, 5)
          .setText(querySnapshot.docs[i]['alamat'].toString());
      sheet
          .getRangeByIndex(i + 2, 6)
          .setText(querySnapshot.docs[i]['tipekelas'].toString());
      sheet
          .getRangeByIndex(i + 2, 7)
          .setText(querySnapshot.docs[i]['jumlahsesi'].toString());
      sheet
          .getRangeByIndex(i + 2, 8)
          .setText(querySnapshot.docs[i]['statuspembayaran'].toString());
      sheet.getRangeByIndex(i + 2, 9).setText(
          querySnapshot.docs[i]['tanggaldp'] == null
              ? '-'
              : DateFormat('dd-MM-yyyy, HH:mm').format(tanggalDP).toString());
      sheet
          .getRangeByIndex(i + 2, 10)
          .setText(querySnapshot.docs[i]['nominalpembayaranDP'].toString());
      sheet.getRangeByIndex(i + 2, 11).setText(querySnapshot.docs[i]
                  ['tanggallunas'] ==
              null
          ? '-'
          : DateFormat('dd-MM-yyyy, HH:mm').format(tanggalLunas).toString());
      sheet
          .getRangeByIndex(i + 2, 12)
          .setText(querySnapshot.docs[i]['nominalpembayaranLunas'].toString());
      sheet.getRangeByIndex(i + 2, 13).setText(
          DateFormat('dd-MM-yyyy, HH:mm').format(tanggalDaftar).toString());
    }

    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    final String path = (await getApplicationSupportDirectory()).path;
    final String fileName = '$path/rekapan.xlsx';
    final File file = File(fileName);
    await file.writeAsBytes(bytes, flush: true);
    OpenFile.open(fileName);
  }
}
