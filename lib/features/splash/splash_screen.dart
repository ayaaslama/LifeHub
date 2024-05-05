import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/fonts_weight_helper.dart';

import 'package:blood_life/features/onboarding/onboarding.dart';

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
          context, MaterialPageRoute(builder: (_) => const OnBoardingScreen()));
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
              padding: EdgeInsets.only(left: 75.w, top: 50.h),
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: 'Life',
                  style: TextStyle(
                      fontSize: 35.sp,
                      color: ManagerColor.maink7ly,
                      fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: 'h',
                  style: TextStyle(
                      fontSize: 35.sp,
                      color: ManagerColor.mainred,
                      fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: 'ub',
                  style: TextStyle(
                      fontSize: 35.sp,
                      color: ManagerColor.maink7ly,
                      fontWeight: FontWeight.w600),
                ),
              ])),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100, top: 90),
              child: Text(
                'Blood Donation',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 10.sp,
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
