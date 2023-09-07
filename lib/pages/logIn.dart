import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:miut/pages/otp.dart';
import 'package:miut/pages/widgets/appbarlogo.dart';
import 'package:miut/pages/widgets/preference.dart';
import 'package:miut/pref_value.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _mobileController = TextEditingController();
  void _verifyOTP() async {
    var mobileNumber = _mobileController.text;
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('https://noidastd.muituniversity.in/api/student/LoginM'));
    request.body = json.encode({"Mobile": mobileNumber});
    //request.body = json.encode({"Mobile": 9311107214});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // OTP verification successful
      var data = jsonDecode(
          await response.stream.bytesToString()); //  "Mobile" : "9311107214"
      //"Mobile" : "9971850301"
      var otp = data['data']['OTP'];
      print("jj${otp}");
      PrefManager().writeValue(key: PrefConst.isLoggedIn, value: "Yes");
      Navigator.pushReplacement(
        context as BuildContext,
        MaterialPageRoute(
            builder: (context) => OtpScreen(
                  otp: otp,
                )),
      );
    } else {
      // OTP verification failed
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('OTP verification failed. Please try again.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        backgroundColor: Color(0xFF111d5e),
        flexibleSpace: AppBarLogo(),
        toolbarHeight: 80,
      ),
      body: Center(
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/backgorund.png"),
                fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: _mobileController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      labelText: 'Mobile Number',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white))),
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  _verifyOTP();
                },
                child: Container(
                  height: 70,
                  width: 250,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color(0xFF111d5e),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: const Text(
                      'Send OTP',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
