import 'package:blood_life/core/helper/extension.dart';
import 'package:blood_life/core/helper/feild_item.dart';
import 'package:blood_life/core/routing/routes.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:blood_life/core/widgets/app_text_feild.dart';
import 'package:blood_life/features/signup/ui/widgets/checked_box.dart';
import 'package:blood_life/features/signup/ui/widgets/date_selection_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WashedRcbs extends StatefulWidget {
  const WashedRcbs({super.key});

  @override
  State<WashedRcbs> createState() => _WashedRcbsState();
}

class _WashedRcbsState extends State<WashedRcbs> {
  TextEditingController date = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController selectHospital = TextEditingController();

  final TextEditingController selectDate = TextEditingController();

  final TextEditingController selectBloodType = TextEditingController();

  final TextEditingController sypeOfTest = TextEditingController();

  final TextEditingController nationalIdintity = TextEditingController();
  final TextEditingController type = TextEditingController();

  void handleTypeChange(String value, bool isChecked) {
    if (isChecked) {
      type.text = value;
    } else {
      type.clear();
    }
    print('Gender: $value, Checked: $isChecked');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ManagerColor.mainred,
        title: Text(
          'Washed Rbcs',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            context.pushReplacementNamed(Routes.additionalService);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Center(
                child: Text(
                  'Washed Rbcs',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: ManagerColor.maink7ly),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    MyTextField(
                      item: FieldItem(
                          fieldName: 'Select Hospital-Center',
                          useSuffixIcon: true,
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/images/detalies.png',
                                color: ManagerColor.mainred,
                              )),
                          myController: selectHospital),
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
                          useSuffixIcon: true,
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: Image.asset(
                                'assets/images/detalies.png',
                                color: ManagerColor.mainred,
                              )),
                          myController: selectBloodType),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Do you Have Blood Bag?',
                      style: TextStyles.font14mainK7lysemiBold,
                    ),
                    CheckBox(
                      left: 0,
                      value: 'yes',
                      label: 'Yes',
                      onGenderChanged: handleTypeChange,
                      style: const TextStyle(
                          color: ManagerColor.mainred,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      activeColor: ManagerColor.mainred,
                    ),
                    CheckBox(
                      left: 0,
                      value: 'no',
                      label: 'No',
                      onGenderChanged: handleTypeChange,
                      style: const TextStyle(
                          color: ManagerColor.mainred,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      activeColor: ManagerColor.mainred,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const Center(
                child: AppTextButton(
                  textButton: 'Book',
                  buttonWidth: 300,
                  backgroundColor: ManagerColor.mainred,
                ),
              )
            ])),
      ),
    );
  }
}
