import 'package:flutter/material.dart';
import 'package:miut/init_variable.dart';
import 'package:miut/pages/splash.dart';
import 'package:miut/pages/widgets/mainpage.dart';


void main() {
  InitVariables().onInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MIUT",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: MainScreen(),
    );
  }
}
