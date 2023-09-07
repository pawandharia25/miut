// // import 'package:flutter/material.dart';
// // import 'package:miut/pages/widgets/NoidaApidata/Staff.dart';

// // class MyHomePage extends StatefulWidget {
// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage> {
// //   List<StaffData> originalData = [
// //    StaffData()
// //   ];

// //   List<StaffData> filteredData = [];

// //   @override
// //   void initState() {
// //     filteredData = originalData;
// //     super.initState();
// //   }

// //   void filterData(String query) {
// //     setState(() {
// //       if (query.isEmpty) {
// //         filteredData = originalData;
// //       } else {
// //         filteredData = originalData
// //             .where((item) =>
// //                 item.toLowerCase().contains(query.toLowerCase()))
// //             .toList();
// //       }
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Search Table Data'),
// //       ),
// //       body: Column(
// //         children: [
// //           Padding(
// //             padding: const EdgeInsets.all(16.0),
// //             child: TextField(
// //               onChanged: (value) {
// //                 filterData(value);
// //               },
// //               decoration: InputDecoration(
// //                 labelText: 'Search',
// //                 prefixIcon: Icon(Icons.search),
// //               ),
// //             ),
// //           ),
// //           Expanded(
// //             child: ListView.builder(
// //               itemCount: filteredData.length,
// //               itemBuilder: (context, index) {
// //                 return ListTile(
// //                   title: filteredData[index]
// //                 );
// //               },
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:miut/pages/widgets/NoidaApidata/faculty.dart';

// class Person {
//   final String name;
//   final String departmentname;
//   final String status;

//   Person(
//       {required this.name, required this.departmentname, required this.status});
// }

// class DataProvider {
//   List<FacultyData> getAllPersons() {
//     // Fetch or generate your list of persons
//     return [FacultyData()];
//   }
// }

// class TableScreen extends StatefulWidget {
//   @override
//   _TableScreenState createState() => _TableScreenState();
// }

// class _TableScreenState extends State<TableScreen> {
//   final DataProvider _dataProvider = DataProvider();
//   late List<Person> _persons;
//   late List<Person> _filteredPersons;

//   @override
//   void initState() {
//     super.initState();
//     _persons = _dataProvider.getAllPersons().cast<Person>();
//     _filteredPersons = List.from(_persons);
//   }

//   void _search(String query) {
//     setState(() {
//       _filteredPersons = _persons
//           .where((person) =>
//               person.name.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: TextField(
//               onChanged: _search,
//               decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.search),
//                   hintText: 'Search',
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(50))),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _filteredPersons.length,
//               itemBuilder: (context, index) {
//                 final person = _filteredPersons[index];
//                 return ListTile(
//                   title: Text(person.name),
//                   subtitle: Text(person.departmentname + person.status),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


