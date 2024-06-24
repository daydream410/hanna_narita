// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:hanna_narita/controller/homepage_c.dart';
import 'package:hanna_narita/routes/drawer.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import '../../routes/route_name.dart';

class TambahMurid extends StatefulWidget {
  const TambahMurid({super.key});

  @override
  State<TambahMurid> createState() => _TambahMuridState();
}

class _TambahMuridState extends State<TambahMurid> {
  String selectedPayment = 'None';
  String selectedClass = 'None';
  String selectedSesi = 'None';
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var myController = Get.put(HomePageController());
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: myController.nama.value,
                decoration: InputDecoration(
                  labelText: "Nama Lengkap",
                  hintText: "Masukkan Nama Lengkap Murid",
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: HexColor('#E8C5E5'),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: HexColor('#E8C5E5'),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: myController.umur.value,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Umur (Tahun)",
                  hintText: "Masukkan Umur Murid",
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: HexColor('#E8C5E5'),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: HexColor('#E8C5E5'),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: myController.nohp.value,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Nomor HP",
                  hintText: "Masukkan Nomor HP Murid",
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: HexColor('#E8C5E5'),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: HexColor('#E8C5E5'),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: myController.alamat.value,
                decoration: InputDecoration(
                  labelText: "Alamat",
                  hintText: "Masukkan Alamat Murid",
                  labelStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: HexColor('#E8C5E5'),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: HexColor('#E8C5E5'),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Tipe Kelas',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                height: size.height * 0.05,
                child: RadioMenuButton(
                  value: 'Self Makeup',
                  groupValue: selectedClass,
                  onChanged: (selectedValue) {
                    setState(() => selectedClass = selectedValue!);
                    print(selectedClass);
                  },
                  child: const Text(
                    'Self Makeup',
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: size.height * 0.05,
                child: RadioMenuButton(
                  value: 'Self Hairdo',
                  groupValue: selectedClass,
                  onChanged: (selectedValue) {
                    setState(() => selectedClass = selectedValue!);
                    print(selectedClass);
                  },
                  child: const Text(
                    'Self Hairdo',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Jumlah Sesi',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                height: size.height * 0.05,
                child: RadioMenuButton(
                  value: '1',
                  groupValue: selectedSesi,
                  onChanged: (selectedValue) {
                    setState(() => selectedSesi = selectedValue!);
                    print(selectedSesi);
                  },
                  child: const Text(
                    '1x Sesi',
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: size.height * 0.05,
                child: RadioMenuButton(
                  value: '3',
                  groupValue: selectedSesi,
                  onChanged: (selectedValue) {
                    setState(() => selectedSesi = selectedValue!);
                    print(selectedSesi);
                  },
                  child: const Text(
                    '3x Sesi',
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Metode Pembayaran',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                height: size.height * 0.05,
                child: RadioMenuButton(
                  value: 'DP',
                  groupValue: selectedPayment,
                  onChanged: (selectedValue) {
                    setState(() => selectedPayment = selectedValue!);
                    print(selectedPayment);
                  },
                  child: const Text(
                    'Down Payment (DP)',
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: size.height * 0.05,
                child: RadioMenuButton(
                  value: 'Lunas',
                  groupValue: selectedPayment,
                  onChanged: (selectedValue) {
                    setState(() => selectedPayment = selectedValue!);
                    print(selectedPayment);
                  },
                  child: const Text(
                    'Full Payment (Lunas)',
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32, bottom: 21),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: HexColor('#E8C5E5'),
            ),
            onPressed: () {
              showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10.0)),
                  ),
                  elevation: 5,
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Container(
                        height: size.height * 0.25,
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Masukkan Nominal',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                                // key: formKey,
                                keyboardType: TextInputType.number,
                                controller:
                                    myController.nominalpembayaran.value,
                                decoration: InputDecoration(
                                  labelText: "Masukkan Nominal",
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(
                                      color: HexColor('#E8C5E5'),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    borderSide: BorderSide(
                                      color: HexColor('#E8C5E5'),
                                      width: 2.0,
                                    ),
                                  ),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: HexColor('#E8C5E5'),
                                ),
                                onPressed: () {
                                  print(selectedPayment);
                                  if (myController.nama.value.text == '' ||
                                      myController.nohp.value.text == '' ||
                                      myController.alamat.value.text == '' ||
                                      myController.umur.value.text == '' ||
                                      selectedClass == 'None' ||
                                      selectedSesi == 'None' ||
                                      selectedPayment == 'None' ||
                                      myController
                                              .nominalpembayaran.value.text ==
                                          '') {
                                    Get.snackbar(
                                      'Failed',
                                      'Gagal menambahkan data, semua kolom wajib di isi!',
                                      backgroundColor: HexColor('#F19ED2'),
                                      colorText: Colors.black,
                                    );
                                  } else {
                                    if (selectedPayment == 'DP') {
                                      myController.addMuridDP(
                                        myController.nama.value.text,
                                        myController.nohp.value.text,
                                        myController.alamat.value.text,
                                        int.parse(myController.umur.value.text),
                                        selectedClass,
                                        int.parse(selectedSesi),
                                        selectedPayment,
                                        int.parse(myController
                                            .nominalpembayaran.value.text),
                                      );
                                    } else {
                                      myController.addMuridLunas(
                                        myController.nama.value.text,
                                        myController.nohp.value.text,
                                        myController.alamat.value.text,
                                        int.parse(myController.umur.value.text),
                                        selectedClass,
                                        int.parse(selectedSesi),
                                        selectedPayment,
                                        int.parse(myController
                                            .nominalpembayaran.value.text),
                                      );
                                    }
                                    Get.snackbar(
                                      'Success',
                                      'Murid ${myController.nama.value.text} berhasil ditambahkan!',
                                      backgroundColor: HexColor('#E8C5E5'),
                                      colorText: Colors.black,
                                    );
                                    Get.offAllNamed(RouteName.homePage);
                                  }
                                },
                                child: const Text(
                                  'Save',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: const Text(
              'Masukkan Nominal',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
