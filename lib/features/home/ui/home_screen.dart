import 'package:blood_life/core/helper/extension.dart';
import 'package:blood_life/core/routing/routes.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/widgets/app_clicked_text.dart';
import 'package:blood_life/features/home/ui/widgets/donation_request.dart';
import 'package:blood_life/features/home/ui/widgets/lisview_builder_of_what_you_need.dart';
import 'package:blood_life/features/profile/donating_what_to_except.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 60,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 130,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Hi, Radwa!",
                                style: TextStyles.font18K7lybold),
                            Text("How Are you Today?",
                                style: TextStyles.font11GreyRegular),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(Routes.noteficationScreen);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 150),
                          child: SvgPicture.asset(
                            'assets/svgs/notefication1.svg',
                            height: 24.h,
                            width: 24.w,
                            color: ManagerColor.mainred,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 16, right: 16),
                  child: Container(
                    width: 343.w,
                    height: 167.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ManagerColor.lighterRed,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 25, left: 20, right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Are You Qualified to Denote Blood ?",
                                    style: TextStyles.font18WhihteMedium),
                                SizedBox(
                                  height: 30.h,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      context.pushNamed(Routes.mapScreen);
                                    },
                                    child: Container(
                                        width: 120.w,
                                        height: 38.h,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(48)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 10),
                                          child: Text(
                                            " Find Nearby",
                                            style: GoogleFonts.montserrat(
                                                textStyle:
                                                    TextStyles.font12K7lybold),
                                          ),
                                        ))),
                              ],
                            ),
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/svgs/home.svg',
                          height: 100.h,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("What Would You need ?",
                      style: TextStyles.font16K7lybold),
                ),
                const WhatYouNeeded(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Text("Donating -What to expect",
                        style: TextStyles.font16K7lybold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 93.w,
                        height: 123.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ManagerColor.lightRed,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            context.pushNamed(Routes.beforDonate);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Image.asset(
                                  "assets/images/Rectangle 6654.png",
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2.0),
                                child: Text("Befor",
                                    style: TextStyles.font14mainK7lysemiBold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 93.w,
                        height: 123.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ManagerColor.lightBlue,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            context.pushNamed(Routes.inCenter);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Image.asset(
                                  "assets/images/Rectangle 6656.png",
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2.0),
                                child: Text("In_Center",
                                    style: TextStyles.font14mainK7lysemiBold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 93.w,
                        height: 123.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ManagerColor.lightRed,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            context.pushNamed(Routes.afterDonate);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Image.asset(
                                  "assets/images/Rectangle 6658.png",
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2.0),
                                child: Text("After",
                                    style: TextStyles.font14mainK7lysemiBold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Help Us", style: TextStyles.font16K7lybold),
                        // const ClicKedText(text: 'See All', routeName: '')
                      ]),
                ),
                const DonationRequest(
                  nameHospital: 'Medical center in Tanta',
                  location: "Tanta Qism 2, First Tanta",
                  bloodName: 'O+',
                ),
                const DonationRequest(
                  nameHospital: 'Al-Minshawi General Hospital',
                  location: "Tanta Qism 2 ",
                  bloodName: 'A-',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
