import 'dart:async';
import 'package:flutter/material.dart';
import 'package:miut/pages/logIn.dart';
import 'package:miut/pages/widgets/mainpage.dart';
import 'package:miut/pages/widgets/preference.dart';
import 'package:miut/pref_value.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var waitingTime = 3;
  @override
  void initState() {
    super.initState();
    nextPage();
  }

  nextPage() {
    Future.delayed(Duration(seconds: waitingTime), () async {
      var isLogged =
          await PrefManager().readValue(key: PrefConst.isLoggedIn) ?? "";
      print("pref value $isLogged");
      if (isLogged == "Yes") {
        print("navigating n");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MainScreen()));
      } else {
        print("not nav ");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/backgorund.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo.png", width: 150),
              SizedBox(height: 20),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
