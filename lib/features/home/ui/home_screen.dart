import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/widgets/app_clicked_text.dart';
import 'package:blood_life/features/home/ui/widgets/donation_request.dart';
import 'package:blood_life/features/home/ui/widgets/what_you_need_page_view.dart';
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
                          Navigator.pushNamed(context, '/notefication');
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
                                      Navigator.pushNamed(context, '/map');
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
                          height: 130.h,
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
                const WhatYouNeed(),
                // Padding(
                //   padding: const EdgeInsets.all(16.0),
                //   child: Text("Blood Needed", style: TextStyles.font16K7lybold),
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 16),
                //   child: Container(
                //     height: 70.h,
                //     width: 363.w,
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(15),
                //       color: Colors.white,
                //       boxShadow: const [
                //         BoxShadow(
                //           color: Color.fromRGBO(217, 217, 217, 1),
                //           spreadRadius: 0,
                //           blurRadius: 4,
                //         ),
                //       ],
                //     ),
                //     child: Padding(
                //       padding: const EdgeInsets.symmetric(horizontal: 20),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Text(
                //             'A+',
                //             style: TextStyles.font24mainRedbold,
                //           ),
                //           Text(
                //             'B+',
                //             style: TextStyles.font24mainRedbold,
                //           ),
                //           Text(
                //             'AB-',
                //             style: TextStyles.font24mainRedbold,
                //           ),
                //           Text(
                //             'A-',
                //             style: TextStyles.font24mainRedbold,
                //           ),
                //           Text(
                //             'O+',
                //             style: TextStyles.font24mainRedbold,
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Donation Request",
                            style: TextStyles.font16K7lybold),
                        const ClicKedText(text: 'See All', onPressed: '')
                      ]),
                ),
                const DonationRequest(
                  nameHospital: 'Tanta Hospital',
                  time: "Time:03.00PM,21.january.2024",
                  bloodName: 'O+',
                  image: 'assets/svgs/profile0.svg',
                ),
                const DonationRequest(
                  nameHospital: 'Tanta Hospital',
                  time: "Time:06.00PM,28.january.2024",
                  bloodName: 'A-',
                  image: 'assets/svgs/profile2.svg',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
