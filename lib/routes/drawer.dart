import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hanna_narita/routes/route_name.dart';
import 'package:hexcolor/hexcolor.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: HexColor('#E8C5E5'),
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('images/logo12.png'),
              ),
            ),
            // padding: EdgeInsets.all(12.0),
            // margin: EdgeInsets.all(8),
            child: const Text(''),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Dashboard'),
            onTap: () => {
              Get.offAllNamed(RouteName.homePage),
            },
          ),
          ListTile(
            leading: const Icon(Icons.person_add_alt_1),
            title: const Text('Tambah Murid'),
            onTap: () => {
              Get.offAllNamed(RouteName.tambahMurid),
            },
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Daftar Murid'),
            onTap: () => {
              Get.offAllNamed(RouteName.daftarMurid),
            },
          ),
          ListTile(
            leading: const Icon(Icons.checklist_rounded),
            title: const Text('Absensi Murid'),
            onTap: () => {
              Get.offAllNamed(RouteName.absensiMurid),
            },
          ),
          ListTile(
            leading: const Icon(Icons.file_download),
            title: const Text('Export Excel'),
            onTap: () => {
              Get.offAllNamed(RouteName.exportExcel),
            },
          ),
          // ListTile(
          //   leading: const Icon(Icons.exit_to_app),
          //   title: const Text('Logout'),
          //   onTap: () => {Navigator.of(context).pop()},
          // ),
        ],
      ),
    );
  }
}
