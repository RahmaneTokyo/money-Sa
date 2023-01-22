import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moneysa/layouts/sideMenu/side_menu.dart';
import 'package:moneysa/splash.dart';
import 'Functions/functions.dart';
import 'dart:math';

import 'auth/login.dart';
import 'auth/otp.dart';
import 'layouts/home/home.dart';

// Lock device orientation to portrait
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Step 3
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(MyApp()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color.fromRGBO(143, 114, 241, 1)
        ),
        primarySwatch: Colors.blue,
      ),
      // Routes
      // Routes
      home: HomePage(),
    );
  }
}


