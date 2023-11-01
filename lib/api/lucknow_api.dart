import 'dart:convert';
import 'package:miut/model/lucknow/facultyenployeeattendence.dart';
import 'package:http/http.dart' as http;
import 'package:miut/model/lucknow/financialyearcolletionLko.dart';
import 'package:miut/model/lucknow/recoveryfeesdatalko.dart';
import 'package:miut/model/lucknow/shift2addmissiondatalko.dart';
import 'package:miut/model/lucknow/staffemployeeattendencelko.dart';
import 'package:miut/model/lucknow/studentattendencedatalKo.dart';
import 'package:miut/model/lucknow/todaycolllectiondatalko.dart';
import 'package:miut/model/lucknow/totalstudentlko.dart';

class LucknowAPi {
  Future<FacultyEmployeeLkoModel> fetchData() async {
    const apiUrl =
        'https://luckstd.muituniversity.in/api/student/GetFaccultyAttendance'; // Replace with your API URL

    final response = await http.get(Uri.parse(apiUrl));
print("  response1  $response");
    if (response.statusCode == 200) {
      return FacultyEmployeeLkoModel.fromJson(json.decode(response.body));
    } else {
      throw ('Failed to load data from API');
    }
  }

  Future<FinacialYearCollectionLkoModel> FinancialYEarCollectionLko() async {
    const apiUrl =
        'https://luckstd.muituniversity.in/api/student/GetCollectionFinancialYear'; // Replace with your API URL

    final response = await http.get(Uri.parse(apiUrl));
print("  response2  $response");
    if (response.statusCode == 200) {
      return FinacialYearCollectionLkoModel.fromJson(
          json.decode(response.body));
    } else {
      throw ('Failed to load data from API');
    }
  }

  Future<RecoveryFeesLkoDataModel> RecoveryFeesLko() async {
    const apiUrl =
        'https://luckstd.muituniversity.in/api/student/GETRecoverableFees'; // Replace with your API URL

    final response = await http.get(Uri.parse(apiUrl));
print("  response3  $response");
    if (response.statusCode == 200) {
      return RecoveryFeesLkoDataModel.fromJson(json.decode(response.body));
    } else {
      throw ('Failed to load data from API');
    }
  }

  Future<Shift2AddmidionLkoModel> Shift2AddmissionLko() async {
    const apiUrl =
        'https://luckstd.muituniversity.in/api/student/GetAdmissionN'; // Replace with your API URL

    final response = await http.get(Uri.parse(apiUrl));
print("  response4  $response");
    if (response.statusCode == 200) {
      return Shift2AddmidionLkoModel.fromJson(json.decode(response.body));
    } else {
      throw ('Failed to load data from API');
    }
  }

  Future<StaffAttendenceLkoModel> StaffEmployeeLko() async {
    const apiUrl =
        'https://luckstd.muituniversity.in/api/student/GetStaffAttendance'; // Replace with your API URL

    final response = await http.get(Uri.parse(apiUrl));
print("  response5  $response");
    if (response.statusCode == 200) {
      return StaffAttendenceLkoModel.fromJson(json.decode(response.body));
    } else {
      throw ('Failed to load data from API');
    }
  }

  Future<StudentAttendenceDatalkoModel> StudentAttendenceLko() async {
    const apiUrl =
        'https://luckstd.muituniversity.in/api/student/GetStudentAttendance'; // Replace with your API URL

    final response = await http.get(Uri.parse(apiUrl));
print("  response6  $response");
    if (response.statusCode == 200) {
      return StudentAttendenceDatalkoModel.fromJson(json.decode(response.body));
    } else {
      throw ('Data not found');
    }
  }

  Future<TodayCollectionLkoModel> TodayCollecyionListLKo() async {
    const apiUrl =
        'https://luckstd.muituniversity.in/api/student/GetTodayCollection'; // Replace with your API URL

    final response = await http.get(Uri.parse(apiUrl));
print("  response7 $response");
    if (response.statusCode == 200) {
      return TodayCollectionLkoModel.fromJson(json.decode(response.body));
    } else {
      throw ('Data not found');
    }
  }

  Future<TotalStudentDataLkoModle> TotalStudentLko() async {
    const apiUrl =
        'https://luckstd.muituniversity.in/api/student/GetAdmissionN'; // Replace with your API URL

    final response = await http.get(Uri.parse(apiUrl));
    print("  response8  $response");

    if (response.statusCode == 200) {
      return TotalStudentDataLkoModle.fromJson(json.decode(response.body));
    } else {
      throw ('Data not found');
    }
  }

  Future<Shift2AddmidionLkoModel> pgreg() async {
    const apiUrl =
        'https://luckstd.muituniversity.in/api/student/GetAdmissionN'; // Replace with your API URL

    final response = await http.get(Uri.parse(apiUrl));
print("  response9  $response");
    if (response.statusCode == 200) {
      return Shift2AddmidionLkoModel.fromJson(json.decode(response.body));
    } else {
      throw ('Data not found');
    }
  }
}
