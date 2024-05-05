import 'package:blood_life/core/helper/extension.dart';
import 'package:blood_life/core/routing/routes.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ManagerColor.mainred,
        title: Text(
          'Points',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            context.pushNamed(Routes.myNavigationBar);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Congratulation..!',
              style: TextStyles.font16GreysemiBold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: SvgPicture.asset(
              'assets/svgs/gift.svg',
              height: 230.h,
              width: 233.w,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text: 'You Have:', style: TextStyles.font16GreysemiBold),
                TextSpan(
                    text: '1000',
                    style: TextStyle(
                        fontSize: 40.sp,
                        color: ManagerColor.maink7ly,
                        fontWeight: FontWeight.bold)),
                TextSpan(text: ' Points', style: TextStyles.font16GreysemiBold),
              ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Head to the nearest center to receive your gift!',
              style: TextStyles.font16GreysemiBold,
            ),
          ),
        ],
      ),
    );
  }
}
