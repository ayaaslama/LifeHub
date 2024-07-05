import 'package:blood_life/core/helper/extension.dart';
import 'package:blood_life/core/routing/routes.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AfterDonate extends StatelessWidget {
  const AfterDonate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pushNamed(Routes.myNavigationBar);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
          color: ManagerColor.maink7ly,
        ),
        elevation: 0,
        backgroundColor: ManagerColor.white,
        title: Text(
          'After you donate',
          style: TextStyle(
            color: ManagerColor.maink7ly,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 20, bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Rest for a few minutes before you get up.",
                                      style: TextStyles.font16DarkBlackMedium,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Image.asset(
                                    "assets/images/seating.png",
                                    width: 50,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Enjoy 15 minutes in our refreshments area with a delicious snack and a drink.",
                                      style: TextStyles.font16DarkBlackMedium,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Image.asset(
                                    "assets/images/snack.png",
                                    width: 50,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "For 8 hours afterwards, drink plenty of fluids, get lots of rest and try to not overheat (avoid hot showers, rushing around and standing in the sun).",
                                      style: TextStyles.font16DarkBlackMedium,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Image.asset(
                                    "assets/images/drink.png",
                                    width: 50,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            AppTextButton(
              textButton: 'OK, Understood It',
              onPressed: () {
                context.pushReplacementNamed(Routes.myNavigationBar);
              },
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
