import 'package:flutter/material.dart';
import 'package:miut/pages/widgets/appbarlogo.dart';
import 'package:miut/pages/widgets/currentdate.dart';
import 'package:miut/pages/widgets/lucknowApidata/faculty.dart';

class FacultyListLko extends StatelessWidget {
  FacultyListLko({
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topRight,
                child: Text(
                  '${currentDate.toString()}  ',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                  height: 130,
                  width: double.infinity,
                  child: DataBydatestaffLko()),
              Padding(
                padding: const EdgeInsets.only(
                  left: 5,
                  right: 5,
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
              ),
              Container(
                height: 570,
                width: double.infinity,
                child: DataBydatestaffLko(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
