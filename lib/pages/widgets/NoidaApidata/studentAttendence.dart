import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:miut/model/noida/sudentattendencedataN.dart';

class StudentAttendence extends StatefulWidget {
  @override
  _StudentAttendenceState createState() => _StudentAttendenceState();
}

class _StudentAttendenceState extends State<StudentAttendence> {
  late Future<StudentAttendenceNModel> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  Future<StudentAttendenceNModel> fetchData() async {
    const apiUrl =
        'https://noidastd.muituniversity.in/api/student/GetStudentAttendance'; // Replace with your API URL

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return StudentAttendenceNModel.fromJson(json.decode(response.body));
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
    return FutureBuilder<StudentAttendenceNModel>(
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
                    '${album.data?.studentAttendance ?? "Empty"} ',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                const Text("Student",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ],
            ),
          );
        }
      },
    );
  }
}
