import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:miut/model/noida/staffemployeeattendenceN.dart';
import 'dart:async';
import 'dart:convert';

import 'package:miut/pages/widgets/NoidaApidata/faculty.dart';

class Staff extends StatefulWidget {
  @override
  _StaffState createState() => _StaffState();
}

class _StaffState extends State<Staff> {
  late Future<StaffAttendenceNModel> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  Future<StaffAttendenceNModel> fetchData() async {
    const apiUrl =
        'https://noidastd.muituniversity.in/api/Student/GetStaffAttendance'; // Replace with your API URL

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return StaffAttendenceNModel.fromJson(json.decode(response.body));
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
    return FutureBuilder<StaffAttendenceNModel>(
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

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                ),
                child: Text(
                  '${album.data?.presentEmployee ?? "Empty"}/${album.data?.total ?? "Empty"} ',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              const Text("Staff",
                  style: TextStyle(color: Colors.white, fontSize: 18))
            ],
          );
        }
      },
    );
  }
}

class Album {
  String? message;
  List<Data1>? data;
  int? statuscode;
  int? totalCount;

  Album({this.message, this.data, this.statuscode, this.totalCount});

  Album.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data1>[];
      json['data'].forEach((v) {
        data!.add(new Data1.fromJson(v));
      });
    }
    statuscode = json['statuscode'];
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['statuscode'] = this.statuscode;
    data['totalCount'] = this.totalCount;
    return data;
  }
}

class Data1 {
  int? presentEmployee;
  int? total;
  int? userId;
  String? employeeCode;
  String? employeeName;
  String? departmentSName;
  String? dT;
  String? timeIN;
  String? timeOut;
  String? duration;
  String? status;
  bool? isActive;
  String? createdDate;
  String? date;
  String? modifiedDate;
  int? createdby;
  int? updatedby;

  Data1(
      {this.presentEmployee,
      this.total,
      this.userId,
      this.employeeCode,
      this.employeeName,
      this.departmentSName,
      this.dT,
      this.timeIN,
      this.timeOut,
      this.duration,
      this.status,
      this.isActive,
      this.createdDate,
      this.date,
      this.modifiedDate,
      this.createdby,
      this.updatedby});

  Data1.fromJson(Map<String, dynamic> json) {
    presentEmployee = json['Present_Employee'];
    total = json['Total'];
    userId = json['UserId'];
    employeeCode = json['EmployeeCode'];
    employeeName = json['EmployeeName'];
    departmentSName = json['DepartmentSName'];
    dT = json['DT'];
    timeIN = json['TimeIN'];
    timeOut = json['TimeOut'];
    duration = json['Duration'];
    status = json['Status'];
    isActive = json['IsActive'];
    createdDate = json['CreatedDate'];
    date = json['Date'];
    modifiedDate = json['ModifiedDate'];
    createdby = json['Createdby'];
    updatedby = json['Updatedby'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Present_Employee'] = this.presentEmployee;
    data['Total'] = this.total;
    data['UserId'] = this.userId;
    data['EmployeeCode'] = this.employeeCode;
    data['EmployeeName'] = this.employeeName;
    data['DepartmentSName'] = this.departmentSName;
    data['DT'] = this.dT;
    data['TimeIN'] = this.timeIN;
    data['TimeOut'] = this.timeOut;
    data['Duration'] = this.duration;
    data['Status'] = this.status;
    data['IsActive'] = this.isActive;
    data['CreatedDate'] = this.createdDate;
    data['Date'] = this.date;
    data['ModifiedDate'] = this.modifiedDate;
    data['Createdby'] = this.createdby;
    data['Updatedby'] = this.updatedby;
    return data;
  }
}

class StaffData extends StatefulWidget {
  @override
  _StaffDataState createState() => _StaffDataState();

  toLowerCase() {}
}

class _StaffDataState extends State<StaffData> {
  late Future<Album> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  Future<Album> fetchData() async {
    const apiUrl =
        'https://noidastd.muituniversity.in/api/Student/GetStaffAttendanceList'; // Replace with your API URL

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return Album.fromJson(json.decode(response.body));
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

  Future<Album> _refreshProducts(BuildContext context) async {
    return fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => _refreshProducts(context),
      child: FutureBuilder<Album>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child:
                    CircularProgressIndicator()); // Display loading indicator
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final data = snapshot.data!;
            return ListView.builder(
              itemCount: data.data!.length,
              itemBuilder: (context, index) {
                final dataItem = data.data![index];

                return Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 10,
                  ),
                  child: Table(
                      border: TableBorder(
                        horizontalInside: BorderSide(
                          color: Color(0xFF111d5e), // Color of the border
                          width: 1.0, // Width of the border
                        ),
                        verticalInside: BorderSide(
                          color: Color(0xFF111d5e), // Color of the border
                          width: 1.0, // Width of the border
                        ),
                        bottom: BorderSide(
                          color:
                              Color(0xFF111d5e), // Color of the bottom border
                          width: 1.0, // Width of the bottom border
                        ),
                      ),
                      columnWidths: {
                        0: FlexColumnWidth(4),
                        1: FlexColumnWidth(4),
                        2: FlexColumnWidth(1.2),
                      }, // Allows to add a border decoration around your table
                      children: [
                        TableRow(children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${dataItem.employeeName ?? "Empty"}",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "${dataItem.employeeCode ?? "Empty"}",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0xFFfcc736)),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '${dataItem.departmentSName ?? "Empty"}',
                            style: TextStyle(fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '${dataItem.status ?? "Empty"}',
                            style: TextStyle(fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        ]),
                      ]),
                );
              },
            );
          }
        },
      ),
    );
  }
}

