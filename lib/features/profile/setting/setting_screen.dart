import 'package:blood_life/core/helper/extension.dart';
import 'package:blood_life/core/routing/routes.dart';
import 'package:blood_life/core/theaming/color.dart';
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
        child: Column(
          children: [
            ContentOfSetting(
              onTap: () => context.pushNamed(Routes.noteficationScreen),
              text: 'Notification',
              imageAsset: 'assets/svgs/notification.svg',
            ),
            ContentOfSetting(
              onTap: () => context.pushNamed(Routes.faQs),
              text: 'FAQ',
              imageAsset: 'assets/svgs/message-question.svg',
            ),
            ContentOfSetting(
              onTap: () => context.pushNamed(Routes.logIn),
              text: 'Logout',
              imageAsset: 'assets/svgs/logout.svg',
            ),
          ],
        ),
      ),
    );
  }
}
