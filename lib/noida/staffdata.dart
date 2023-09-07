import 'package:flutter/material.dart';
import 'package:miut/pages/widgets/NoidaApidata/Staff.dart';
import 'package:miut/pages/widgets/appbarlogo.dart';
import '../pages/widgets/currentdate.dart';

class StaffList extends StatefulWidget {
  StaffList({
    super.key,
  });

  @override
  State<StaffList> createState() => _StaffListState();
}

class _StaffListState extends State<StaffList> {
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
        // Padding(
        //   padding: const EdgeInsets.all(5),
        //   child: Container(
        //     height: 50,
        //     width: 50,
        //     child: TextField(
        //         decoration: InputDecoration(
        //             hintText: "Search",
        //             prefixIcon: Icon(Icons.search),
        //             border: OutlineInputBorder(
        //               borderRadius: BorderRadius.circular(20),
        //             ))),
        //   ),
        // ),
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
            child: AttendenceSearchStaffN()),
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Table(
              border: TableBorder(
                horizontalInside: BorderSide(
                  color: Color(0xFF111d5e), // Color of the border
                  width: 1.0, // Width of the border
                ),
                top: BorderSide(
                  color: Color(0xFF111d5e), // Color of the border
                  width: 1.0, // Width of the border
                ),
                verticalInside: BorderSide(
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
          child: DataBydateStaffN(),
        ),
      ]),
    );
  }
}
