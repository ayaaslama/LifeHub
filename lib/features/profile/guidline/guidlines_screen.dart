import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/widgets/app_bar.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GuidlinesScreen extends StatelessWidget {
  const GuidlinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: CustomeAppBar(
                text: 'Guidlines',
                titleColor: ManagerColor.maink7ly,
                iconColor: ManagerColor.maink7ly,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Befor you Donate',
                        style: TextStyles.font14mainK7lysemiBold,
                      ),
                      Image.asset(
                        'assets/images/befordonate.png',
                        height: 50,
                        width: 50,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 140,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: ManagerColor.mainred,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 10.w, top: 5.h, bottom: 5.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "1-Ensure you meet eligibility criteria,including age,\n   weight and overall health",
                            style: TextStyles.font13GreyRegular,
                          ),
                          Text(
                            "2-Eat a nutritious meal, including iron-rich foods, and\n   stay well-hydrated",
                            style: TextStyles.font13GreyRegular,
                          ),
                          Text(
                            "3-Get a good night's sleep before donating",
                            style: TextStyles.font13GreyRegular,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'In-Hospital',
                        style: TextStyles.font14mainK7lysemiBold,
                      ),
                      Image.asset(
                        'assets/images/Rectangle 6659 (1).png',
                        height: 50,
                        width: 50,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 140,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: ManagerColor.mainred,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 10.w, top: 5.h, bottom: 5.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "1-Follow the guidelines provided by the hospital \n   staff.",
                            style: TextStyles.font13GreyRegular,
                          ),
                          Text(
                            "2-Inform them of any discomfort or unusual \n   symptoms post-donation.",
                            style: TextStyles.font13GreyRegular,
                          ),
                          Text(
                            "3-Take adequate rest and allow your body time to \n   recover.",
                            style: TextStyles.font13GreyRegular,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Divider(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'After you Donate',
                        style: TextStyles.font14mainK7lysemiBold,
                      ),
                      Image.asset(
                        'assets/images/Rectangle 6659 (2).png',
                        height: 50,
                        width: 50,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: ManagerColor.mainred,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 10.w, top: 5.h, bottom: 5.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "1-Rest for a few minutes and have a snack provided\n   by the blood donation center.",
                            style: TextStyles.font13GreyRegular,
                          ),
                          Text(
                            "2-Drink plenty of fluids to stay hydrated",
                            style: TextStyles.font13GreyRegular,
                          ),
                          Text(
                            "3-Avoid heavy lifting or strenuous activities for the \n   rest of the day.",
                            style: TextStyles.font13GreyRegular,
                          ),
                          Text(
                            "4. Eat a healthy meal with iron-rich foods to replenish \n   your energy",
                            style: TextStyles.font13GreyRegular,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Divider(
              height: 10.h,
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60.0),
              child: Text(
                '      Always consult with medical professionals for personalized advice\n     based on your health condition.',
                style: TextStyles.font14mainK7lysemiBold,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            AppTextButton(
              textButton: 'OK, Understand it',
              onPressed: () {
                Navigator.of(context).pushNamed('/profile');
              },
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}
