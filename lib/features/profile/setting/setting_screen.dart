import 'package:blood_life/core/helper/extension.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/widgets/app_bar.dart';
import 'package:blood_life/features/profile/setting/widgets/content_of_setting_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Settings',
          style: TextStyle(
            color: ManagerColor.maink7ly,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
          color: ManagerColor.maink7ly,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
        child: const Column(
          children: [
            ContentOfSetting(
              text: 'Notification',
              imageAsset: 'assets/svgs/notification.svg',
            ),
            ContentOfSetting(
              text: 'FAQ',
              imageAsset: 'assets/svgs/message-question.svg',
            ),
            ContentOfSetting(
              text: 'Logout',
              imageAsset: 'assets/svgs/logout.svg',
            ),
          ],
        ),
      ),
    );
  }
}
