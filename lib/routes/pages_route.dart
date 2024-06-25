import 'package:get/get.dart';
import 'package:hanna_narita/controller/excel.dart';
import 'package:hanna_narita/pages/absensi_murid/absen_detail.dart';
import 'package:hanna_narita/pages/absensi_murid/absen_screen.dart';
import 'package:hanna_narita/pages/daftar_murid/dm_detail_screen.dart';
import 'package:hanna_narita/pages/daftar_murid/dm_screen.dart';
import 'package:hanna_narita/pages/homepage/dp_list.dart';
import 'package:hanna_narita/pages/homepage/lunas_list.dart';
import 'package:hanna_narita/pages/homepage/sh_list.dart';
import 'package:hanna_narita/pages/homepage/sm_list.dart';
import 'package:hanna_narita/pages/tambah_murid/tm_screen.dart';
import '../pages/homepage/homepage.dart';
import 'route_name.dart';

class PagesRouting {
  static final pages = [
    GetPage(
      name: RouteName.homePage,
      page: () => const HomePage(),
    ),
    GetPage(
      name: RouteName.tambahMurid,
      page: () => const TambahMurid(),
    ),
    GetPage(
      name: RouteName.daftarMurid,
      page: () => const DaftarMurid(),
    ),
    GetPage(
      name: RouteName.detailMurid,
      page: () => const DetailMurid(),
    ),
    GetPage(
      name: RouteName.absensiMurid,
      page: () => const ABsensiMurid(),
    ),
    GetPage(
      name: RouteName.detailAbsen,
      page: () => const AbsenDetail(),
    ),
    GetPage(
      name: RouteName.exportExcel,
      page: () => const ExportToExcel(),
    ),
    GetPage(
      name: RouteName.smList,
      page: () => const SelfMakeupList(),
    ),
    GetPage(
      name: RouteName.shList,
      page: () => const SelfHairdoList(),
    ),
    GetPage(
      name: RouteName.dpList,
      page: () => const DpList(),
    ),
    GetPage(
      name: RouteName.lunasList,
      page: () => const LunasList(),
    ),
  ];
}
