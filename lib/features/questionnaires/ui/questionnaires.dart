import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:blood_life/features/questionnaires/ui/listview_builder.dart';
import 'package:blood_life/features/signup/ui/widgets/checked_box.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 50.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Questionnaires",
                style: TextStyles.font20K7lybold,
              ),
              SizedBox(
                height: 7.h,
              ),
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
                onPressed: () => Navigator.pushNamed(context, "/donate_blood"),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
