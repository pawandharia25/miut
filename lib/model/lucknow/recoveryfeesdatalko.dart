
class RecoveryFeesLkoModel {
  String? message;
  RecoveryFeesLkoDataModel? data;
  int? statuscode;
  int? totalCount;

  RecoveryFeesLkoModel({this.message, this.data, this.statuscode, this.totalCount});

  RecoveryFeesLkoModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data = (new RecoveryFeesLkoDataModel.fromJson(v));
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

class RecoveryFeesLkoDataModel{
  int? collectionAmount;
  String? recoverableFeesTotal;
  String? recoverableFeesShiftI;
  String? recoverableFeesShiftII;
  var todayCollection;
  var financialYearCollection;
  String? sectionA;
  bool? isActive;
  String? createdDate;
  String? date;
  String? modifiedDate;
  int? createdby;
  int? updatedby;

  RecoveryFeesLkoDataModel(
      {this.collectionAmount,
      this.recoverableFeesTotal,
      this.recoverableFeesShiftI,
      this.recoverableFeesShiftII,
      this.todayCollection,
      this.financialYearCollection,
      this.sectionA,
      this.isActive,
      this.createdDate,
      this.date,
      this.modifiedDate,
      this.createdby,
      this.updatedby});

  RecoveryFeesLkoDataModel.fromJson(Map<String, dynamic> json) {
    collectionAmount = json['CollectionAmount'];
    recoverableFeesTotal = json['Recoverable_Fees_total'];
    recoverableFeesShiftI = json['Recoverable_Fees_shift_I'];
    recoverableFeesShiftII = json['Recoverable_Fees_shift_II'];
    todayCollection = json['TodayCollection'];
    financialYearCollection = json['FinancialYearCollection'];
    sectionA = json['Section_A'];
    isActive = json['IsActive'];
    createdDate = json['CreatedDate'];
    date = json['Date'];
    modifiedDate = json['ModifiedDate'];
    createdby = json['Createdby'];
    updatedby = json['Updatedby'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CollectionAmount'] = this.collectionAmount;
    data['Recoverable_Fees_total'] = this.recoverableFeesTotal;
    data['Recoverable_Fees_shift_I'] = this.recoverableFeesShiftI;
    data['Recoverable_Fees_shift_II'] = this.recoverableFeesShiftII;
    data['TodayCollection'] = this.todayCollection;
    data['FinancialYearCollection'] = this.financialYearCollection;
    data['Section_A'] = this.sectionA;
    data['IsActive'] = this.isActive;
    data['CreatedDate'] = this.createdDate;
    data['Date'] = this.date;
    data['ModifiedDate'] = this.modifiedDate;
    data['Createdby'] = this.createdby;
    data['Updatedby'] = this.updatedby;
    return data;
  }
}