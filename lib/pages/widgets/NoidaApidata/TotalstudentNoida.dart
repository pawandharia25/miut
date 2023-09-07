import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:miut/model/noida/totalstudentN.dart';

class TotalStudentN extends StatefulWidget {
  @override
  _TotalStudentNState createState() => _TotalStudentNState();
}

class _TotalStudentNState extends State<TotalStudentN> {
  late Future<TotalStudentListNModel> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  Future<TotalStudentListNModel> fetchData() async {
    const apiUrl =
        'https://noidastd.muituniversity.in/api/student/GetAdmissionN'; // Replace with your API URL

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return TotalStudentListNModel.fromJson(json.decode(response.body));
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
    return FutureBuilder<TotalStudentListNModel>(
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
                    '${album.data?.totalStudent ?? "Empty"} ',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                const Text("Total Student",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    'Shift 1- ${album.data?.shiftIStudent ?? "Empty"}\nShift 2- ${album.data?.shiftIIStudent ?? "Empty"}\nSection A- ${album.data?.sectionAStudent ?? "Empty"} ',
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
