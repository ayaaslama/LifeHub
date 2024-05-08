import 'package:blood_life/core/helper/extension.dart';
import 'package:blood_life/core/routing/routes.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/features/profile/widgets/medicalinfowidget.dart';
import 'package:blood_life/features/profile/widgets/personalinfowidgets.dart';
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
  List<bool> isSelected = [true, false];
  String indexChange = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ManagerColor.mainred,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: GestureDetector(
              child: SvgPicture.asset('assets/svgs/setting-2.svg'),
              onTap: () {
                context.pushNamed(Routes.settingScreen);
              },
            ),
          )
        ],
        title: Text(
          'Profile',
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
                SizedBox(
                  height: 20.h,
                ),
                ToggleButtons(
                  isSelected: isSelected,
                  onPressed: (int index) {
                    setState(() {
                      for (var i = 0; i < isSelected.length; i++) {
                        if (i == index) {
                          isSelected[i] = true;
                          indexChange = 'personal';
                        } else {
                          isSelected[i] = false;
                          indexChange = 'medical';
                        }
                      }
                    });
                  },
                  color: ManagerColor.mainred,
                  fillColor: ManagerColor.mainred,
                  borderRadius: BorderRadius.circular(16),
                  selectedColor: Colors.white,
                  disabledColor: ManagerColor.mainred,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text('Personal Info',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text('    Medical info    ',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Divider(
                  height: 10.h,
                ),
                indexChange == "personal"
                    ? const MedicalInfoWidget()
                    : const PersonalInfoWidget()
              ],
            ),
          )
        ],
      ),
    );
  }
}
