import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nfts/Component/SwipeCard.dart';
import 'package:nfts/Constants/ColorConstants.dart';
import 'package:nfts/Constants/TextConstants.dart';
import 'package:nfts/Controller/HomeController.dart';
import 'package:nfts/Routes/Routes.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:swipe_deck/swipe_deck.dart';

class HomeScreen extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());
  final IMAGES = [
    "apex",
    "cod",
    "destiny",
    "fc3",
    "game_4",
    "ghost",
    "mk11",
    "nfs",
    "pubg",
    "mk112"
  ];
  final borderRadius = BorderRadius.circular(20.0);

  @override
  Widget build(BuildContext context) {
    return ScaffoldGradientBackground(
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
        colors: [Colors.black, Colors.black],
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "NfTeas",
          style: GoogleFonts.pacifico(fontSize: 20.sp, color: whiteColor),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Get.toNamed(AppRoutes.drawer);
            },
            icon: Icon(
              Icons.menu,
              color: whiteColor,
            )),
      ),
      body: GetBuilder(
          init: homeController,
          builder: (_) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 20.w, top: 20.h, bottom: 5.h),
                    child: Text(
                      "Top Sellers",
                      style: GoogleFonts.aBeeZee(
                          fontSize: 20.sp, color: whiteColor),
                    ),
                  ),
                  Container(
                    width: 1.sw,
                    height: 80.h,
                    color: Colors.transparent,
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => SizedBox(
                        width: 0.w,
                      ),
                      itemCount: nfts.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(left: 5.w),
                          child: Container(
                            height: 40.h,
                            width: 150.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: ListTile(
                                leading: CircleAvatar(),
                                title: Text(
                                  "Gamer",
                                  style: GoogleFonts.pacifico(
                                      fontSize: 12.sp, color: whiteColor),
                                ),
                                subtitle: Text(
                                  "\$200,000",
                                  style: GoogleFonts.roboto(
                                      fontSize: 10.sp,
                                      color: Colors.grey.withOpacity(0.7)),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Divider(
                    color: whiteColor,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Center(
                    child: Container(
                      height: 200.h,
                      width: 300.w,
                      child: SwipeDeck(
                        startIndex: 3,
                        emptyIndicator: Container(
                          child: Center(
                            child: Text("Nothing Here"),
                          ),
                        ),
                        cardSpreadInDegrees: 5,
                        // Change the Spread of Background Cards
                        onSwipeLeft: () {
                          print("USER SWIPED LEFT -> GOING TO NEXT WIDGET");
                        },
                        onSwipeRight: () {
                          print(
                              "USER SWIPED RIGHT -> GOING TO PREVIOUS WIDGET");
                        },
                        onChange: (index) {
                          print(nfts[index]);
                        },
                        widgets: nfts
                            .map((e) => GestureDetector(
                                  onTap: () {
                                    print(e);
                                  },
                                  child: Container(
                                    color: whiteColor,
                                    child: Image.asset(
                                      "assets/images/$e.jpg",
                                      fit: BoxFit.cover,
                                      // height: 400,
                                      // width: 400,
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 20.w, top: 50.h, bottom: 22.h),
                    child: Text(
                      "Featured 🔥",
                      style: GoogleFonts.aBeeZee(
                          fontSize: 20.sp, color: whiteColor),
                    ),
                  ),
                  Container(
                    width: 1.sw,
                    height: 100.h,
                    color: Colors.transparent,
                    child: ListView.separated(
                      controller: homeController.scrollController1,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => SizedBox(
                        width: 15.w,
                      ),
                      itemCount: nfts.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 50.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: AssetImage(
                                    pics[index],
                                  ),
                                  fit: BoxFit.fill)),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    width: 1.sw,
                    height: 100.h,
                    color: Colors.transparent,
                    child: ListView.separated(
                      controller: homeController.scrollController2,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => SizedBox(
                        width: 15.w,
                      ),
                      itemCount: pics.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 50.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: AssetImage(
                                    pics[index],
                                  ),
                                  fit: BoxFit.fill)),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      homeController.ontap();
                      print("0");
                    },
                    child: Center(
                      child: AnimatedContainer(
                        curve: Curves.easeInOutBack,
                        color: homeController.height.value == 100.0
                            ? Colors.amber
                            : Colors.cyan,
                        duration: Duration(milliseconds: 800),
                        height: homeController.height.value,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 200.h,
                  )
                ],
              ),
            );
          }),
    );
  }
}
