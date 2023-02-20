import 'dart:async';

import 'package:get/get.dart';
import 'package:nfts/Routes/Routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    Timer(Duration(seconds: 5),
        Get.to(AppRoutes.bottomNavbarScreen) as void Function());
  }
}
