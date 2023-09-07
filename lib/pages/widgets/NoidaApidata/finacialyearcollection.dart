import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:miut/model/noida/financialyearcollectionN.dart';
import 'dart:async';
import 'dart:convert';



class FinacialYear extends StatefulWidget {
  @override
  _FinacialYearState createState() => _FinacialYearState();
}

class _FinacialYearState extends State<FinacialYear> {
  late Future<FinacialYearCollectionNModel> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  Future<FinacialYearCollectionNModel> fetchData() async {
    const apiUrl =
        'https://noidastd.muituniversity.in/api/student/GetCollectionFinancialYear'; // Replace with your API URL

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return FinacialYearCollectionNModel.fromJson(json.decode(response.body));
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
    return FutureBuilder<FinacialYearCollectionNModel>(
      future: futureData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
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
                    padding: EdgeInsets.only(top: 5),
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
