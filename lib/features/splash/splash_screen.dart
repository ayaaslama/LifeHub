import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/fonts_weight_helper.dart';
import 'package:blood_life/core/widgets/navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => MyNavigationBar()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          children: [
            Image.asset(
              'assets/images/logo.png',
            ),
            Padding(
              padding: EdgeInsets.only(left: 55.w, top: 58.h),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: 'Blood',
                  style: TextStyle(
                      fontSize: 25.sp,
                      color: ManagerColor.maink7ly,
                      fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: 'D',
                  style: TextStyle(
                      fontSize: 25.sp,
                      color: ManagerColor.mainred,
                      fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: 'onation',
                  style: TextStyle(
                      fontSize: 25.sp,
                      color: ManagerColor.maink7ly,
                      fontWeight: FontWeight.w600),
                ),
              ])),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 107, top: 90),
              child: Text(
                'Smart System',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15.sp,
                    color: ManagerColor.mainred,
                    fontWeight: FontsWeightHelper.medium),
              ),
            )
          ],
        ),
      ),
    );
  }
}
