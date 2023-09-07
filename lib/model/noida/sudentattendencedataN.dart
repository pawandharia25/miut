class StudentAttendenceNModel {
  String? message;
  StudentAttendencedataNModel? data;
  int? statuscode;
  int? totalCount;

  StudentAttendenceNModel(
      {this.message, this.data, this.statuscode, this.totalCount});

  StudentAttendenceNModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data = (new StudentAttendencedataNModel.fromJson(v));
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

class StudentAttendencedataNModel {
  int? totalStudent;
  int? shiftIStudent;
  int? shiftIIStudent;
  int? shift2Admission;
  String? studentAttendance;
  bool? isActive;
  String? createdDate;
  String? date;
  String? modifiedDate;
  int? createdby;
  int? updatedby;

  StudentAttendencedataNModel(
      {this.totalStudent,
      this.shiftIStudent,
      this.shiftIIStudent,
      this.shift2Admission,
      this.studentAttendance,
      this.isActive,
      this.createdDate,
      this.date,
      this.modifiedDate,
      this.createdby,
      this.updatedby});

  StudentAttendencedataNModel.fromJson(Map<String, dynamic> json) {
    totalStudent = json['TotalStudent'];
    shiftIStudent = json['Shift_I_student'];
    shiftIIStudent = json['Shift_II_student'];
    shift2Admission = json['Shift_2_Admission'];
    studentAttendance = json['StudentAttendance'];
    isActive = json['IsActive'];
    createdDate = json['CreatedDate'];
    date = json['Date'];
    modifiedDate = json['ModifiedDate'];
    createdby = json['Createdby'];
    updatedby = json['Updatedby'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TotalStudent'] = this.totalStudent;
    data['Shift_I_student'] = this.shiftIStudent;
    data['Shift_II_student'] = this.shiftIIStudent;
    data['Shift_2_Admission'] = this.shift2Admission;
    data['StudentAttendance'] = this.studentAttendance;
    data['IsActive'] = this.isActive;
    data['CreatedDate'] = this.createdDate;
    data['Date'] = this.date;
    data['ModifiedDate'] = this.modifiedDate;
    data['Createdby'] = this.createdby;
    data['Updatedby'] = this.updatedby;
    return data;
  }
}
