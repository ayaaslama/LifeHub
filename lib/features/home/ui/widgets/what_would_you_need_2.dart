import 'package:blood_life/core/helper/extension.dart';
import 'package:blood_life/core/routing/routes.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WhatWouldYouNeed2 extends StatelessWidget {
  const WhatWouldYouNeed2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Text("What Would You need ?", style: TextStyles.font16K7lybold),
        ),
        SizedBox(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 140.w,
                    height: 111.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      border: Border.all(
                        color: ManagerColor.mainred,
                        width: 1,
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        context.pushNamed(Routes.donateBlood);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/Vector (2).png",
                            color: ManagerColor.mainred,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text("Donate blood",
                                style: TextStyles.font16K7lybold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 140.w,
                    height: 111.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      border: Border.all(
                        color: ManagerColor.mainred,
                        width: 1,
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        context.pushNamed(Routes.bloodRequset);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/mdi_blood-plus.png",
                            color: ManagerColor.mainred,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text("Request blood",
                                style: TextStyles.font16K7lybold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 140.w,
                    height: 111.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      border: Border.all(
                        color: ManagerColor.mainred,
                        width: 1,
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        context.pushNamed(Routes.additionalService);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/service.png",
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text("Service",
                                style: TextStyles.font16K7lybold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 140.w,
                    height: 111.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      border: Border.all(
                        color: ManagerColor.mainred,
                        width: 1,
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        context.pushNamed(Routes.aiGenerator);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/robot.png",
                            width: 50.w,
                            height: 50.h,

                            color: ManagerColor
                                .mainred, // Replace with your image file path
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text("Ai Generator",
                                style: TextStyles.font16K7lybold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
