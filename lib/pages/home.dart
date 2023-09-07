import 'package:flutter/material.dart';

class Home extends StatelessWidget {
 final Function updateWidget;
  const Home(this.updateWidget, {super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: const Text(
                  "Hello!\nMUIT MANAGEMENT",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                  updateWidget(2);

                },
                child: Material(
                  elevation: 5,
                  color: Color(0xFFfcc736),
                  borderRadius: BorderRadius.circular(7),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 165.0,
                        width: 165.0,
                        alignment: Alignment.center,
                        child: const Text(
                          "Lucknow",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(

                  onTap: () {
                  updateWidget(1);
                // onTap: () {
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => Noida()));
                },
                child: Material(
                  elevation: 5.0,
                  color: Color(0xFF111d5e),
                  borderRadius: BorderRadius.circular(7),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 165.0,
                        width: 165.0,
                        child: const Text(
                          "Noida",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
