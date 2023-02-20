import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nfts/Constants/ColorConstants.dart';
import 'package:nfts/Controller/BottomNavbarController.dart';
import 'package:nfts/View/HomeScreen/HomeScreen.dart';
import 'package:nfts/View/MyGalleryScreen/MyGalleryScreen.dart';
import 'package:nfts/View/NotificationScreen/NotificationScreen.dart';
import 'package:nfts/View/ProfileScreen/ProfileScreen.dart';

class BottomNavbarScreen extends StatelessWidget {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);
  BottomNavbarController bottomNavbarController =
      Get.put(BottomNavbarController(), permanent: false);
  final TextStyle selectedLabelStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 70,
          child: BottomNavigationBar(
            elevation: 0,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            backgroundColor: Colors.black,
            unselectedItemColor: Colors.white.withOpacity(0.5),
            selectedItemColor: Colors.white,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  height: 40.h,
                  width: 90.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.home,
                        size: 20.0,
                        // color: primaryColor,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      bottomNavbarController.tabIndex.value == 0
                          ? Text(
                              "Home",
                              // style: TextStyle(color: primaryColor),
                            )
                          : Text("")
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: bottomNavbarController.tabIndex.value == 0
                          ? primaryColor.withOpacity(0.2)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(15.r)),
                ),
                label: '',
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  height: 40.h,
                  width: 90.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.browse_gallery,
                        size: 20.0,
                        // color: primaryColor,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      bottomNavbarController.tabIndex.value == 1
                          ? Text(
                              "Gallery",
                              // style: TextStyle(color: primaryColor),
                            )
                          : Text("")
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: bottomNavbarController.tabIndex.value == 1
                          ? primaryColor.withOpacity(0.2)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(15.r)),
                ),
                label: '',
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  height: 40.h,
                  width: 90.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.notifications,
                        size: 20.0,
                        // color: primaryColor,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      bottomNavbarController.tabIndex.value == 2
                          ? Text(
                              "Notifi",
                              // style: TextStyle(color: primaryColor),
                            )
                          : Text("")
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: bottomNavbarController.tabIndex.value == 2
                          ? primaryColor.withOpacity(0.2)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(15.r)),
                ),
                label: '',
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  height: 40.h,
                  width: 90.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        size: 20.0,
                        // color: primaryColor,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      bottomNavbarController.tabIndex.value == 3
                          ? Text(
                              "Profile",
                              // style: TextStyle(color: primaryColor),
                            )
                          : Text("")
                    ],
                  ),
                  decoration: BoxDecoration(
                      color: bottomNavbarController.tabIndex.value == 3
                          ? primaryColor.withOpacity(0.2)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(15.r)),
                ),
                label: '',
                backgroundColor: Colors.black,
              ),
            ],
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    BottomNavbarController bottomNavbarController =
        Get.put(BottomNavbarController(), permanent: false);
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar:
          buildBottomNavigationMenu(context, bottomNavbarController),
      body: Obx(() => IndexedStack(
            index: bottomNavbarController.tabIndex.value,
            children: [
              HomeScreen(),
              ProfileScreen(),
              MyGalleryScreen(),
              NotificationScreen()
            ],
          )),
    ));
  }
}
