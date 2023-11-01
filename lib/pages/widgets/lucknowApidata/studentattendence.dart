import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:miut/lucknow/lucknow_student_attandence_screen.dart';
import 'dart:async';
import 'dart:convert';

import 'package:miut/model/lucknow/studentattendencedatalKo.dart';

class StudentAttendenceLko extends StatefulWidget {
  @override
  _StudentAttendenceLkoState createState() => _StudentAttendenceLkoState();
}

class _StudentAttendenceLkoState extends State<StudentAttendenceLko> {
  late Future<StudentAttendenceLkoModel> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  Future<StudentAttendenceLkoModel> fetchData() async {
    const apiUrl =
        'https://luckstd.muituniversity.in/api/student/GetStudentAttendance'; // Replace with your API URL

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return StudentAttendenceLkoModel.fromJson(json.decode(response.body));
    } else {
      throw ('Data not found');
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
    return FutureBuilder<StudentAttendenceLkoModel>(
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

          return InkWell(
            onTap: (){
              Get.to(
                LucknowStudentAttandence(),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
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
