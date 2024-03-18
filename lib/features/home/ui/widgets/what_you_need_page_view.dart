import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WhatYouNeed extends StatefulWidget {
  const WhatYouNeed({super.key});

  @override
  State<WhatYouNeed> createState() => _WhatYouNeedState();
}

class _WhatYouNeedState extends State<WhatYouNeed> {
  late PageController pc;
  @override
  void initState() {
    pc = new PageController(viewportFraction: 0.4);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    container(img, txt, double w, double h, c1, c2, void Function()? onTap) {
      return Container(
        width: w,
        height: h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: c1,
          border: Border.all(
            color: c2,
            width: 1,
          ),
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                img, // Replace with your image file path
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(txt, style: TextStyles.font16K7lybold),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      height: 115.h,
      child: PageView(
        controller: pc,
        children: [
          container(
              "assets/images/Vector (2).png",
              "Donate blood",
              140.w,
              111.h,
              Colors.white,
              ManagerColor.mainred,
              () => Navigator.pushNamed(context, '/blood_donate')),
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10),
            child: container(
                "assets/images/mdi_blood-plus.png",
                "Request blood",
                140.w,
                111,
                Colors.white,
                ManagerColor.mainred,
                () => Navigator.pushNamed(context, '/blood_requset')),
          ),
          container(
              "assets/images/service.png",
              "Service",
              140.w,
              111,
              Colors.white,
              ManagerColor.mainred,
              () => Navigator.pushNamed(context, '/service')),
        ],
      ),
    );
  }
}