Future<List<EmployeeAttendenceStaffNModel>> fetchDataByDate(String date) async {
  List<EmployeeAttendenceStaffNModel> dataList = [];

  var headers = {'Content-Type': 'application/json'};
  var request = http.Request(
      'POST',
      Uri.parse(
          'https://noidastd.muituniversity.in/api/student/GetStaffAttendanceListByDate'));
  request.body = json.encode({"attendanceDate": "$date"});
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var resultBody = await response.stream.bytesToString();
    var data = jsonDecode(resultBody)['data'];
    for (var v in data) {
      dataList.add(EmployeeAttendenceStaffNModel.fromJson(v));
    }
  } else {
    print(response.reasonPhrase);
  }
  return dataList;
}

class AttendenceSearchStaffN extends StatefulWidget {
  @override
  _AttendenceSearchStaffNState createState() => _AttendenceSearchStaffNState();
}

class _AttendenceSearchStaffNState extends State<AttendenceSearchStaffN> {
  DateTime selectedDate = DateTime.now();
  String dateString =
      DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
  late Future<void> responseData;
  List<EmployeeAttendenceStaffNModel> dataList = [];
  int aCount = 0;
  int pCount = 0;

  @override
  void initState() {
    super.initState();
    fetchDataByDate(dateString).then((value) {
      dataList.clear();
      dataList.addAll(value);
      calculate();
    });
  }

  void calculate() {
    aCount = 0;
    pCount = 0;
    for (EmployeeAttendenceStaffNModel d in dataList) {
      if (d.status == "A") {
        aCount++;
      } else {
        pCount++;
      }
    }
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime(2000),
            lastDate: DateTime.now())
        .then((value) {
      if (mounted) {
        setState(() {
          selectedDate = value!;
          dateString = DateFormat('yyyy-MM-dd').format(value).toString();
          fetchDataByDate(dateString).then((value) {
            dataList.clear();
            dataList.addAll(value);
            calculate();
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Date:- ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  '${dateString}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Present:- $pCount   ",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Absent:- $aCount   ",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            InkWell(
              onTap: () => _selectDate(context),
              child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFF111d5e),
                      borderRadius: BorderRadius.circular(17)),
                  height: 45,
                  width: 90,
                  alignment: Alignment.center,
                  child: Text(
                    'Select date',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class DataBydateStaffN extends StatefulWidget {
  const DataBydateStaffN({super.key});

  @override
  State<DataBydateStaffN> createState() => _DataBydateStaffNState();
}

class _DataBydateStaffNState extends State<DataBydateStaffN> {
  DateTime selectedDate = DateTime.now();
  String dateString =
      DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
  late Future<void> responseData;
  List<EmployeeAttendenceStaffNModel> dataList = [];

  @override
  void initState() {
    super.initState();
    fetchDataByDate(dateString).then((value) {
      dataList.clear();
      dataList.addAll(value);
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime(2000),
            lastDate: DateTime.now())
        .then((value) {
      if (mounted) {
        setState(() {
          selectedDate = value!;
          dateString = DateFormat('yyyy-MM-dd').format(value).toString();
          fetchDataByDate(dateString).then((value) {
            dataList.clear();
            dataList.addAll(value);
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        decoration: BoxDecoration(
            color: Color(0xFF111d5e), borderRadius: BorderRadius.circular(17)),
        height: 50,
        width: 90,
        alignment: Alignment.center,
        child: FloatingActionButton(
          elevation: 0,
          backgroundColor: Color(0xFF111d5e),
          onPressed: () => _selectDate(context),
          child: Text(
            '${dateString}',
            style: TextStyle(
                fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: FutureBuilder<List<EmployeeAttendenceStaffNModel>>(
          future: fetchDataByDate(dateString),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child:
                      CircularProgressIndicator()); // Display loading indicator
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final data = snapshot.data!;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final dataItem = data[index];
                    return Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Table(
                          border: TableBorder(
                            horizontalInside: BorderSide(
                              color: Color(0xFF111d5e), // Color of the border
                              width: 1.0, // Width of the border
                            ),
                            verticalInside: BorderSide(
                              color: Color(0xFF111d5e), // Color of the border
                              width: 1.0, // Width of the border
                            ),
                            bottom: BorderSide(
                              color: Color(
                                  0xFF111d5e), // Color of the bottom border
                              width: 1.0, // Width of the bottom border
                            ),
                          ),
                          columnWidths: {
                            0: FlexColumnWidth(4),
                            1: FlexColumnWidth(4),
                            2: FlexColumnWidth(1.2),
                          }, // Allows to add a border decoration around your table
                          children: [
                            TableRow(children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "${dataItem.employeeName ?? "Empty"}",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "${dataItem.employeeCode ?? "Empty"}",
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xFFfcc736)),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '${dataItem.departmentSName ?? "Empty"}',
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.center,
                              ),
                              dataItem.status == "P"
                                  ? Text(
                                      '${dataItem.status ?? "Empty"}',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.green,
                                      ),
                                      textAlign: TextAlign.center,
                                    )
                                  : Text(
                                      '${dataItem.status ?? "Empty"}',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.red,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                            ]),
                          ]),
                    );
                  });
            }
          }),
    );
  }
}
