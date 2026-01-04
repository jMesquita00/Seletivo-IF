import 'package:flutter/material.dart';
// import 'package:seletivo_if/modules/auth/loginScreen.dart';
// import 'package:seletivo_if/modules/home/home_screen.dart';
import 'package:seletivo_if/modules/home/main_screen.dart';
import 'package:seletivo_if/modules/splash/splash_page.dart';
//import 'package:seletivo_if/modules/splash/splash_page.dart';
// import 'package:seletivo_if/shared/widgets/card_disciplin.dart';
// import 'package:seletivo_if/modules/simulated/simulated.dart';
// import 'package:seletivo_if/modules/auth/createAccountPage.dart';
// import 'package:seletivo_if/modules/simulated/simulatedInf.dart';
// import 'package:seletivo_if/modules/simulated/lesson_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'App Inicial',
      // theme: ThemeData(primarySwatch: Colors.green),
      home: const SplashPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
