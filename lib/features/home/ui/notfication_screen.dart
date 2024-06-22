import 'package:blood_life/core/helper/extension.dart';
import 'package:blood_life/core/routing/routes.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/widgets/app_bar.dart';
import 'package:blood_life/core/widgets/app_clicked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NoteficationScreen extends StatelessWidget {
  const NoteficationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Notefication',
          style: TextStyle(
            color: ManagerColor.maink7ly,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            context.pushNamed(Routes.myNavigationBar);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
          color: ManagerColor.maink7ly,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 20, 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Today', style: TextStyles.font14GreyMedium),
                      const ClicKedText(
                        text: 'Mark all as read',
                        routeName: '',
                      )
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset('assets/svgs/calendar.svg'),
                      SizedBox(
                        width: 40.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Requesting Success ',
                            style: TextStyles.font14mainK7lysemiBold,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Congratulations - your Requesting is\n confirmed! We're looking forward to meeting \nwith you and helping you achieve your request ",
                            style: TextStyles.font13GreyRegular,
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset('assets/svgs/calendar-2.svg'),
                      SizedBox(
                        width: 40.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Schedule Changed ',
                            style: TextStyles.font14mainK7lysemiBold,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "You have successfully changed your \nrequsting Don’t forget to active your reminder",
                            style: TextStyles.font13GreyRegular,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
