import 'package:get/get.dart';
import 'package:miut/data/response/status.dart';
import 'package:miut/model/lucknow/lucknow_school_wise_attandence.dart';
import 'package:miut/repo/repo.dart';

class LucknowStudentAttandenceController extends GetxController {

  final _api = DashBoardRepo();
  final rxRequestStatus = Status.Loading.obs;
  final  dataList =  Lucknow_school_wise_attandence().obs;
  RxString error = "".obs;
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;
  void setDataList( Lucknow_school_wise_attandence _value) => dataList.value = _value;
  void setError(String _value) => error.value = _value;




  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("chshssjjsf");
    dataListApi();
  }
  void dataListApi() {
    _api.dashboardApi().then((value) {
      setRxRequestStatus(Status.Complete);
      setDataList(value);
      print(" this is printing value is hrm contoller ${value.message}");
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.Error);
    });
  }


  void updateDataListApi() {

    setRxRequestStatus(Status.Loading);

    _api.dashboardApi().then((value) {
      setRxRequestStatus(Status.Complete);
      setDataList(value);
      print(" this is printing value is hrm contoller ${value.message}");
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.Error);
    });
  }

}