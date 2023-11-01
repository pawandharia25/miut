import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:miut/model/noida/facultyemployeeattendenceN.dart';
import 'package:miut/model/noida/financialyearcollectionN.dart';
import 'package:miut/model/noida/recoveryfeesdataN.dart';
import 'package:miut/model/noida/shift2admissiondataN.dart';
import 'package:miut/model/noida/staffemployeeattendenceN.dart';
import 'package:miut/model/noida/sudentattendencedataN.dart';
import 'package:miut/model/noida/todatcollectiondataN.dart';
import 'package:miut/model/noida/totalstudentN.dart';

class NoidaAPi {
  Future<EmployeeAttendenceDataModel> fetchData() async {
    const apiUrl =
        'https://noidastd.muituniversity.in/api/Student/GetFaccultyAttendance'; // Replace with your API URL

    final response = await http.get(Uri.parse(apiUrl));
    print("  response1  ${response.body}");
    if (response.statusCode == 200) {
      return EmployeeAttendenceDataModel.fromJson(json.decode(response.body));
    } else {
      throw ('Data not found');
    }
  }

  Future<EmployeeAttendenceStaffNModel> staffEmployeeN() async {
    const apiUrl =
        'https://noidastd.muituniversity.in/api/Student/GetStaffAttendance'; // Replace with your API URL

    final response = await http.get(Uri.parse(apiUrl));
    print("  response2  $response");
    if (response.statusCode == 200) {
      return EmployeeAttendenceStaffNModel.fromJson(json.decode(response.body));
    } else {
      throw ('Data not found');
    }
  }

  Future<FinacialYearDataNModel> FinancialYEarCollectionN() async {
    const apiUrl =
        'https://noidastd.muituniversity.in/api/student/GetCollectionFinancialYear'; // Replace with your API URL

    final response = await http.get(Uri.parse(apiUrl));
    print("  response3  $response");
    if (response.statusCode == 200) {
      return FinacialYearDataNModel.fromJson(json.decode(response.body));
    } else {
      throw ('Data not found');
    }
  }

  Future<RecoveryFeesNModel> RecoveryFeesN() async {
    const apiUrl =
        'https://noidastd.muituniversity.in/api/student/GETRecoverableFees'; // Replace with your API URL

    final response = await http.get(Uri.parse(apiUrl));
    print("  response4  $response");
    if (response.statusCode == 200) {
      return RecoveryFeesNModel.fromJson(json.decode(response.body));
    } else {
      throw ('Data not found');
    }
  }

  Future<Shift2AddmidionLkoModel> Shift2AddmissionN() async {
    const apiUrl =
        'https://noidastd.muituniversity.in/api/student/GetAdmissionN'; // Replace with your API URL

    final response = await http.get(Uri.parse(apiUrl));
    print("  response5  $response");
    if (response.statusCode == 200) {
      return Shift2AddmidionLkoModel.fromJson(json.decode(response.body));
    } else {
      throw ('Data not found');
    }
  }

  Future<StudentAttendencedataNModel> StudentAttendenceN() async {
    const apiUrl =
        'https://noidastd.muituniversity.in/api/student/GetStudentAttendance'; // Replace with your API URL

    final response = await http.get(Uri.parse(apiUrl));
    print("  response6  $response");
    if (response.statusCode == 200) {
      return StudentAttendencedataNModel.fromJson(json.decode(response.body));
    } else {
      throw ('Data not found');
    }
  }

  Future<TodayCollectionDataNModel> TodayCollecyionListN() async {
    const apiUrl =
        'https://noidastd.muituniversity.in/api/student/GetTodayCollection'; // Replace with your API URL

    final response = await http.get(Uri.parse(apiUrl));
    print("  response7  $response");
    if (response.statusCode == 200) {
      return TodayCollectionDataNModel.fromJson(json.decode(response.body));
    } else {
      throw ('Data not found');
    }
  }

  Future<TotalStudentDataListNModel> TotalStudentN() async {
    const apiUrl =
        'https://noidastd.muituniversity.in/api/student/GetAdmissionN'; // Replace with your API URL

    final response = await http.get(Uri.parse(apiUrl));
    print("  response8  $response");
    if (response.statusCode == 200) {
      return TotalStudentDataListNModel.fromJson(json.decode(response.body));
    } else {
      throw ('Data not found');
    }
  }
}
