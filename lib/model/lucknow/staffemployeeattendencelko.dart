class StaffAttendenceLkoModel {
  String? message;
  EmployeeAttendenceStaffModel? data;
  int? statuscode;
  int? totalCount;

  StaffAttendenceLkoModel(
      {this.message, this.data, this.statuscode, this.totalCount});

  StaffAttendenceLkoModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data = (new EmployeeAttendenceStaffModel.fromJson(v));
      });
    }
    statuscode = json['statuscode'];
    totalCount = json['totalCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['data'] = this.data;
    data['statuscode'] = this.statuscode;
    data['totalCount'] = this.totalCount;
    return data;
  }
}

class EmployeeAttendenceStaffModel {
  var presentEmployee;
  int? total;
  int? userId;
  var employeeCode;
  var employeeName;
  var departmentSName;
  var dT;
  var timeIN;
  var timeOut;
  var duration;
  var status;
  bool? isActive;
  String? createdDate;
  String? date;
  String? modifiedDate;
  int? createdby;
  int? updatedby;

  EmployeeAttendenceStaffModel(
      {this.presentEmployee,
      this.total,
      this.userId,
      this.employeeCode,
      this.employeeName,
      this.departmentSName,
      this.dT,
      this.timeIN,
      this.timeOut,
      this.duration,
      this.status,
      this.isActive,
      this.createdDate,
      this.date,
      this.modifiedDate,
      this.createdby,
      this.updatedby});

  EmployeeAttendenceStaffModel.fromJson(Map<String, dynamic> json) {
    presentEmployee = json['Present_Employee'];
    total = json['Total'];
    userId = json['UserId'];
    employeeCode = json['EmployeeCode'];
    employeeName = json['EmployeeName'];
    departmentSName = json['DepartmentSName'];
    dT = json['DT'];
    timeIN = json['TimeIN'];
    timeOut = json['TimeOut'];
    duration = json['Duration'];
    status = json['Status'];
    isActive = json['IsActive'];
    createdDate = json['CreatedDate'];
    date = json['Date'];
    modifiedDate = json['ModifiedDate'];
    createdby = json['Createdby'];
    updatedby = json['Updatedby'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Present_Employee'] = this.presentEmployee;
    data['Total'] = this.total;
    data['UserId'] = this.userId;
    data['EmployeeCode'] = this.employeeCode;
    data['EmployeeName'] = this.employeeName;
    data['DepartmentSName'] = this.departmentSName;
    data['DT'] = this.dT;
    data['TimeIN'] = this.timeIN;
    data['TimeOut'] = this.timeOut;
    data['Duration'] = this.duration;
    data['Status'] = this.status;
    data['IsActive'] = this.isActive;
    data['CreatedDate'] = this.createdDate;
    data['Date'] = this.date;
    data['ModifiedDate'] = this.modifiedDate;
    data['Createdby'] = this.createdby;
    data['Updatedby'] = this.updatedby;
    return data;
  }
}
