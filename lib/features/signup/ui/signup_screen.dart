import 'package:blood_life/core/helper/extension.dart';
import 'package:blood_life/core/helper/feild_item.dart';
import 'package:blood_life/core/routing/routes.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/vaildator/validator.dart';
import 'package:blood_life/core/widgets/app_clicked_text.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:blood_life/core/widgets/app_text_feild.dart';
import 'package:blood_life/core/widgets/loading.dart';
import 'package:blood_life/core/widgets/snack_bar.dart';
import 'package:blood_life/core/widgets/termsAnd_condition.dart';
import 'package:blood_life/features/signup/logic/cubit/signup_cubit.dart';
import 'package:blood_life/features/signup/ui/widgets/bank_selction.dart';
import 'package:blood_life/features/signup/ui/widgets/checked_box.dart';
import 'package:blood_life/features/signup/ui/widgets/city_selection_form.dart';
import 'package:blood_life/features/signup/ui/widgets/date_selection_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController city = TextEditingController();
  final TextEditingController bloodBank = TextEditingController();
  final TextEditingController birthDate = TextEditingController();
  String? email, userName, nationalID, phone, password, gender;
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  FocusNode emailFocusNode = FocusNode();
  FocusNode userNameFocusNode = FocusNode();
  FocusNode nationalIDFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode cityFocusNode = FocusNode();
  FocusNode bloodBankFocusNode = FocusNode();
  FocusNode birthDateFocusNode = FocusNode();
  FocusNode genderFocusNode = FocusNode();
  bool isLoading = false;

  void handleGenderChange(String value, bool isChecked) {
    if (isChecked) {
      gender = value;
    } else {
      gender;
    }
    print('Gender: $value, Checked: $isChecked');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<SignupCubit, SignupState>(
        listener: (context, state) {
          if (state is SignupLoading) {
            isLoading = true;
          } else if (state is SignupSuccess) {
            isLoading = false;
            context.pushNamed(Routes.emailVerify);
          } else if (state is SignupFailure) {
            isLoading = false;
            showSnackBar("Something Went Wrong", ManagerColor.mainred);
          }
        },
        builder: (context, state) {
          return Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: ListView(
                children: [
                  Text("Create Account",
                      textAlign: TextAlign.start,
                      style: TextStyles.font22mainRedbold),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                      "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                      textAlign: TextAlign.start,
                      style: TextStyles.font14GreyMedium),
                  SizedBox(
                    height: 10.h,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        MyTextField(
                          item: FieldItem(
                            fieldName: 'User Name',
                            focusNode: userNameFocusNode,
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () {
                              FocusScope.of(context)
                                  .requestFocus(emailFocusNode);
                            },
                            validator: (value) {
                              return Validator.validateName(value);
                            },
                            onSave: (data) {
                              userName = data;
                            },
                            keyboardType: TextInputType.name,
                          ),
                        ),
                        MyTextField(
                          item: FieldItem(
                            fieldName: 'Email',
                            focusNode: emailFocusNode,
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () {
                              FocusScope.of(context)
                                  .requestFocus(phoneFocusNode);
                            },
                            validator: (value) {
                              return Validator.validateEmail(value);
                            },
                            onSave: (data) {
                              email = data;
                            },
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        MyTextField(
                          item: FieldItem(
                            fieldName: 'Phone Number',
                            focusNode: phoneFocusNode,
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () {
                              FocusScope.of(context)
                                  .requestFocus(passwordFocusNode);
                            },
                            validator: (value) {
                              return Validator.validatePhone(value);
                            },
                            onSave: (data) {
                              phone = data;
                            },
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                        MyTextField(
                          item: FieldItem(
                            fieldName: 'Password',
                            focusNode: passwordFocusNode,
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () {
                              FocusScope.of(context)
                                  .requestFocus(nationalIDFocusNode);
                            },
                            validator: (value) {
                              return Validator.validatePassword(value);
                            },
                            onSave: (data) {
                              password = data;
                            },
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        ),
                        MyTextField(
                          item: FieldItem(
                            fieldName: 'National ID',
                            focusNode: nationalIDFocusNode,
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () {
                              FocusScope.of(context)
                                  .requestFocus(cityFocusNode);
                            },
                            validator: (value) {
                              return Validator.validateAnotherField(value);
                            },
                            onSave: (data) {
                              nationalID = data;
                            },
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        CitySelectionForm(
                          onCitySelected: (selectedCity) {
                            print('Selected City: $selectedCity');
                          },
                          cityController: city,
                          textInputAction: TextInputAction.next,
                          focusNode: cityFocusNode,
                          onEditingComplete: () {
                            FocusScope.of(context)
                                .requestFocus(bloodBankFocusNode);
                          },
                          validator: (value) {
                            return Validator.validateName(value);
                          },
                        ),
                        BankSelectionForm(
                          onBankSelected: (selectedBank) {
                            print('Selected Bank: $selectedBank');
                          },
                          textInputAction: TextInputAction.next,
                          focusNode: bloodBankFocusNode,
                          onEditingComplete: () {
                            FocusScope.of(context)
                                .requestFocus(birthDateFocusNode);
                          },
                          validator: (value) {
                            return Validator.validateName(value);
                          },
                          bankController: bloodBank,
                        ),
                        DateTextField(
                          dateController: birthDate,
                          labelText: 'Date Of Birth',
                          focusNode: birthDateFocusNode,
                          textInputAction: TextInputAction.done,
                          validator: (value) {
                            return Validator.validateAnotherField(value);
                          },
                          icon: Icons.date_range_rounded,
                          onDateSelected: (selectedDate) {
                            print('Selected date: $selectedDate');
                          },
                        ),
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
                  isLoading
                      ? const LoadingButton()
                      : AppTextButton(
                          textButton: "Sign Up",
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              BlocProvider.of<SignupCubit>(context).signUp(
                                  userName: userName!,
                                  email: email!,
                                  nationalID: nationalID!,
                                  phone: phone!,
                                  password: password!,
                                  city: city.text,
                                  bloodBank: bloodBank.text,
                                  birthDate: birthDate.text,
                                  gender: gender!);
                            }
                          },
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
          );
        },
      ),
    );
  }
}
