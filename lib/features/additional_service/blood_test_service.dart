import 'package:blood_life/core/helper/feild_item.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/widgets/app_bar.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:blood_life/core/widgets/app_text_feild.dart';
import 'package:blood_life/features/signup/ui/widgets/date_selection_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BloodTest extends StatefulWidget {
  const BloodTest({super.key});

  @override
  State<BloodTest> createState() => _BloodTestState();
}

class _BloodTestState extends State<BloodTest> {
  TextEditingController date = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController selectHospital = TextEditingController();

  final TextEditingController selectDate = TextEditingController();

  final TextEditingController selectBloodType = TextEditingController();
  final TextEditingController sypeOfTest = TextEditingController();
  final TextEditingController nationalIdintity = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomeAppBar(
              text: "Blood Tests",
              iconColor: Colors.white,
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text(
                          'Blood Tests',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: ManagerColor.maink7ly),
                        ),
                      ),
                      MyTextField(
                        item: FieldItem(
                            fieldName: 'Select Hospital-Center',
                            formKey: _formKey,
                            useSuffixIcon: true,
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  'assets/images/detalies.png',
                                  color: ManagerColor.mainred,
                                )),
                            myController: selectHospital),
                      ),
                      MyTextField(
                        item: FieldItem(
                            fieldName: 'Type of Test ',
                            formKey: _formKey,
                            useSuffixIcon: true,
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  'assets/images/detalies.png',
                                  color: ManagerColor.mainred,
                                )),
                            myController: sypeOfTest),
                      ),
                      DateTextField(
                        labelText: 'when you need it',
                        icon: Icons.date_range,
                        onDateSelected: (selectedDate) {
                          // Handle the selected date
                          print('Selected date: $selectedDate');
                        },
                        dateController: selectDate,
                      ),
                      MyTextField(
                        item: FieldItem(
                            fieldName: 'Select blood-Type',
                            formKey: _formKey,
                            useSuffixIcon: true,
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  'assets/images/detalies.png',
                                  color: ManagerColor.mainred,
                                )),
                            myController: selectBloodType),
                      ),
                      MyTextField(
                        item: FieldItem(
                            fieldName: 'National identity card',
                            formKey: _formKey,
                            useSuffixIcon: true,
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                  'assets/images/National.png',
                                  color: ManagerColor.mainred,
                                )),
                            myController: nationalIdintity),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      const Center(
                        child: AppTextButton(
                          textButton: 'Book',
                          buttonWidth: 300,
                          backgroundColor: ManagerColor.mainred,
                        ),
                      )
                    ])),
          ],
        ),
      ),
    );
  }
}
