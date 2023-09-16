import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:miut/model/lucknow/todaycolllectiondatalko.dart';

class TodayCollectionL extends StatefulWidget {
  @override
  _TodayCollectionLState createState() => _TodayCollectionLState();
}

class _TodayCollectionLState extends State<TodayCollectionL> {
  late Future<TodatCollectionLkoModel> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  Future<TodatCollectionLkoModel> fetchData() async {
    const apiUrl =
        'https://luckstd.muituniversity.in/api/student/GetTodayCollection'; // Replace with your API URL

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return TodatCollectionLkoModel.fromJson(json.decode(response.body));
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
    return FutureBuilder<TodatCollectionLkoModel>(
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
                Text(
                  '₹${album.data?.todayCollection ?? "Empty"}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text("Today Collection",
                        style: TextStyle(color: Colors.white, fontSize: 18))),
              ],
            ),
          );
        }
      },
    );
  }
}
