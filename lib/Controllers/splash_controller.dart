import 'dart:developer';

import 'package:biometrics/Screens/biometrics.dart';
import 'package:biometrics/Util/Authentication.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final LocalAuthentication auth = LocalAuthentication();

  @override
  void onInit() {
    biomatrics();
    super.onInit();
  }

  biomatrics() async {
    bool isAuthenticated = await Authentication.authentication();
    log("Fingerprint....  $isAuthenticated");
    if (isAuthenticated) {
      Get.offAll(
        () => const Biometrics(),
      );
      print("Authentication Success");
    } else {
      print("Authentication failed");
    }
    update();
  }
}
