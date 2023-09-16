
import 'package:miut/data/network/base_api_response.dart';
import 'package:miut/data/network/network_api_response.dart';
import 'package:miut/model/lucknow/lucknow_school_wise_attandence.dart';
import 'package:miut/model/noida/noida_school_wise_attandence.dart';
import 'package:miut/res/app_url.dart';

class LoginRepository {
  BaseApiServices _apiServices = NetworkApiServices();
  Future<dynamic> loginApi(
    var data,
  ) async {
    try {
      dynamic response =
         await _apiServices.postApi(data,  "");
      return response;
    } catch (e) {
      throw e;
    }
  }
}

class DashBoardRepo {
  BaseApiServices _apiServices = NetworkApiServices();
  Future<Lucknow_school_wise_attandence> dashboardApi () async{
    try{
      dynamic response = await _apiServices.getApi(AppUrl.lucknow_student_attandence);
      print( "   parsed data from model in get api   ${ Lucknow_school_wise_attandence.fromJson(response)}");
      return  Lucknow_school_wise_attandence.fromJson(response);
    } catch (e) {
      throw e;
    }

  }
}


class DashBoardRepo1 {
  BaseApiServices _apiServices = NetworkApiServices();
  Future<Noida_school_wise_attandence> dashboardApi () async{
    try{
      dynamic response = await _apiServices.getApi(AppUrl.noida_student_attandence);
      print( "   parsed data from model in get api   ${ Noida_school_wise_attandence.fromJson(response)}");
      return  Noida_school_wise_attandence.fromJson(response);
    } catch (e) {
      throw e;
    }

  }
}






