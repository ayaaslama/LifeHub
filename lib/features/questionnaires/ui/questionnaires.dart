import 'package:blood_life/features/questionnaires/ui/listview_builder.dart';
import 'package:flutter/material.dart';
import 'package:blood_life/core/helper/extension.dart';
import 'package:blood_life/core/routing/routes.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:blood_life/core/widgets/snack_bar.dart';
<<<<<<< HEAD
import 'package:blood_life/features/questionnaires/ui/listview_builder.dart';
import 'package:flutter/material.dart';
=======
>>>>>>> 08125564f06ffe5cc47f87c2b5536e17bfe00e3b
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Questionnaires extends StatefulWidget {
  const Questionnaires({super.key});

  @override
  State<Questionnaires> createState() => _QuestionnairesState();
}

class _QuestionnairesState extends State<Questionnaires> {
  final TextEditingController accept = TextEditingController();
  final Questions testAnswer = Questions();

  void handleSubmit() {
    final answers = testAnswer.answers;
    final lastQuestionValue =
        answers!["In the last 3 months, have you had a vaccination?"];

    if (lastQuestionValue == 'yes') {
      showSnackBar(
        "Sorry, you cannot donate right now because the required time interval since your last donation has not yet passed. Please read the instructions in the settings for more information.",
        ManagerColor.mainred,
      );
    } else if (answers!.values.every((value) => value == 'no')) {
      context.pushNamed(Routes.donateBlood);
    } else {
      showSnackBar(
        "Please review the instructions again.",
        ManagerColor.mainred,
      );
    }
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
                "Fill up the following questionnaires and become a donor",
                style: TextStyles.font14mainK7lysemiBold,
              ),
              Questions(),
              Center(
                child: Text(
                  "By clicking, you agree to our terms and conditions",
                  style: TextStyles.font14mainK7lysemiBold,
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Center(
                child: AppTextButton(
                  textButton: 'Become a donor',
                  buttonWidth: 350.w,
                  buttonHeight: 55.h,
                  onPressed: handleSubmit,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
