import 'package:flutter/material.dart';
import 'package:miut/api/lucknow_api.dart';
import 'package:miut/lucknow/facultydatalko.dart';
import 'package:miut/lucknow/staffdatalko.dart';
import 'package:miut/pages/widgets/lucknowApidata/faculty.dart';
import 'package:miut/pages/widgets/lucknowApidata/financialyearLko.dart';
import 'package:miut/pages/widgets/lucknowApidata/shift2addmissionlko.dart';
import 'package:miut/pages/widgets/lucknowApidata/staff.dart';
import 'package:miut/pages/widgets/lucknowApidata/studentattendence.dart';
import 'package:miut/pages/widgets/lucknowApidata/todaycollection.dart';
import 'package:miut/pages/widgets/lucknowApidata/totalstudentlistlko.dart';
import 'package:miut/pages/widgets/mainpage.dart';
import 'widgets/appbarlogo.dart';
import 'widgets/currentdate.dart';
import 'widgets/lucknowApidata/recoveryfeeslko.dart';

class Lucknow extends StatelessWidget {
  Lucknow(Function(int index) onSelectedBottom, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        backgroundColor: Color(0xFF111d5e),
        toolbarHeight: 80,
        flexibleSpace: AppBarLogo(),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Color(0xFFfcc736),
        shape: CircleBorder(eccentricity: 0),
        onPressed: () async {
          await LucknowAPi().FinancialYEarCollectionLko();
          await LucknowAPi().RecoveryFeesLko();
          await LucknowAPi().Shift2AddmissionLko();
          await LucknowAPi().StaffEmployeeLko();
          await LucknowAPi().StudentAttendenceLko();
          await LucknowAPi().TodayCollecyionListLKo();
          await LucknowAPi().TotalStudentLko();
          await LucknowAPi().fetchData();
          await LucknowAPi().pgreg();
        },
        child: Icon(Icons.refresh),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: ListView(children: [
        Column(
          children: [
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(color: Color(0xFFfcc736)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "MUIT LUCKNOW",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )
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
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FacultyListLko()));
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Material(
                  elevation: 5,
                  child: Column(
                    children: [
                      Container(
                          height: 80,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue.shade300),
                          alignment: Alignment.center,
                          child: FacultyL()),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StaffListLko()));
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Material(
                  elevation: 5,
                  borderRadius: BorderRadius.circular(10),
                  child: Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.pinkAccent),
                          height: 80,
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: StaffL()),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: Column(
                  children: [
                    Container(
                        height: 80,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.orange.shade300),
                        child: StudentAttendenceLko()),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.greenAccent),
                        height: 80,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: TodayCollectionL()),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.pink.shade300),
                        height: 80,
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: FinacialYearLko()),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                      height: 80,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFF111d5e)),
                      child: Shift2AdmissionLko()),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                      height: 80,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFFfcc736)),
                      child: PhdReg()),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: Column(
                  children: [
                    Container(
                        height: 200,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green.shade300),
                        child: RecoveryFeesLko()),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: Column(
                  children: [
                    Container(
                        height: 200,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.lightBlue.shade300),
                        child: TotalStudentlLko()),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            )
          ],
        ),
      ]),
    );
  }
}

// Future<void> fetchDataFromMultipleSources() async {
//   FacultyL facultyL = FacultyL();
//   FinacialYearLko finacialYearLko = FinacialYearLko();
//   RecoveryFeesLko recoveryFeesLko = RecoveryFeesLko();
//   Shift2AdmissionLko shift2AdmissionLko = Shift2AdmissionLko();
//   StaffL staffL = StaffL();
//   StudentAttendenceLko studentAttendenceLko = StudentAttendenceLko();
//   TodayCollectionL todayCollectionL = TodayCollectionL();
//   TotalStudentlLko totalStudentlLko = TotalStudentlLko();
//   final datafacultyL = await facultyL;
//   final datafinacialYearLko = await finacialYearLko;
//   final datarecoveryFeesLko = await recoveryFeesLko;
//   final datashift2AdmissionLko = await shift2AdmissionLko;
//   final datastaffL = await staffL;
//   final datastudentAttendenceLko = await studentAttendenceLko;
//   final datatodayCollectionL = await todayCollectionL;
//   final datatotalStudentlLko = await totalStudentlLko;
// }
