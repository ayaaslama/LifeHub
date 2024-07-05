import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/fonts_weight_helper.dart';
<<<<<<< HEAD
import 'package:blood_life/features/onboarding/onboarding.dart';
=======
import 'package:blood_life/core/widgets/navigation_bar.dart';

>>>>>>> 08125564f06ffe5cc47f87c2b5536e17bfe00e3b
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
<<<<<<< HEAD
          context, MaterialPageRoute(builder: (_) => OnBoardingScreen()));
=======
          context, MaterialPageRoute(builder: (_) => MyNavigationBar()));
>>>>>>> 08125564f06ffe5cc47f87c2b5536e17bfe00e3b
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
<<<<<<< HEAD
              padding: EdgeInsets.only(left: 28.w, top: 58.h),
=======
              padding: EdgeInsets.only(left: 55.w, top: 58.h),
>>>>>>> 08125564f06ffe5cc47f87c2b5536e17bfe00e3b
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: 'Blood',
                  style: TextStyle(
<<<<<<< HEAD
                      fontSize: 24.sp,
=======
                      fontSize: 25.sp,
>>>>>>> 08125564f06ffe5cc47f87c2b5536e17bfe00e3b
                      color: ManagerColor.maink7ly,
                      fontWeight: FontWeight.w600),
                ),
                TextSpan(
<<<<<<< HEAD
                  text: 'H',
                  style: TextStyle(
                      fontSize: 24.sp,
=======
                  text: 'D',
                  style: TextStyle(
                      fontSize: 25.sp,
>>>>>>> 08125564f06ffe5cc47f87c2b5536e17bfe00e3b
                      color: ManagerColor.mainred,
                      fontWeight: FontWeight.w600),
                ),
                TextSpan(
<<<<<<< HEAD
                  text: 'up',
=======
                  text: 'onation',
>>>>>>> 08125564f06ffe5cc47f87c2b5536e17bfe00e3b
                  style: TextStyle(
                      fontSize: 25.sp,
                      color: ManagerColor.maink7ly,
                      fontWeight: FontWeight.w600),
                ),
              ])),
            ),
            Padding(
<<<<<<< HEAD
              padding: const EdgeInsets.only(left: 98, top: 90),
              child: Text(
                'blood donation',
=======
              padding: const EdgeInsets.only(left: 107, top: 90),
              child: Text(
                'Smart System',
>>>>>>> 08125564f06ffe5cc47f87c2b5536e17bfe00e3b
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
