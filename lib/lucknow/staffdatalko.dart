import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:miut/model/lucknow/staffemployeeattendencelko.dart';
import 'package:miut/pages/widgets/appbarlogo.dart';
import 'package:miut/pages/widgets/lucknowApidata/staff.dart';
import 'package:search_page/search_page.dart';
import '../pages/widgets/currentdate.dart';

class StaffListLko extends StatefulWidget {
  StaffListLko({
    super.key,
  });

  @override
  State<StaffListLko> createState() => _StaffListLkoState();
}

class _StaffListLkoState extends State<StaffListLko> {
  DateTime selectedDate = DateTime.now();
  String dateString =
      DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
  late Future<void> responseData;
  List<Data> dataList = [];
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
    for (Data d in dataList) {
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

  Future<void> _selectDate1(BuildContext context) async {
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
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
            style: ButtonStyle(alignment: Alignment.centerLeft),
          ),
          backgroundColor: Color(0xFF111d5e),
          flexibleSpace: const AppBarLogo(),
          toolbarHeight: 80,
        ),
        body: ListView(children: [
          Container(
            alignment: Alignment.topRight,
            child: Text(
              '${currentDate.toString()}  ',
              style: TextStyle(fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 5,
              right: 5,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Date:- ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      '${dateString}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        // _selectDate1(context);
                        _selectDate(context);
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFF111d5e),
                              borderRadius: BorderRadius.circular(17)),
                          height: 45,
                          width: 90,
                          alignment: Alignment.center,
                          child: Text(
                            'Select Date',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    TextButton(
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: SearchPage<Data>(
                              items: dataList,
                              searchLabel: 'Search Staff',
                              suggestion: Center(
                                child: Text(
                                  'Filter Staff by Name',
                                  style: GoogleFonts.poppins(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              failure: Center(
                                child: Text(
                                  'Found Nothing :(',
                                  style: GoogleFonts.poppins(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              filter: (person) => [
                                person.employeeName,
                              ],
                              builder: (person) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: 10, right: 10, top: 10),
                                  child: Table(
                                    border: TableBorder(
                                      horizontalInside: BorderSide(
                                        color: Color(
                                            0xFF111d5e), // Color of the border
                                        width: 1.0, // Width of the border
                                      ),
                                      verticalInside: BorderSide(
                                        color: Color(
                                            0xFF111d5e), // Color of the border
                                        width: 1.0, // Width of the border
                                      ),
                                      bottom: BorderSide(
                                        color: Color(
                                            0xFF111d5e), // Color of the bottom border
                                        width:
                                        1.0, // Width of the bottom border
                                      ),
                                    ),
                                    columnWidths: {
                                      0: FlexColumnWidth(4),
                                      1: FlexColumnWidth(4),
                                      2: FlexColumnWidth(1.2),
                                    }, // Allows to add a border decoration around your table
                                    children: [
                                      TableRow(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                alignment:
                                                Alignment.centerLeft,
                                                child: Text(
                                                  "${person.employeeName ?? "Empty"}",
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                alignment:
                                                Alignment.centerLeft,
                                                child: Text(
                                                  "${person.employeeCode ?? "Empty"}",
                                                  textAlign:
                                                  TextAlign.justify,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color:
                                                      Color(0xFFfcc736)),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            '${person.departmentSName ?? "Empty"}',
                                            style: TextStyle(fontSize: 15),
                                            textAlign: TextAlign.center,
                                          ),
                                          person.status == "P"
                                              ? Text(
                                            '${person.status ?? "Empty"}',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.green,
                                            ),
                                            textAlign: TextAlign.center,
                                          )
                                              : Text(
                                            '${person.status ?? "Empty"}',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.red,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        );
                      },
                      child:  Container(
                          decoration: BoxDecoration(
                              color: Color(0xFF111d5e),
                              borderRadius: BorderRadius.circular(17)),
                          height: 45,
                          width: 90,
                          alignment: Alignment.center,
                          child: Text(
                            'Search',
                            style: TextStyle(color: Colors.white),
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Table(
                    border: TableBorder(
                      horizontalInside: BorderSide(
                        color: Color(0xFF111d5e), // Color of the border
                        width: 1.0, // Width of the border
                      ),
                      verticalInside: BorderSide(
                        color: Color(0xFF111d5e), // Color of the border
                        width: 1.0, // Width of the border
                      ),
                      top: BorderSide(
                        color: Color(0xFF111d5e), // Color of the border
                        width: 1.0, // Width of the border
                      ),
                      bottom: BorderSide(
                        color: Color(0xFF111d5e), // Color of the bottom border
                        width: 1.0, // Width of the bottom border
                      ),
                    ),
                    columnWidths: {
                      0: FlexColumnWidth(4),
                      1: FlexColumnWidth(4),
                      2: FlexColumnWidth(1.2),
                    },
                    children: [
                      TableRow(children: [
                        Container(
                          decoration: BoxDecoration(color: Color(0xFFfcc736)),
                          child: Text(
                            "Name",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(color: Color(0xFFfcc736)),
                          child: Text(
                            'Department',
                            style: TextStyle(fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(color: Color(0xFFfcc736)),
                          child: Text(
                            'Status',
                            style: TextStyle(fontSize: 15),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ]),
                    ]),
              ],
            ),
          ),
          Container(
            height: 500.h,
            width: double.infinity,
            child: FutureBuilder<List<Data>>(
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
                            padding:
                                EdgeInsets.only(left: 10, right: 10, top: 10),
                            child: Table(
                                border: TableBorder(
                                  horizontalInside: BorderSide(
                                    color: Color(
                                        0xFF111d5e), // Color of the border
                                    width: 1.0, // Width of the border
                                  ),
                                  verticalInside: BorderSide(
                                    color: Color(
                                        0xFF111d5e), // Color of the border
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
          ),
          Container(
            height: 20.h,
          )
        ]));
  }
}
