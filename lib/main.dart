import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'routes/pages_route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyBgjjQjNNPJiGlww7x9LQAWqo5pJqp_aZY",
    appId: "1:997812085017:android:b8dba6eed3e0bb6a8e2588",
    messagingSenderId: "997812085017",
    projectId: "hannanarita",
    storageBucket: "hannanarita.appspot.com",
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: HexColor('#F7F9F2'),
            ),
        scaffoldBackgroundColor: HexColor('#F7F9F2'),
      ),
      // home: RouteName,
      initialRoute: '/HomePage',
      getPages: PagesRouting.pages,
    );
  }
}
