import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:miut/model/lucknow/recoveryfeesdatalko.dart';

class RecoveryFeesLko extends StatefulWidget {
  @override
  _RecoveryFeesLkoState createState() => _RecoveryFeesLkoState();
}

class _RecoveryFeesLkoState extends State<RecoveryFeesLko> {
  late Future<RecoveryFeesLkoModel> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  Future<RecoveryFeesLkoModel> fetchData() async {
    const apiUrl =
        'https://luckstd.muituniversity.in/api/student/GETRecoverableFees'; // Replace with your API URL

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return RecoveryFeesLkoModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data from API');
    }
  }

  static double checkDouble(dynamic value) {
    if (value is String) {
      return double.parse(value);
    } else {
      return value.toDouble();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<RecoveryFeesLkoModel>(
      future: futureData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SizedBox(
            height: 30,
            width: 30,
            child: CircularProgressIndicator(),
          ); // Display loading indicator
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final album = snapshot.data!;

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    child: Text(
                      '₹${album.data?.recoverableFeesTotal ?? "Empty"} ',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
                const Text("Recovery Fees",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    'Shift 1- ₹${album.data?.recoverableFeesShiftI ?? "Empty"}\nShift 2- ₹${album.data?.recoverableFeesShiftII ?? "Empty"}\nSection A- ₹${album.data?.sectionA ?? "Empty"}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
