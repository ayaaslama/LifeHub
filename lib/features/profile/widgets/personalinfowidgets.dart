import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/features/profile/logic/cubit/personal_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalInfoWidget extends StatefulWidget {
  const PersonalInfoWidget({Key? key}) : super(key: key);

  @override
  _PersonalInfoWidgetState createState() => _PersonalInfoWidgetState();
}

class _PersonalInfoWidgetState extends State<PersonalInfoWidget> {
  @override
  void initState() {
    super.initState();
    context.read<PersonalCubit>().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonalCubit, PersonalState>(
      builder: (context, state) {
        if (state is PersonalLoading) {
          return const Center(
              child: CircularProgressIndicator(
            color: ManagerColor.mainred,
          ));
        } else if (state is Personalsuccess) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.h),
                child: Text(
                  'Name: ${state.userName}',
                  style: TextStyles.font14mainK7lysemiBold,
                ),
              ),
              SizedBox(height: 10.h),
              Divider(height: 10.h),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.h),
                child: Text(
                  'Email: ${state.email}',
                  style: TextStyles.font14mainK7lysemiBold,
                ),
              ),
              SizedBox(height: 10.h),
              Divider(height: 10.h),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.h),
                child: Text(
                  'Phone: ${state.phone}',
                  style: TextStyles.font14mainK7lysemiBold,
                ),
              ),
              SizedBox(height: 10.h),
              Divider(height: 10.h),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.h),
                child: Text(
                  'Blood Bank: ${state.bloodBank}',
                  style: TextStyles.font14mainK7lysemiBold,
                ),
              ),
              SizedBox(height: 10.h),
              Divider(height: 10.h),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.h),
                child: Text(
                  'Gender: ${state.gender}',
                  style: TextStyles.font14mainK7lysemiBold,
                ),
              ),
              SizedBox(height: 10.h),
              Divider(height: 10.h),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.h),
                child: Text(
                  'National ID: ${state.nationalID}',
                  style: TextStyles.font14mainK7lysemiBold,
                ),
              ),
              SizedBox(height: 10.h),
              Divider(height: 10.h),
            ],
          );
        } else if (state is Personalfailure) {
          return Center(child: Text('Failed to fetch data.'));
        } else {
          return Center(child: Text('No data available.'));
        }
      },
    );
  }
}
