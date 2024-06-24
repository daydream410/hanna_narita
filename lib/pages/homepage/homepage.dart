import 'package:flutter/material.dart';
import 'package:hanna_narita/routes/drawer.dart';
import 'package:hexcolor/hexcolor.dart';
// import 'package:get/get.dart';
// import '../../routes/route_name.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    int sm = 0;
    int sh = 0;
    int dp = 0;
    int lunas = 0;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
      ),
      drawer: const NavDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  width: size.width * 0.8,
                  child: Image.asset('images/LogoHN.png'),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              const Text(
                'JUMLAH MURID',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width * 0.4,
                    height: size.height * 0.20,
                    decoration: BoxDecoration(
                      color: HexColor('#E8C5E5'),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4,
                          offset: Offset(4, 8), // Shadow position
                        ),
                      ],
                    ),
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('murid_list')
                            .where('tipekelas', isEqualTo: 'Self Makeup')
                            .snapshots(),
                        builder: (context, snapshot) {
                          sm = snapshot.data?.docs.length ?? 0;
                          if (snapshot.connectionState ==
                              ConnectionState.active) {
                            if (snapshot.hasData) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Self Makeup',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '$sm',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(
                                    color: Colors.white),
                              );
                            }
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(
                                  color: Colors.white),
                            );
                          }
                        }),
                  ),
                  Container(
                    width: size.width * 0.4,
                    height: size.height * 0.20,
                    decoration: BoxDecoration(
                      color: HexColor('#E8C5E5'),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4,
                          offset: Offset(4, 8), // Shadow position
                        ),
                      ],
                    ),
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('murid_list')
                            .where('tipekelas', isEqualTo: 'Self Hairdo')
                            .snapshots(),
                        builder: (context, snapshot) {
                          sh = snapshot.data?.docs.length ?? 0;
                          if (snapshot.connectionState ==
                              ConnectionState.active) {
                            if (snapshot.hasData) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Self Hairdo',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '$sh',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(
                                    color: Colors.white),
                              );
                            }
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(
                                  color: Colors.white),
                            );
                          }
                        }),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'JUMLAH PEMBAYARAN',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width * 0.4,
                    height: size.height * 0.20,
                    decoration: BoxDecoration(
                      color: HexColor('#E8C5E5'),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4,
                          offset: Offset(4, 8), // Shadow position
                        ),
                      ],
                    ),
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('murid_list')
                            .where('statuspembayaran', isEqualTo: 'DP')
                            .snapshots(),
                        builder: (context, snapshot) {
                          dp = snapshot.data?.docs.length ?? 0;
                          if (snapshot.connectionState ==
                              ConnectionState.active) {
                            if (snapshot.hasData) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Down Payment',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Text(
                                    '(DP)',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '$dp',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(
                                    color: Colors.white),
                              );
                            }
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(
                                  color: Colors.white),
                            );
                          }
                        }),
                  ),
                  Container(
                    width: size.width * 0.4,
                    height: size.height * 0.20,
                    decoration: BoxDecoration(
                      color: HexColor('#E8C5E5'),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4,
                          offset: Offset(4, 8), // Shadow position
                        ),
                      ],
                    ),
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('murid_list')
                            .where('statuspembayaran', isEqualTo: 'Lunas')
                            .snapshots(),
                        builder: (context, snapshot) {
                          lunas = snapshot.data?.docs.length ?? 0;
                          if (snapshot.connectionState ==
                              ConnectionState.active) {
                            if (snapshot.hasData) {
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Full Payment',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const Text(
                                    '(Lunas)',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Text(
                                    '$lunas',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(
                                    color: Colors.white),
                              );
                            }
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(
                                  color: Colors.white),
                            );
                          }
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
