import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'MUIT MANAGEMENT',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF111d5e)),
              useMaterial3: true,
            ),
            home: MainScreen(),
          );
        });
  }
}
