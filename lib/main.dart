import 'package:flutter/material.dart';
import 'package:seletivo_if/modules/home/homeScreen.dart';
// import 'package:seletivo_if/shared/widgets/card_disciplin.dart';
// import 'package:seletivo_if/modules/simulated/simulated.dart';
// import 'package:seletivo_if/modules/auth/createAccountPage.dart';
// import 'package:seletivo_if/modules/simulated/simulatedInf.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Inicial',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
      // home: const Simulated(),
      // home: const SimulatedInf(),
      // home: const CreatAccountPage(),
      // home: const login_page(),
      debugShowCheckedModeBanner: false,
    );
  }
}
