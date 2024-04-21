import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/widgets/app_bar.dart';
import 'package:blood_life/features/Schedule/ui/widgets/listview_builder_for_finished.dart';
import 'package:blood_life/features/Schedule/ui/widgets/listview_builder_for_waiting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Schedule extends StatelessWidget {
  const Schedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomeAppBar(
            text: 'Blood Donation Schedule',
            color: ManagerColor.mainred,
            iconColor: Colors.white,
            titleColor: Colors.white,
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Finished',
                  style: TextStyles.font18K7lybold,
                ),
                const FinishedBlood(),
                Text(
                  'Waiting..',
                  style: TextStyles.font18K7lybold,
                ),
                const Waiting(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
