import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileSreen extends StatefulWidget {
  const ProfileSreen({super.key});

  @override
  State<ProfileSreen> createState() => _ProfileSreenState();
}

class _ProfileSreenState extends State<ProfileSreen> {
  final upperbodypartheight = 270;
  final double rounded = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManagerColor.mainred,
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height - 260.h + rounded,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(rounded),
                      topRight: Radius.circular(rounded))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 0),
            child: Column(
              children: [
                CustomeAppBar(
                  text: 'Profile',
                  iconColor: Colors.white,
                  actions: [
                    Padding(
                      padding: EdgeInsets.only(right: 16.w),
                      child: GestureDetector(
                        child: SvgPicture.asset('assets/svgs/setting-2.svg'),
                        onTap: () {
                          Navigator.pushNamed(context, '/setting');
                        },
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(120),
                    color: Colors.white,
                  ),
                  child: SvgPicture.asset(
                    'assets/svgs/profile1.svg',
                    height: 100,
                    width: 100,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Radwa Nagy',
                  style: TextStyles.font20K7lybold,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'radwanagy19@gmail.com',
                  style: TextStyles.font13GreyRegular,
                ),
                SizedBox(
                  height: 20.h,
                ),
                // Container(
                //   width: 327.w,
                //   height: 59.h,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(16),
                //       color: ManagerColor.lighterGrey),
                //   child: Padding(
                //     padding: const EdgeInsets.only(left: 20, right: 20),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         ClicKedText(
                //           text: 'Personal Info',
                //           fontSize: 16.sp,
                //           fontWeight: FontWeight.bold,
                //           onPressed: '',
                //         ),
                //         ClicKedText(
                //           fontSize: 16.sp,
                //           text: 'Medical Info',
                //           fontWeight: FontWeight.bold,
                //           onPressed: '',
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/personalcard.svg',
                        color: ManagerColor.mainred,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        "Personal Information",
                        style: TextStyles.font14mainK7lysemiBold,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Divider(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/calendar.svg',
                        color: ManagerColor.mainred,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        'Medical Information',
                        style: TextStyles.font14mainK7lysemiBold,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Divider(
                  height: 10.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 13),
                        child: SvgPicture.asset(
                          'assets/svgs/guidlines.svg',
                          color: ManagerColor.mainred,
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/guidlines');
                        },
                        child: Text(
                          'Guidlines',
                          style: TextStyles.font14mainK7lysemiBold,
                        ),
                      )
                    ],
                  ),
                ),

                Divider(
                  height: 10.h,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
