import 'package:donation_system/Variables/color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Pages/RootPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_){
    runApp(new MaterialApp(
      theme: ThemeData(
        primaryColor: redSecondaryColor,
        accentColor: redSecondaryColorLight,
        fontFamily: 'Nunito',
      ),
      home: RootPage(),
      debugShowCheckedModeBanner: false,
    ));
  });
}
