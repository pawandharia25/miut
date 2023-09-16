import 'package:get/get.dart';
import 'package:miut/api/connection_controller.dart';
import 'package:miut/infrastructures/utils/local_storage/local_storage.dart';

class InitVariables {
  onInit() {
    PrefManager().initlizedStorage();
    Get.put(ConnectionManagerController());
  }
}
