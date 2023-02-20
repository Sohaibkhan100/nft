import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  ScrollController scrollController1 = ScrollController();
  ScrollController scrollController2 = ScrollController();
  RxDouble height = 100.0.obs;

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      double minScrollExtent = scrollController1.position.minScrollExtent;
      double maxScrollExtent = scrollController1.position.maxScrollExtent;
      animateToMaxMin(maxScrollExtent, minScrollExtent, maxScrollExtent, 15,
          scrollController1);
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      double minScrollExtent = scrollController2.position.minScrollExtent;
      double maxScrollExtent = scrollController2.position.maxScrollExtent;
      animateToMaxMin(maxScrollExtent, minScrollExtent, maxScrollExtent, 10,
          scrollController2);
    });
    super.onInit();
  }

  ontap() {
    if (height == 100.0) {
      height.value = 250.0;
      update();
    } else {
      height.value = 100.0;
      update();
    }
    update();
  }

  animateToMaxMin(double max, double min, double direction, int seconds,
      ScrollController scrollController) {
    scrollController
        .animateTo(direction,
            duration: Duration(seconds: seconds), curve: Curves.linear)
        .then((value) {
      direction = direction == max ? min : max;
      animateToMaxMin(max, min, direction, seconds, scrollController);
    });
  }
}
