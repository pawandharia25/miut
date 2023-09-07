import 'package:flutter/material.dart';
import 'package:miut/pages/widgets/NoidaApidata/faculty.dart';
import 'package:miut/pages/widgets/appbarlogo.dart';
import '../pages/widgets/currentdate.dart';

class FacultyList extends StatelessWidget {
  FacultyList({
    super.key,
  });

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
      body: ListView(
        children: [
          Container(
            alignment: Alignment.topRight,
            child: Text(
              '${currentDate.toString()}  ',
              style: TextStyle(fontSize: 15),
            ),
          ),
          Container(
              height: 130, width: double.infinity, child: AttendenceFacultyN()),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Table(
                border: TableBorder(
                  horizontalInside: BorderSide(
                    color: Color(0xFF111d5e),
                    width: 1.0,
                  ),
                  verticalInside: BorderSide(
                    color: Color(0xFF111d5e),
                    width: 1.0,
                  ),
                  top: BorderSide(
                    color: Color(0xFF111d5e),
                    width: 1.0,
                  ),
                  bottom: BorderSide(
                    color: Color(0xFF111d5e),
                    width: 1.0,
                  ),
                ),
                columnWidths: {
                  0: FlexColumnWidth(4),
                  1: FlexColumnWidth(4),
                  2: FlexColumnWidth(1.2),
                },
                children: [
                  TableRow(children: [
                    Text(
                      "Name",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      'Department',
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Status',
                      style: TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  ]),
                ]),
          ),
          Container(
            height: 570,
            width: double.infinity,
            child: DataBydatefacultyN(),
          ),
        ],
      ),
    );
  }
}
