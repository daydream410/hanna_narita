import 'package:flutter/material.dart';
import 'package:hanna_narita/controller/homepage_c.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

import '../../routes/route_name.dart';

class AbsenDetail extends StatefulWidget {
  const AbsenDetail({super.key});

  @override
  State<AbsenDetail> createState() => _AbsenDetailState();
}

class _AbsenDetailState extends State<AbsenDetail> {
  var args = Get.arguments;
  var myController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    late DateTime dateDP;
    late DateTime dateLunas;
    late DateTime absen1;
    late DateTime absen2;
    late DateTime absen3;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        elevation: 3,
        title: Image.asset(
          'images/logo12.png',
          fit: BoxFit.cover,
          width: 250,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('murid_list')
                      .doc(args[0])
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      if (snapshot.hasData) {
                        if (snapshot.data!['tanggaldp'] != null) {
                          dateDP = snapshot.data!['tanggaldp'].toDate();
                        } else {
                          dateDP = DateTime.now();
                          dateLunas = DateTime.now();
                        }
                        if (snapshot.data!['tanggallunas'] != null) {
                          dateLunas = snapshot.data!['tanggallunas'].toDate();
                        } else {
                          dateDP = DateTime.now();
                          dateLunas = DateTime.now();
                        }

                        if (snapshot.data!['absen1'] != null) {
                          absen1 = snapshot.data!['absen1'].toDate();
                        } else {
                          absen1 = DateTime.now();
                        }
                        if (snapshot.data!['absen2'] != null) {
                          absen2 = snapshot.data!['absen2'].toDate();
                        } else {
                          absen1 = DateTime.now();
                          absen2 = DateTime.now();
                        }
                        if (snapshot.data!['absen3'] != null) {
                          absen3 = snapshot.data!['absen3'].toDate();
                        } else {
                          absen1 = DateTime.now();
                          absen2 = DateTime.now();
                          absen3 = DateTime.now();
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: double.infinity,
                              constraints: const BoxConstraints(
                                maxHeight: double.infinity,
                              ),
                              decoration: BoxDecoration(
                                color: HexColor('#E8C5E5'),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 4,
                                    offset: Offset(4, 8), // Shadow position
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Nama Lengkap',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      snapshot.data!['nama'] ?? '',
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: double.infinity,
                              constraints: const BoxConstraints(
                                maxHeight: double.infinity,
                              ),
                              decoration: BoxDecoration(
                                color: HexColor('#E8C5E5'),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 4,
                                    offset: Offset(4, 8), // Shadow position
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Nomor HP',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      snapshot.data!['nohp'] ?? '',
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // Container(
                            //   width: double.infinity,
                            //   constraints: const BoxConstraints(
                            //     maxHeight: double.infinity,
                            //   ),
                            //   decoration: BoxDecoration(
                            //     color: HexColor('#E8C5E5'),
                            //     borderRadius:
                            //         const BorderRadius.all(Radius.circular(10)),
                            //     boxShadow: const [
                            //       BoxShadow(
                            //         color: Colors.grey,
                            //         blurRadius: 4,
                            //         offset: Offset(4, 8), // Shadow position
                            //       ),
                            //     ],
                            //   ),
                            //   child: Padding(
                            //     padding: const EdgeInsets.all(16.0),
                            //     child: Column(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         const Text(
                            //           'Alamat',
                            //           style: TextStyle(
                            //             fontSize: 20,
                            //             fontWeight: FontWeight.w500,
                            //           ),
                            //         ),
                            //         const SizedBox(
                            //           height: 5,
                            //         ),
                            //         Text(
                            //           snapshot.data!['alamat'] ?? '',
                            //           style: const TextStyle(
                            //             fontSize: 15,
                            //             fontWeight: FontWeight.w400,
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 20,
                            // ),
                            // Container(
                            //   width: double.infinity,
                            //   constraints: const BoxConstraints(
                            //     maxHeight: double.infinity,
                            //   ),
                            //   decoration: BoxDecoration(
                            //     color: HexColor('#E8C5E5'),
                            //     borderRadius:
                            //         const BorderRadius.all(Radius.circular(10)),
                            //     boxShadow: const [
                            //       BoxShadow(
                            //         color: Colors.grey,
                            //         blurRadius: 4,
                            //         offset: Offset(4, 8), // Shadow position
                            //       ),
                            //     ],
                            //   ),
                            //   child: Padding(
                            //     padding: const EdgeInsets.all(16.0),
                            //     child: Column(
                            //       crossAxisAlignment: CrossAxisAlignment.start,
                            //       children: [
                            //         const Text(
                            //           'Umur (Tahun)',
                            //           style: TextStyle(
                            //             fontSize: 20,
                            //             fontWeight: FontWeight.w500,
                            //           ),
                            //         ),
                            //         const SizedBox(
                            //           height: 5,
                            //         ),
                            //         Text(
                            //           '${snapshot.data!['umur'].toString()} Tahun',
                            //           style: const TextStyle(
                            //             fontSize: 15,
                            //             fontWeight: FontWeight.w400,
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 20,
                            // ),
                            Container(
                              width: double.infinity,
                              constraints: const BoxConstraints(
                                maxHeight: double.infinity,
                              ),
                              decoration: BoxDecoration(
                                color: HexColor('#E8C5E5'),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 4,
                                    offset: Offset(4, 8), // Shadow position
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Tipe Kelas',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      snapshot.data!['tipekelas'] ?? '',
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: double.infinity,
                              constraints: const BoxConstraints(
                                maxHeight: double.infinity,
                              ),
                              decoration: BoxDecoration(
                                color: HexColor('#E8C5E5'),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 4,
                                    offset: Offset(4, 8), // Shadow position
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Jumlah Sesi',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '${snapshot.data!['jumlahsesi'].toString()}x Sesi',
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: double.infinity,
                              constraints: const BoxConstraints(
                                maxHeight: double.infinity,
                              ),
                              decoration: BoxDecoration(
                                color: HexColor('#E8C5E5'),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 4,
                                    offset: Offset(4, 8), // Shadow position
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Status Pembayaran',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    snapshot.data!['statuspembayaran'] == 'DP'
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '- Sudah ${snapshot.data!['statuspembayaran']} sebesar Rp ${NumberFormat.currency(locale: 'eu', symbol: '').format(snapshot.data!['nominalpembayaranDP'])}pada tanggal ${DateFormat('dd/MM/yyyy, HH:mm').format(dateDP)}',
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              const Row(
                                                children: [
                                                  Text(
                                                    '- Lunas : Belum Lunas',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons.warning,
                                                    color: Colors.red,
                                                    size: 20,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          )
                                        : Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              snapshot.data!['tanggaldp'] ==
                                                      null
                                                  ? const Text(
                                                      '- DP : -',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    )
                                                  : Text(
                                                      '- Sudah DP sebesar Rp ${NumberFormat.currency(locale: 'eu', symbol: '').format(snapshot.data!['nominalpembayaranDP'])}pada tanggal ${DateFormat('dd/MM/yyyy, HH:mm').format(dateDP)}',
                                                      style: const TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                              Text(
                                                '- Sudah ${snapshot.data!['statuspembayaran']} sebesar Rp ${NumberFormat.currency(locale: 'eu', symbol: '').format(snapshot.data!['nominalpembayaranLunas'])}pada tanggal ${DateFormat('dd/MM/yyyy, HH:mm').format(dateLunas)}',
                                                style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: double.infinity,
                              constraints: const BoxConstraints(
                                maxHeight: double.infinity,
                              ),
                              decoration: BoxDecoration(
                                color: HexColor('#E8C5E5'),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 4,
                                    offset: Offset(4, 8), // Shadow position
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Kehadiran',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    snapshot.data!['absen1'] == null
                                        ? const Text(
                                            'Sesi Ke-1 : -',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        : Text(
                                            'Sesi Ke-1 : ${DateFormat('dd/MM/yyyy, HH:mm').format(absen1)}',
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    snapshot.data!['absen2'] == null
                                        ? const Text(
                                            'Sesi Ke-2 : -',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        : Text(
                                            'Sesi Ke-2 : ${DateFormat('dd/MM/yyyy, HH:mm').format(absen2)}',
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    snapshot.data!['absen3'] == null
                                        ? const Text(
                                            'Sesi Ke-3 : -',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          )
                                        : Text(
                                            'Sesi Ke-3 : ${DateFormat('dd/MM/yyyy, HH:mm').format(absen3)}',
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.hasError.toString()),
                        );
                      } else {
                        return const Center(
                            child: Text(
                          "Tidak Ada Produk",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ));
                      }
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32, bottom: 21),
        child: Visibility(
          visible: args[1],
          // replacement: SizedBox(
          //   width: double.infinity,
          //   child: ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: HexColor('#F19ED2'),
          //     ),
          //     onPressed: () {
          //       Get.dialog(
          //         Column(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Padding(
          //               padding: const EdgeInsets.symmetric(horizontal: 40),
          //               child: Container(
          //                 decoration: const BoxDecoration(
          //                   color: Colors.white,
          //                   borderRadius: BorderRadius.all(
          //                     Radius.circular(20),
          //                   ),
          //                 ),
          //                 child: Padding(
          //                   padding: const EdgeInsets.all(20.0),
          //                   child: Material(
          //                     child: Column(
          //                       children: [
          //                         const SizedBox(height: 10),
          //                         const Text(
          //                           "Konfirmasi hapus data murid",
          //                           textAlign: TextAlign.center,
          //                         ),
          //                         const SizedBox(height: 15),
          //                         const Text(
          //                           "Apakah kamu yakin ingin menghapus data murid ini?",
          //                           textAlign: TextAlign.center,
          //                         ),
          //                         const SizedBox(height: 20),
          //                         //Buttons
          //                         Row(
          //                           children: [
          //                             Expanded(
          //                               child: ElevatedButton(
          //                                 style: ElevatedButton.styleFrom(
          //                                   foregroundColor:
          //                                       const Color(0xFFFFFFFF),
          //                                   backgroundColor:
          //                                       HexColor('#F19ED2'),
          //                                   minimumSize: const Size(0, 45),
          //                                   shape: RoundedRectangleBorder(
          //                                     borderRadius:
          //                                         BorderRadius.circular(8),
          //                                   ),
          //                                 ),
          //                                 onPressed: () {
          //                                   Get.back();
          //                                 },
          //                                 child: const Text(
          //                                   'NO',
          //                                 ),
          //                               ),
          //                             ),
          //                             const SizedBox(width: 10),
          //                             Expanded(
          //                               child: ElevatedButton(
          //                                 style: ElevatedButton.styleFrom(
          //                                   foregroundColor:
          //                                       const Color(0xFFFFFFFF),
          //                                   backgroundColor:
          //                                       HexColor('#E8C5E5'),
          //                                   minimumSize: const Size(0, 45),
          //                                   shape: RoundedRectangleBorder(
          //                                     borderRadius:
          //                                         BorderRadius.circular(8),
          //                                   ),
          //                                 ),
          //                                 onPressed: () {
          //                                   deleteMurid();
          //                                   Get.back();
          //                                   Get.snackbar(
          //                                     'Success',
          //                                     'Berhasil menghapus data murid!',
          //                                     backgroundColor:
          //                                         HexColor('#E8C5E5'),
          //                                     colorText: Colors.black,
          //                                   );
          //                                   Get.offAllNamed(
          //                                       RouteName.daftarMurid);
          //                                 },
          //                                 child: const Text(
          //                                   'YES',
          //                                 ),
          //                               ),
          //                             ),
          //                           ],
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       );
          // },
          // child: const Text(
          //   'Hapus Murid',
          //   style: TextStyle(color: Colors.black),
          // ),
          // ),
          // ),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: SizedBox(
              // width: size.width * 0.8,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: HexColor('#E8C5E5'),
                ),
                onPressed: () {
                  Get.dialog(
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Material(
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    const Text(
                                      "Konfirmasi Kehadiran",
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 15),
                                    const Text(
                                      "Apakah kamu yakin ingin mengisi absen pada murid ini?",
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 20),
                                    //Buttons
                                    Row(
                                      children: [
                                        Expanded(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              foregroundColor:
                                                  const Color(0xFFFFFFFF),
                                              backgroundColor:
                                                  HexColor('#F19ED2'),
                                              minimumSize: const Size(0, 45),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: const Text(
                                              'NO',
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Expanded(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              foregroundColor:
                                                  const Color(0xFFFFFFFF),
                                              backgroundColor:
                                                  HexColor('#E8C5E5'),
                                              minimumSize: const Size(0, 45),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            onPressed: () {
                                              // hadir();
                                              if (args[2] == 1) {
                                                hadir1();
                                              } else if (args[2] == 2) {
                                                hadir2();
                                              } else {
                                                hadir3();
                                              }
                                              Get.back();
                                              Get.snackbar(
                                                'Success',
                                                'Berhasil mengisi absen pada murid ini!',
                                                backgroundColor:
                                                    HexColor('#E8C5E5'),
                                                colorText: Colors.black,
                                              );
                                              // Navigator.pop(context);
                                              Get.offAllNamed(
                                                  RouteName.absensiMurid);
                                            },
                                            child: const Text(
                                              'YES',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text(
                  'Hadir',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future hadir1() async {
    await FirebaseFirestore.instance
        .collection('murid_list')
        .doc(args[0])
        .update({
      'absen1': DateTime.now(),
    });
  }

  Future hadir2() async {
    await FirebaseFirestore.instance
        .collection('murid_list')
        .doc(args[0])
        .update({
      'absen2': DateTime.now(),
    });
  }

  Future hadir3() async {
    await FirebaseFirestore.instance
        .collection('murid_list')
        .doc(args[0])
        .update({
      'absen3': DateTime.now(),
    });
  }

//   Future deleteMurid() async {
//     await FirebaseFirestore.instance
//         .collection("murid_list")
//         .doc(args[0])
//         .delete();
//   }
}
