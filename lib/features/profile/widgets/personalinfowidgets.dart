import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/features/profile/logic/cubit/personal_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalInfoWidget extends StatelessWidget {
  String? userName, email, phone, bloodBank, gender, nationalID;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PersonalCubit, PersonalState>(
      listener: (context, state) {
        if (State is PersonalLoading) {}
        if (state is Personalsuccess) {}
        if (state is Personalfailure) {}
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: Text(
                userName!,
                style: TextStyles.font14mainK7lysemiBold,
              ),
            ),
            SizedBox(height: 10.h),
            Divider(height: 10.h),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: Text(
                email!,
                style: TextStyles.font14mainK7lysemiBold,
              ),
            ),
            SizedBox(height: 10.h),
            Divider(height: 10.h),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: Text(
                phone!,
                style: TextStyles.font14mainK7lysemiBold,
              ),
            ),
            SizedBox(height: 10.h),
            Divider(height: 10.h),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: Text(
                bloodBank!,
                style: TextStyles.font14mainK7lysemiBold,
              ),
            ),
            SizedBox(height: 10.h),
            Divider(height: 10.h),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: Text(
                gender!,
                style: TextStyles.font14mainK7lysemiBold,
              ),
            ),
            SizedBox(height: 10.h),
            Divider(height: 10.h),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: Text(
                nationalID!,
                style: TextStyles.font14mainK7lysemiBold,
              ),
            ),
            SizedBox(height: 10.h),
            Divider(height: 10.h),
          ],
        );
      },
    );
  }
}
