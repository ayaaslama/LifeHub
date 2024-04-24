import 'package:blood_life/core/theaming/stlye.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalInfoWidget extends StatelessWidget {
  const PersonalInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Text(
            'radwanagy19@gmail.com',
            style: TextStyles.font14mainK7lysemiBold,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Divider(
          height: 10.h,
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Text(
            '+201148555386',
            style: TextStyles.font14mainK7lysemiBold,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Divider(
          height: 10.h,
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Text(
            'Natinal ID',
            style: TextStyles.font14mainK7lysemiBold,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Divider(
          height: 10.h,
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Text(
            'Nearest hospital / Center',
            style: TextStyles.font14mainK7lysemiBold,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Divider(
          height: 10.h,
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Text(
            'Female',
            style: TextStyles.font14mainK7lysemiBold,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Divider(
          height: 10.h,
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Text(
            'Date Of Birth',
            style: TextStyles.font14mainK7lysemiBold,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Divider(
          height: 10.h,
        ),
      ],
    );
  }
}
