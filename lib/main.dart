import 'package:donation_system/Variables/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Pages/RootPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
