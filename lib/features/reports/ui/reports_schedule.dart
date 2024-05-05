import 'package:blood_life/core/helper/extension.dart';
import 'package:blood_life/core/routing/routes.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/widgets/app_bar.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:blood_life/features/reports/ui/widgets/listview_builder_for_reports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReportsSchedule extends StatelessWidget {
  const ReportsSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pushNamed(Routes.myNavigationBar);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
          color: Colors.white,
        ),
        elevation: 0,
        backgroundColor: ManagerColor.mainred,
        centerTitle: true,
        title: Text(
          'Reports Schedule',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Reports(),
                  SizedBox(
                    height: 17.h,
                  ),
                  Center(
                    child: AppTextButton(
                      textButton: "OPEN AI",
                      buttonWidth: 300.w,
                      buttonHeight: 59.h,
                      onPressed: () =>
                          Navigator.pushNamed(context, "/ai_generator"),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
