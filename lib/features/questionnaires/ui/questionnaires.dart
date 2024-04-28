import 'package:blood_life/core/helper/extension.dart';
import 'package:blood_life/core/routing/routes.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:blood_life/features/questionnaires/ui/listview_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Questionnaires extends StatefulWidget {
  const Questionnaires({super.key});

  @override
  State<Questionnaires> createState() => _QuestionnairesState();
}

class _QuestionnairesState extends State<Questionnaires> {
  final TextEditingController accept = TextEditingController();

  void handleGenderChange(String value, bool isChecked) {
    if (isChecked) {
      accept.text = value;
    } else {
      accept.clear();
    }
    print('Gender: $value, Checked: $isChecked');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ManagerColor.mainred,
        title: Text(
          'Questionnaires',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            context.pushReplacementNamed(Routes.myNavigationBar);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Fill up the following questionnaries and become a doner",
                style: TextStyles.font14mainK7lysemiBold,
              ),
              const Questions(),
              Center(
                child: Text(
                  "By clicking,you agree to our terms and condition",
                  style: TextStyles.font14mainK7lysemiBold,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Center(
                  child: AppTextButton(
                textButton: 'Become a doner',
                buttonWidth: 350.w,
                buttonHeight: 55.h,
                onPressed: () => context.pushNamed(Routes.donateBlood),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
