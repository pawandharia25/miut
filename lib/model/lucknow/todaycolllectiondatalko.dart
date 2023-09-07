
class TodatCollectionLkoModel {
  String? message;
  TodayCollectionLkoModel? data;
  int? statuscode;
  int? totalCount;

  TodatCollectionLkoModel({this.message, this.data, this.statuscode, this.totalCount});

  TodatCollectionLkoModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data = (new TodayCollectionLkoModel.fromJson(v));
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

class TodayCollectionLkoModel {
  int? collectionAmount;
  var recoverableFeesShiftI;
  var recoverableFeesShiftII;
  var todayCollection;
  String? financialYearCollection;
  bool? isActive;
  String? createdDate;
  String? date;
  String? modifiedDate;
  int? createdby;
  int? updatedby;

  TodayCollectionLkoModel(
      {this.collectionAmount,
      this.recoverableFeesShiftI,
      this.recoverableFeesShiftII,
      this.todayCollection,
      this.financialYearCollection,
      this.isActive,
      this.createdDate,
      this.date,
      this.modifiedDate,
      this.createdby,
      this.updatedby});

  TodayCollectionLkoModel.fromJson(Map<String, dynamic> json) {
    collectionAmount = json['CollectionAmount'];
    recoverableFeesShiftI = json['Recoverable_Fees_shift_I'];
    recoverableFeesShiftII = json['Recoverable_Fees_shift_II'];
    todayCollection = json['TodayCollection'];
    financialYearCollection = json['FinancialYearCollection'];
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
    data['Recoverable_Fees_shift_I'] = this.recoverableFeesShiftI;
    data['Recoverable_Fees_shift_II'] = this.recoverableFeesShiftII;
    data['TodayCollection'] = this.todayCollection;
    data['FinancialYearCollection'] = this.financialYearCollection;
    data['IsActive'] = this.isActive;
    data['CreatedDate'] = this.createdDate;
    data['Date'] = this.date;
    data['ModifiedDate'] = this.modifiedDate;
    data['Createdby'] = this.createdby;
    data['Updatedby'] = this.updatedby;
    return data;
  }
}
