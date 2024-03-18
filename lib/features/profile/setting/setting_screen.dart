import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/widgets/app_bar.dart';
import 'package:blood_life/features/profile/setting/widgets/content_of_setting_container.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            CustomeAppBar(
              text: "Setting",
              iconColor: ManagerColor.maink7ly,
              titleColor: ManagerColor.maink7ly,
              color: Colors.white,
            ),
            const ContentOfSetting(
              text: 'Notification',
              imageAsset: 'assets/svgs/notification.svg',
            ),
            const ContentOfSetting(
              text: 'FAQ',
              imageAsset: 'assets/svgs/message-question.svg',
            ),
            const ContentOfSetting(
              text: 'Logout',
              imageAsset: 'assets/svgs/logout.svg',
            ),
          ],
        ),
      ),
    );
  }
}
