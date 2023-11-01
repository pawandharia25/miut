import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:miut/api/lucknow_api.dart';
import 'dart:async';
import 'dart:convert';

import 'package:miut/model/lucknow/financialyearcolletionLko.dart';



class FinacialYearLko extends StatefulWidget {
  @override
  _FinacialYearLkoState createState() => _FinacialYearLkoState();
}

class _FinacialYearLkoState extends State<FinacialYearLko> {
  late Future<FinacialYearCollectionLkoModel> futureData;

  @override
  void initState() {
    super.initState();
    futureData = LucknowAPi().FinancialYEarCollectionLko();
  }

  Future<FinacialYearCollectionLkoModel> fetchData() async {
    const apiUrl =
        'https://luckstd.muituniversity.in/api/student/GetCollectionFinancialYear'; // Replace with your API URL

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return FinacialYearCollectionLkoModel.fromJson(json.decode(response.body));
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
    return FutureBuilder<FinacialYearCollectionLkoModel>(
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
                  '₹${album.data?.financialYearCollection ?? "Empty"}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text("Collection 2023-24",
                        style: TextStyle(color: Colors.white, fontSize: 18))),
              ],
            ),
          );
        }
      },
    );
  }
}
