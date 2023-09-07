import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:miut/model/noida/shift2admissiondataN.dart';

class Shift2Admission extends StatefulWidget {
  @override
  _Shift2AdmissionState createState() => _Shift2AdmissionState();
}

class _Shift2AdmissionState extends State<Shift2Admission> {
  late Future<Shift2AddmidionNModel> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  Future<Shift2AddmidionNModel> fetchData() async {
    const apiUrl =
        'https://noidastd.muituniversity.in/api/student/GetAdmissionN'; // Replace with your API URL

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return Shift2AddmidionNModel.fromJson(json.decode(response.body));
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
    return FutureBuilder<Shift2AddmidionNModel>(
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
                  child: Text(
                    '${album.data?.shift2Admission ?? "Empty"} ',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                const Text("Shift 2 Admission",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ],
            ),
          );
        }
      },
    );
  }
}
