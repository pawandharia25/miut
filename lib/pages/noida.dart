import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:miut/api/lucknow_api.dart';
import 'package:miut/api/noida_api.dart';
import 'package:miut/noida/facultydata.dart';
import 'package:miut/noida/noida_lucknow_student_attandence_screen.dart';
import 'package:miut/noida/staffdata.dart';
import 'package:miut/pages/widgets/NoidaApidata/Shift2Admissionnoida.dart';
import 'package:miut/pages/widgets/NoidaApidata/TotalstudentNoida.dart';
import 'package:miut/pages/widgets/NoidaApidata/faculty.dart';
import 'package:miut/pages/widgets/NoidaApidata/finencial_year_noida.dart';
import 'package:miut/pages/widgets/NoidaApidata/recovery_fees_noida.dart';
import 'package:miut/pages/widgets/NoidaApidata/studentAttendence.dart';
import 'package:miut/pages/widgets/NoidaApidata/total_collection.dart';
import 'package:miut/pages/widgets/appbarlogo.dart';
import 'package:miut/pages/widgets/NoidaApidata/Staff.dart';
import 'widgets/currentdate.dart';

class Noida extends StatelessWidget {
  Noida(void Function(int index) onSelectedBottom, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        backgroundColor: Color(0xFF111d5e),
        flexibleSpace: const AppBarLogo(),
        toolbarHeight: 80.h,
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Color(0xFFfcc736),
        shape: CircleBorder(eccentricity: 0),
        onPressed: () async {
          await NoidaAPi().FinancialYEarCollectionN();
          await NoidaAPi().RecoveryFeesN();
          await NoidaAPi().Shift2AddmissionN();
          await LucknowAPi().StaffEmployeeLko();
          await NoidaAPi().TodayCollecyionListN();
          await NoidaAPi().TotalStudentN();
          await NoidaAPi().fetchData();
          await NoidaAPi().staffEmployeeN();
        },
        child: Icon(Icons.refresh),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: ListView(children: [
        Column(
          children: [
            Container(
              height: 50.h,
              width: double.infinity,
              decoration: BoxDecoration(color: Color(0xFFfcc736)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "MUIT NOIDA",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              child: Text(
                '${currentDate.toString()}  ',
                style: TextStyle(fontSize: 15),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FacultyList()));
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  child: Column(
                    children: [
                      Container(
                        height: 80.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blue.shade300),
                        alignment: Alignment.center,
                        child: Faculty(),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StaffList(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Material(
                  elevation: 5,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.pinkAccent),
                        height: 80.h,
                        width: double.infinity,
                        child: Staff(),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            InkWell(
              onTap: () {
                Get.to(
                  NoidaStudentAttandence(),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  child: Column(
                    children: [
                      Container(
                        height: 80.h,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.orange.shade300),
                        child: StudentAttendence(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //
            //
            // // noida collection
            // Padding(
            //   padding: const EdgeInsets.all(10),
            //   child: Material(
            //     elevation: 5,
            //     borderRadius: BorderRadius.circular(10),
            //     child: Column(
            //       children: [
            //         Container(
            //           decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(10),
            //               color: Colors.greenAccent),
            //           height: 80.h,
            //           width: double.infinity,
            //           alignment: Alignment.center,
            //           child: Collection(),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            // // noida collection
            // Padding(
            //   padding: const EdgeInsets.all(10),
            //   child: Material(
            //     elevation: 5,
            //     borderRadius: BorderRadius.circular(10),
            //     child: Column(
            //       children: [
            //         Container(
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(10),
            //                 color: Colors.pink.shade300),
            //             height: 80.h,
            //             width: double.infinity,
            //             alignment: Alignment.center,
            //             child: FinacialYear(),),
            //       ],
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(10),
            //   child: Material(
            //     elevation: 5,
            //     borderRadius: BorderRadius.circular(10),
            //     child: Column(
            //       children: [
            //         Container(
            //           height: 80.h,
            //           width: double.infinity,
            //           alignment: Alignment.center,
            //           decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(10),
            //               color: Color(0xFF111d5e)),
            //           child: Shift2Admission(),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // //  noida collection
            // Padding(
            //   padding: const EdgeInsets.all(10),
            //   child: Material(
            //     elevation: 5,
            //     borderRadius: BorderRadius.circular(10),
            //     child: Column(
            //       children: [
            //         Container(
            //           height: 200.h,
            //           width: double.infinity,
            //           alignment: Alignment.center,
            //           decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(10),
            //               color: Colors.green.shade300),
            //           child: RecoveryFees(),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            //
            // Padding(
            //   padding: const EdgeInsets.all(10),
            //   child: Material(
            //     elevation: 5,
            //     borderRadius: BorderRadius.circular(10),
            //     child: Column(
            //       children: [
            //         Container(
            //           height: 180.h,
            //           width: double.infinity,
            //           alignment: Alignment.center,
            //           decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(10),
            //               color: Colors.lightBlue.shade300),
            //           child: TotalStudentN(),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: 100.h,
            // ),
          ],
        ),
      ]),
    );
  }
}
