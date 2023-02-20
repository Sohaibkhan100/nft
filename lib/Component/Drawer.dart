import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:glass/glass.dart';
import 'package:nfts/Constants/ColorConstants.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [blackColor, blackColor],
          ),
        ),
        // width: 40.w,
        height: ScreenUtil().screenHeight,
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, top: 60.h),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25.r,
                    // child: BaseUrl.storage.read("profilePic").isEmpty
                    //     ? CircleAvatar(
                    //   backgroundColor: Colors.white,
                    //   radius: 23.r,
                    //   backgroundImage: AssetImage(emptyPhoto),
                    // )
                    //     : CircleAvatar(
                    //   backgroundColor: Colors.black,
                    //   radius: 23.r,
                    //   backgroundImage: NetworkImage(BaseUrl.imageUrl +
                    //       BaseUrl.storage.read("profilePic")),
                    // ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text("Welcome Back}",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          ?.merge(TextStyle(fontSize: 15.sp))),
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              DrawerListTile(
                title: "Subscription Plans",
                icon: Icon(CupertinoIcons.book, color: whiteColor),
                press: () {
                  Get.back();
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              DrawerListTile(
                title: "Membership Portal",
                icon: Icon(
                  CupertinoIcons.square_stack_3d_up_fill,
                  color: whiteColor,
                ),
                press: () {
                  Get.back();
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              DrawerListTile(
                title: "Refer & Earn",
                press: () {
                  Get.back();
                },
                icon: Icon(CupertinoIcons.link, color: whiteColor),
              ),
              SizedBox(
                height: 20.h,
              ),
              DrawerListTile(
                title: "Help Center",
                icon: Icon(Icons.help_outlined, color: whiteColor),
                press: () {
                  Get.back();
                },
              ),
              SizedBox(
                height: 20.h,
              ),
              DrawerListTile(
                title: "Setting",
                icon: Icon(Icons.settings, color: whiteColor),
                press: () {
                  Get.back();
                },
              ),
              Spacer(),
              DrawerListTile(
                title: "Logout",
                icon: Icon(Icons.login_outlined, color: whiteColor),
                press: () async {
                  showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                            backgroundColor: blackColor.withOpacity(.7),
                            title: Text(
                              'Are you sure want to logout?',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.merge(TextStyle(
                                      fontSize: 18.sp, color: whiteColor)),
                            ),
                            actions: [
                              Row(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.white),
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text(
                                        'Yes',
                                        style: TextStyle(color: Colors.black),
                                      )),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.white),
                                    onPressed: () => {Get.back(), Get.back()},
                                    child: const Text(
                                      'No',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                            ],
                          ).asGlass(tintColor: Colors.transparent));
                },
              ),
              SizedBox(
                height: 80.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  DrawerListTile({
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.icon,
    required this.press,
  });

  final String title;
  Icon icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: icon,
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
