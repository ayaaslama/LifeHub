import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/features/Schedule/ui/schedule.dart';
import 'package:blood_life/features/ai_generator/ui/ai_generator.dart';
import 'package:blood_life/features/home/ui/home_screen.dart';
import 'package:blood_life/features/profile/profile_screen.dart';
import 'package:blood_life/features/rewards/rewards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int selectedIndex = 0;
  List<Widget> widgetPage = [
    const HomePage(),
    const AiGenerator(),
    const RewardsScreen(),
    const Schedule(),
    const ProfileSreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: ManagerColor.mainred,
        unselectedItemColor: ManagerColor.maink7ly,
        iconSize: 28,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Image(
                image: const AssetImage("assets/images/robot.png"),
                width: 28.w,
                height: 28.h,
                color: ManagerColor.maink7ly,
              ),
              label: 'AI'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard_outlined), label: 'Rewards'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.event_note_outlined), label: 'Schedule'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: 'Profile'),
        ],
      ),
      body: widgetPage.elementAt(selectedIndex),
    );
  }
}
