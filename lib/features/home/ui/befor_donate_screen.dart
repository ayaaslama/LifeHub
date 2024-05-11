import 'package:blood_life/core/helper/extension.dart';
import 'package:blood_life/core/routing/routes.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BeforDonate extends StatefulWidget {
  const BeforDonate({super.key});

  @override
  State<BeforDonate> createState() => _BeforDonateState();
}

class _BeforDonateState extends State<BeforDonate> {
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
          'Befor you donate',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Befor you Donate',
                            style: TextStyles.font16K7lybold,
                          ),
                          Image.asset(
                            'assets/images/befordonate.png',
                            height: 70,
                            width: 70,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Center(
                        child: Container(
                          height: 250.h,
                          width: 300.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: ManagerColor.mainred,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 10.w, top: 5.h, bottom: 5.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "1-Ensure you meet eligibility criteria,including age weight and overall health",
                                  style: TextStyles.font16GreyMedium,
                                ),
                                Text(
                                  "2-Eat a nutritious meal, including iron-rich foods, and\nstay well-hydrated",
                                  style: TextStyles.font16GreyMedium,
                                ),
                                Text(
                                  "3-Get a good night's sleep before donating",
                                  style: TextStyles.font16GreyMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 35.w, right: 35.w, top: 20.h),
              child: Column(
                children: [
                  Text(
                    'Always consult with medical professionals ',
                    style: TextStyles.font14mainK7lysemiBold,
                  ),
                  Text(
                    'personalized advice based on your ',
                    style: TextStyles.font14mainK7lysemiBold,
                  ),
                  Text(
                    'health condition.',
                    style: TextStyles.font14mainK7lysemiBold,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            AppTextButton(
              textButton: 'OK, Understand it',
              onPressed: () {
                context.pushReplacementNamed(Routes.profileSreen);
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
