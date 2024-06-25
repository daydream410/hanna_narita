// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:hanna_narita/controller/homepage_c.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../routes/route_name.dart';

class DpList extends StatefulWidget {
  const DpList({super.key});

  @override
  State<DpList> createState() => _DpListState();
}

class _DpListState extends State<DpList> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var myController = Get.put(HomePageController());
    var docId = '';
    bool isVisible = false;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Get.back();
              },
            );
          },
        ),
        centerTitle: true,
        title: Container(
          width: size.width * 0.7,
          height: size.height * 0.05,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey, blurRadius: 2.0, offset: Offset(2.0, 2.0))
            ],
          ),
          child: TextField(
            key: formKey,
            onChanged: (value) {
              setState(() {
                // myController.searchLogSM.value.text = value.capitalize!;
                myController.searchLogSM.value.text = value;
              });

              print(myController.searchLogSM.value.text);
            },
            decoration: InputDecoration(
              suffixIcon: const Icon(Icons.search_rounded),
              border: const OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: HexColor('#E8C5E5'),
                ),
              ),
              hintText: 'Cari nama murid',
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Daftar Murid Down Payment (DP)',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Divider(
                thickness: 5,
                color: HexColor('#E8C5E5'),
              ),
              SingleChildScrollView(
                child: SizedBox(
                  width: double.infinity,
                  height: size.height * 0.77,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('murid_list')
                        .where('statuspembayaran', isEqualTo: 'DP')
                        .orderBy('nama')
                        .startAt([myController.searchLogSM.value.text]).endAt([
                      "${myController.searchLogSM.value.text}\uf8ff"
                    ]).snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  docId =
                                      snapshot.data!.docs[index].reference.id;
                                  if (snapshot.data!.docs[index]
                                          ['statuspembayaran'] ==
                                      'DP') {
                                    isVisible = true;
                                  } else {
                                    isVisible = false;
                                  }
                                  print(docId);
                                  Get.toNamed(RouteName.detailMurid,
                                      arguments: [docId, isVisible]);
                                },
                                child: Card(
                                  elevation: 5,
                                  color: snapshot.data!.docs[index]
                                              ['statuspembayaran'] ==
                                          'DP'
                                      ? HexColor('#F19ED2')
                                      : HexColor('#E8C5E5'),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data!.docs[index]
                                                  ['nama'],
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              '${snapshot.data!.docs[index]['tipekelas']} (${snapshot.data!.docs[index]['statuspembayaran']})',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Icon(
                                            Icons.arrow_forward_outlined),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.hasError.toString()),
                          );
                        } else {
                          return const Center(
                              child: Text(
                            "Tidak Ada Murid",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
