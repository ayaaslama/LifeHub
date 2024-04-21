import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/features/signup/ui/widgets/checked_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  final TextEditingController answer = TextEditingController();

  void handleGenderChange(String value, bool isChecked) {
    if (isChecked) {
      answer.text = value;
    } else {
      answer.clear();
    }
    print('Gender: $value, Checked: $isChecked');
  }

  List data = [
    {
      'Questions': "Do you have diabetes?",
    },
    {
      'Questions': "Have you ever had problems with your heart or lungs?",
    },
    {
      'Questions': "in the last 28 days do have you had COVID-19?",
    },
    {
      'Questions': "Have you ever had positive test for the HIV/AIDS virus?",
    },
    {
      'Questions': "Have you ever had Cancer?",
    },
    {
      'Questions': "in the last 3 months have you had a vaconation?",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 10.h),
          itemCount: data.length,
          itemBuilder: (context, i) {
            return Padding(
                padding: EdgeInsets.symmetric(vertical: 10.w),
                child: Container(
                  width: 320.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(
                      color: ManagerColor.maink7ly,
                      width: 1,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${data[i]['Questions']}",
                          style: TextStyles.font14mainK7lyMedium,
                        ),
                        Row(
                          children: [
                            CheckBox(
                              left: 0,
                              value: 'yes',
                              label: 'Yes',
                              onGenderChanged: handleGenderChange,
                              style: const TextStyle(
                                  color: ManagerColor.maink7ly,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            CheckBox(
                              left: 0,
                              value: 'no',
                              label: 'No',
                              onGenderChanged: handleGenderChange,
                              style: const TextStyle(
                                  color: ManagerColor.maink7ly,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ));
          }),
    );
  }
}
