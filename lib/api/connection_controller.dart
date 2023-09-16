import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class ConnectionManagerController extends GetxController {
  //0 = No Internet, 1 = WIFI Connected ,2 = Mobile Data Connected.
  RxBool connectionType = false.obs;
  var connectedVia = "".obs;
  ConnectivityResult? connectivityResult;

  final Connectivity _connectivity = Connectivity();

  late StreamSubscription _streamSubscription;

  @override
  void onInit() {
    super.onInit();
    print("object in internet checker");
    checkConnectivity();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateState);
  }

  Future<bool> checkConnectivity() async {
    final connectivityResult = await (_connectivity.checkConnectivity());
    return _updateState(connectivityResult);
  }

  Future<void> getConnectivityType() async {
    late ConnectivityResult connectivityResult;
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
    } catch (e) {
      Logger().e("Internet connectivity error:==>$e");
    }
    return _updateState(connectivityResult);
  }

  _updateState(ConnectivityResult result) {
    connectivityResult = result;
    switch (result) {
      case ConnectivityResult.wifi:
        connectedVia.value = "Wifi";
        connectionType.value = true;
        return true;
      case ConnectivityResult.mobile:
        connectedVia.value = "Mobile";
        connectionType.value = true;
        return true;
      case ConnectivityResult.none:
        connectedVia.value = "None";
        connectionType.value = false;
        // Get.to(NoInternetScreen());
        Get.snackbar(
          "No Internet",
          "The data will not sync with the server in real time.",
          duration: Duration(
            seconds: 10,
          ),
          backgroundColor: Colors.yellow.shade600,
        );

        return false;
      default:
      // ShortMessage.snackBar(title: 'Failed to get connection type', message: "");
        return false;
    }
  }

  @override
  void onClose() {
    _streamSubscription.cancel();
  }
}
