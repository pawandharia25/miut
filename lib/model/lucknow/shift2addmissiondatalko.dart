
class Shift2AddmidionLkoModel {
  String? message;
  Shift2AddmidionLkoDataModel? data;
  int? statuscode;
  int? totalCount;

  Shift2AddmidionLkoModel({this.message, this.data, this.statuscode, this.totalCount});

  Shift2AddmidionLkoModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data = (new Shift2AddmidionLkoDataModel.fromJson(v));
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

class Shift2AddmidionLkoDataModel {
  int? totalStudent;
  int? shiftIStudent;
  int? shiftIIStudent;
  int? shift2Admission;
  int? phDReg;

  bool? isActive;
  String? createdDate;
  String? date;
  String? modifiedDate;
  int? createdby;
  int? updatedby;

  Shift2AddmidionLkoDataModel(
      {this.totalStudent,
      this.shiftIStudent,
      this.shiftIIStudent,
      this.shift2Admission,
      this.phDReg,
      this.isActive,
      this.createdDate,
      this.date,
      this.modifiedDate,
      this.createdby,
      this.updatedby});

  Shift2AddmidionLkoDataModel.fromJson(Map<String, dynamic> json) {
    totalStudent = json['TotalStudent'];
    shiftIStudent = json['Shift_I_student'];
    shiftIIStudent = json['Shift_II_student'];
    shift2Admission = json['Shift_2_Admission'];
    phDReg = json['PhD_Reg'];

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
    data['PhD_Reg'] = this.phDReg;
    data['IsActive'] = this.isActive;
    data['CreatedDate'] = this.createdDate;
    data['Date'] = this.date;
    data['ModifiedDate'] = this.modifiedDate;
    data['Createdby'] = this.createdby;
    data['Updatedby'] = this.updatedby;
    return data;
  }
}