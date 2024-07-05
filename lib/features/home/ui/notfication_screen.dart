import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/widgets/app_clicked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NoteficationScreen extends StatelessWidget {
  const NoteficationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Notification',
          style: TextStyle(
            color: ManagerColor.maink7ly,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
          color: ManagerColor.maink7ly,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 0, 20.w, 10.h),
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
                      SizedBox(width: 40.w),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Requesting Success',
                              style: TextStyles.font14mainK7lysemiBold,
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "Congratulations - your Requesting is confirmed! We're looking forward to meeting with you and helping you achieve your request",
                              style: TextStyles.font13GreyRegular,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset('assets/svgs/calendar-2.svg'),
                      SizedBox(width: 40.w),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Schedule Changed',
                              style: TextStyles.font14mainK7lysemiBold,
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              "You have successfully changed your requesting. Don’t forget to activate your reminder.",
                              style: TextStyles.font13GreyRegular,
                            )
                          ],
                        ),
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
