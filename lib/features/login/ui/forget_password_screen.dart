import 'package:blood_life/core/helper/feild_item.dart';
import 'package:blood_life/core/networking/crud.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:blood_life/core/widgets/app_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  String userInput = '';
  final _formKey = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();

  // Crud _crud = Crud();

  // Future<void> _forget() async {
  //   var response = await _crud.postRequest(
  //       "https://3a51-156-203-190-131.ngrok-free.app/api/Users/forgot-password?email=$userInput",
  //       ({
  //         "email": email.text,
  //       }), (bool success) {
  //     if (success) {
  //       print("Done successfully");
  //       Navigator.pushNamed(context, '/reset-password');
  //     } else {
  //       print("Fail");
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 59),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forgot Password',
                style: TextStyles.font24mainRedbold,
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "At our app, we take the security of your\n information seriously.",
                style: TextStyles.font16GreyRegular,
              ),
              SizedBox(
                height: 15.h,
              ),
              MyTextField(
                  item: FieldItem(
                fieldName: 'Email',
                formKey: _formKey,
                keyboardType: TextInputType.emailAddress,
                myController: email,
              )),
              Padding(
                padding: const EdgeInsets.only(top: 480),
                child: AppTextButton(
                  textButton: "Reset Password",
                  buttonWidth: 327.w,
                  buttonHeight: 52.h,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushNamed(context, '/reset-password');
                      //_forget();
                    }
                  },
                  formKey: _formKey,
                  backgroundColor: ManagerColor.mainred,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
