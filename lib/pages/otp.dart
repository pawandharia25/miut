import 'package:flutter/material.dart';
import 'package:miut/pages/widgets/mainpage.dart';

class OtpScreen extends StatefulWidget {
  var otp;
  OtpScreen({required this.otp});
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  List<String> otp =
      List.filled(4, '', growable: false); // List to store OTP digits

  void _onOtpChange(int index, String value) {
    setState(() {
      otp[index] = value;
      if (index < 3 && value.isNotEmpty) {
        FocusScope.of(context).nextFocus(); // Move focus to the next field
      }
      print(otp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/backgorund.png"),
              fit: BoxFit.cover),
        ),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 110.0),
                  child: Center(
                    child: Container(
                        width: 200,
                        height: 200,
                        child: Image.asset('assets/images/logo.png')),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    4,
                    (index) => SizedBox(
                      width: 70,
                      child: TextField(
                        onChanged: (value) => _onOtpChange(index, value),
                        maxLength: 1,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          counterText: '', // Hide character count
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                InkWell(
                  onTap: () {
                    String enteredOtp = otp.join();
                    print('Entered OTP: $enteredOtp');
                    if (widget.otp.toString() == enteredOtp) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainScreen()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.white,
                          content: Text(
                            "Enter Valid OTP",
                            style: TextStyle(color: Colors.red),
                          )));
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF111d5e),
                        borderRadius: BorderRadius.circular(10)),
                    height: 70,
                    width: 250,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: const Text(
                        'Verify OTP',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
