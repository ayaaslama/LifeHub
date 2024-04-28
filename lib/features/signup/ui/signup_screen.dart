import 'package:blood_life/core/helper/feild_item.dart';
import 'package:blood_life/core/networking/crud.dart';
import 'package:blood_life/core/networking/links_api.dart';
import 'package:blood_life/core/routing/routes.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/widgets/app_clicked_text.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:blood_life/core/widgets/app_text_feild.dart';
import 'package:blood_life/features/login/ui/widgets/terms_and_condition.dart';
import 'package:blood_life/features/signup/ui/widgets/bank_selction.dart';
import 'package:blood_life/features/signup/ui/widgets/checked_box.dart';
import 'package:blood_life/features/signup/ui/widgets/city_selection_form.dart';
import 'package:blood_life/features/signup/ui/widgets/date_selection_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  Crud _crud = Crud();
  final TextEditingController userName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController nationalID = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController bloodBank = TextEditingController();
  final TextEditingController birthDate = TextEditingController();
  final TextEditingController gender = TextEditingController();
  void handleGenderChange(String value, bool isChecked) {
    if (isChecked) {
      gender.text = value;
    } else {
      gender.clear();
    }
    print('Gender: $value, Checked: $isChecked');
  }

  Future<void> _signup() async {
    var response = await _crud.postRequest(
      linkSignUp,
      ({
        "userName": userName.text,
        "email": email.text,
        "nationalID": nationalID.text,
        "phone": phone.text,
        "password": password.text,
        "city": city.text,
        "bloodBank": bloodBank.text,
        "birthDate": birthDate.text,
        "gender": gender.text,
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView(
            children: [
              Text(
                "Create Account",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: ManagerColor.mainred,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: const Color.fromARGB(255, 136, 136, 136),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 20.h,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    MyTextField(
                      item: FieldItem(
                        fieldName: 'User Name',
                        keyboardType: TextInputType.name,
                        myController: userName,
                      ),
                    ),
                    MyTextField(
                      item: FieldItem(
                        fieldName: 'Email',
                        myController: email,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    MyTextField(
                      item: FieldItem(
                        fieldName: 'Phone Number',
                        keyboardType: TextInputType.phone,
                        myController: phone,
                      ),
                    ),
                    MyTextField(
                      item: FieldItem(
                        fieldName: 'Password',
                        keyboardType: TextInputType.visiblePassword,
                        myController: password,
                      ),
                    ),
                    MyTextField(
                      item: FieldItem(
                        fieldName: 'National ID',
                        keyboardType: TextInputType.number,
                        myController: nationalID,
                      ),
                    ),
                    CitySelectionForm(
                      onCitySelected: (selectedCity) {
                        print('Selected City: $selectedCity');
                      },
                      cityController: city,
                    ),
                    BankSelectionForm(
                      onBankSelected: (selectedBank) {
                        print('Selected Bank: $selectedBank');
                      },
                      bankController: bloodBank,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    DateTextField(
                      labelText: 'Date Of Birth',
                      icon: Icons.date_range_rounded,
                      onDateSelected: (selectedDate) {
                        // Handle the selected date
                        print('Selected date: $selectedDate');
                      },
                      dateController: birthDate,
                    ),

                    // Add more MyTextField instances for other fields
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20.0),
                child: Container(
                  width: 327.w,
                  height: 55.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color.fromRGBO(217, 217, 217, 0.79),
                      width: 1.3,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "Gender",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      CheckBox(
                        left: 0,
                        value: 'male',
                        label: 'Male',
                        onGenderChanged: handleGenderChange,
                        style: const TextStyle(
                            color: Colors.black38,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      CheckBox(
                        left: 0,
                        value: 'female',
                        label: 'Female',
                        onGenderChanged: handleGenderChange,
                        style: const TextStyle(
                            color: Colors.black38,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              AppTextButton(
                textButton: "Sign Up",
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _signup();
                  }
                  //Navigator.pushNamed(context, '/otp_verifiction');
                  //Navigator.pushNamed(context, '/otp_verifiction');
                },
                formKey: _formKey,
                backgroundColor: ManagerColor.mainred,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 24.0),
                child: TermAndConditionText(),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don’t have an account?  ",
                        style: TextStyles.font14DarkBlackMedium),
                    const ClicKedText(
                      text: "Login Now",
                      routeName: Routes.logIn,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
