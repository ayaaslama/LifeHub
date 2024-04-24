import 'package:blood_life/core/theaming/stlye.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicalInfoWidget extends StatelessWidget {
  const MedicalInfoWidget({super.key});

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Blood Type',
                style: TextStyles.font14mainK7lysemiBold,
              ),
              Text(
                'O+',
                style: TextStyles.font20mainredsemiBold,
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
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total number of Donate',
                style: TextStyles.font14mainK7lysemiBold,
              ),
              Text(
                '5',
                style: TextStyles.font20mainredsemiBold,
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
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Donate Blood',
                style: TextStyles.font14mainK7lysemiBold,
              ),
              Text(
                '2',
                style: TextStyles.font20mainredsemiBold,
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
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Donate plasma ',
                style: TextStyles.font14mainK7lysemiBold,
              ),
              Text(
                '3',
                style: TextStyles.font20mainredsemiBold,
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
      ],
    );
  }
}
