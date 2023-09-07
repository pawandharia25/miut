import 'package:flutter/material.dart';
import 'package:miut/api/lucknow_api.dart';
import 'package:miut/api/noida_api.dart';
import 'package:miut/noida/facultydata.dart';
import 'package:miut/noida/staffdata.dart';
import 'package:miut/pages/widgets/NoidaApidata/Shift2Admissionnoida.dart';
import 'package:miut/pages/widgets/NoidaApidata/TotalstudentNoida.dart';
import 'package:miut/pages/widgets/NoidaApidata/faculty.dart';
import 'package:miut/pages/widgets/NoidaApidata/finacialyearcollection.dart';
import 'package:miut/pages/widgets/NoidaApidata/recoveryfees.dart';
import 'package:miut/pages/widgets/NoidaApidata/studentAttendence.dart';
import 'package:miut/pages/widgets/NoidaApidata/totalcollection.dart';
import 'package:miut/pages/widgets/appbarlogo.dart';
import 'package:miut/pages/widgets/NoidaApidata/Staff.dart';
import 'package:miut/pages/widgets/mainpage.dart';
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
        toolbarHeight: 80,
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Color(0xFFfcc736),
        shape: CircleBorder(eccentricity: 0),
        onPressed: () async {
          await NoidaAPi().FinancialYEarCollectionN();
          NoidaAPi().RecoveryFeesN();
          NoidaAPi().Shift2AddmissionN();
          LucknowAPi().StaffEmployeeLko();
          NoidaAPi().TodayCollecyionListN();
          NoidaAPi().TotalStudentN();
          NoidaAPi().fetchData();
          NoidaAPi().staffEmployeeN();
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
            const SizedBox(
              height: 20,
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
                        height: 80,
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
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StaffList()));
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
                        height: 80,
                        width: double.infinity,
                        child: Staff(),
                      ),
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
                        child: StudentAttendence()),
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
                        child: Collection())
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
                        child: FinacialYear()),
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
                        height: 80,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF111d5e)),
                        child: Shift2Admission()),
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
                          color: Colors.green.shade300),
                      child: RecoveryFees(),
                    )
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
                        height: 180,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.lightBlue.shade300),
                        child: TotalStudentN()),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ]),
    );
  }
}
