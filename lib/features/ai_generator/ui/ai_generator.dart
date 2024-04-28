import 'package:blood_life/core/helper/extension.dart';
import 'package:blood_life/core/routing/routes.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AiGenerator extends StatelessWidget {
  const AiGenerator({super.key});

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
          'AI Generator',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
        child: Column(
          children: [
            Text(
              "Please,upload her your file you would to check them",
              style: TextStyles.font16GreysemiBold,
            ),
            SizedBox(
              height: 30.h,
            ),
            Center(
              child: AppTextButton(
                textButton: "Upload File",
                buttonWidth: 300.w,
                buttonHeight: 59.h,
                onPressed: () => Navigator.pushNamed(context, "/ai_generator"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
