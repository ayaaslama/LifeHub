import 'package:blood_life/core/helper/extension.dart';
import 'package:blood_life/core/routing/routes.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WhatYouNeeded extends StatefulWidget {
  const WhatYouNeeded({super.key});

  @override
  State<WhatYouNeeded> createState() => _WhatYouNeededState();
}

class _WhatYouNeededState extends State<WhatYouNeeded> {
  List features = [
    {
      'image': "assets/images/Vector (2).png",
      'ontap': Routes.questionare,
      'text': "Donate blood",
    },
    {
      'image': "assets/images/mdi_blood-plus.png",
      'ontap': Routes.bloodRequset,
      'text': "Request blood",
    },
    {
      'image': "assets/images/service.png",
      'ontap': Routes.additionalService,
      'text': "Service",
    },
    {
      'image': "assets/images/robot.png",
      'ontap': Routes.aiGenerator,
      'text': "Ai Generator",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 0.h),
          itemCount: features.length,
          itemBuilder: (context, i) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h),
              child: Container(
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
                    context.pushNamed("${features[i]['ontap']}");
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "${features[i]['image']}",
                        color: ManagerColor.mainred,
                        width: 50.w,
                        height: 50.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text("${features[i]['text']}",
                            style: TextStyles.font16K7lybold),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
