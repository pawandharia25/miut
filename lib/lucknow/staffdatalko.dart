import 'package:flutter/material.dart';
import 'package:miut/pages/widgets/appbarlogo.dart';
import 'package:miut/pages/widgets/lucknowApidata/staff.dart';
import '../pages/widgets/currentdate.dart';

class StaffListLko extends StatefulWidget {
  StaffListLko({
    super.key,
  });

  @override
  State<StaffListLko> createState() => _StaffListLkoState();
}

class _StaffListLkoState extends State<StaffListLko> {
  //   // Initialize a list of items for your table
  // List<StaffDataLko> items = [
  //  StaffDataLko()
  // ];

  // List<StaffDataLko> filteredItems = [];

  // @override
  // void initState() {
  //   super.initState();
  //   filteredItems = items; // Initialize filteredItems with all items
  // }

  // void _filterItems(String query) {
  //   setState(() {
  //     filteredItems = items
  //         .where((item) => item.toLowerCase().contains(query.toLowerCase()))
  //         .toList();
  //   });
  // }

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
          // Column(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: TextField(
          //         onChanged: _filterItems,
          //         decoration: InputDecoration(
          //           labelText: 'Search',
          //           border: OutlineInputBorder(
          //               borderRadius: BorderRadius.circular(10)),
          //           prefixIcon: Icon(Icons.search),
          //         ),
          //       ),
          //     ),
          //     ListView.builder(
          //       itemCount: filteredItems.length,
          //       itemBuilder: (context, index) {
          //         return ListTile(
          //           title: Text(filteredItems[index] as String),
          //         );
          //       },
          //     ),
          Container(
            alignment: Alignment.topRight,
            child: Text(
              '${currentDate.toString()}  ',
              style: TextStyle(fontSize: 15),
            ),
          ),
          Container(height: 130, width: 100, child: AttendenceSearchStaffLko()),
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
                  verticalInside: BorderSide(
                    color: Color(0xFF111d5e), // Color of the border
                    width: 1.0, // Width of the border
                  ),
                  top: BorderSide(
                    color: Color(0xFF111d5e), // Color of the bottom border
                    width: 1.0,
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
                      textAlign: TextAlign.center,
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
            child: DataBydateLko(),
          ),
        ]));
  }
}
