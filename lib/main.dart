import 'package:flutter/material.dart';
import 'package:seletivo_if/modules/auth/createAccountPage.dart';
import 'package:seletivo_if/modules/simulated/simulated.dart';

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
      home: const Simulated(),
      // home: const CreatAccountPage(),
      // home: const login_page(),
      debugShowCheckedModeBanner: false,
    );
  }
}

