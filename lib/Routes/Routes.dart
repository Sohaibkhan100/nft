import 'package:get/get.dart';
import 'package:nfts/Component/Drawer.dart';
import 'package:nfts/Controller/SplashController.dart';
import 'package:nfts/View/BottomNavbarScreen/BottomNavbarScreen.dart';
import 'package:nfts/View/MyGalleryScreen/MyGalleryScreen.dart';
import 'package:nfts/View/NotificationScreen/NotificationScreen.dart';
import 'package:nfts/View/ProfileScreen/ProfileScreen.dart';

import '../View/HomeScreen/HomeScreen.dart';
import '../View/SplashScreen/SplashScreen.dart';

class AppRoutes {
  static String splash = "/";
  static String homeScreen = "/homeScreen";
  static String bottomNavbarScreen = "/bottomNavbarScreen";
  static String notificationScreen = "/notificationScreen";
  static String profileScreen = "/profileScreen";
  static String myGalleryScreen = "/myGalleryScreen";
  static String drawer = "/drawer";

  static List<GetPage<dynamic>> routes = [
    GetPage(
        name: splash,
        page: () => SplashScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: homeScreen,
        page: () => HomeScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: bottomNavbarScreen,
        page: () => BottomNavbarScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: profileScreen,
        page: () => ProfileScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: notificationScreen,
        page: () => NotificationScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: myGalleryScreen,
        page: () => MyGalleryScreen(),
        transition: Transition.fadeIn),
  ];
}
