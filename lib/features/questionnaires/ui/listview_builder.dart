import 'package:flutter/material.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/features/signup/ui/widgets/checked_box.dart';
<<<<<<< HEAD
import 'package:flutter/material.dart';
=======
>>>>>>> 08125564f06ffe5cc47f87c2b5536e17bfe00e3b

class Questions extends StatefulWidget {
  final Map<String, String>? answers = {};
  @override
  State<Questions> createState() => QuestionsState();
}

class QuestionsState extends State<Questions> {
  void handleQuestionChange(String question, String value, bool isChecked) {
    setState(() {
      if (isChecked) {
        widget.answers![question] = value;
      } else {
        widget.answers!.remove(question);
      }
    });
    print('Question: $question, Checked: $isChecked, Value: $value');
    // print('Current answers: $answers');
  }

  final List<Map<String, String>> data = [
    {
      'Questions': "Do you have diabetes?",
    },
    {
      'Questions': "Have you ever had problems with your heart or lungs?",
    },
    {
      'Questions': "In the last 28 days, have you had COVID-19?",
    },
    {
      'Questions': "Have you ever had a positive test for the HIV/AIDS virus?",
    },
    {
      'Questions': "Have you ever had Cancer?",
    },
    {
      'Questions': "In the last 3 months, have you had a vaccination?",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 10),
        itemCount: data.length,
        itemBuilder: (context, i) {
          String question = data[i]['Questions']!;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              width: 320,
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
                    Text(question, style: TextStyles.font14mainK7lyMedium),
                    Row(
                      children: [
                        CheckBox(
                          left: 0,
                          value: 'yes',
                          label: 'Yes',
                          onGenderChanged: (value, isChecked) =>
                              handleQuestionChange(question, value, isChecked),
                          style: const TextStyle(
                              color: ManagerColor.maink7ly,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        CheckBox(
                          left: 0,
                          value: 'no',
                          label: 'No',
                          onGenderChanged: (value, isChecked) =>
                              handleQuestionChange(question, value, isChecked),
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
            ),
          );
        },
      ),
    );
  }
}
