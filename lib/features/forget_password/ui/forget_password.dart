import 'package:blood_life/core/helper/feild_item.dart';
import 'package:blood_life/core/networking/crud.dart';
import 'package:blood_life/core/networking/links_api.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/widgets/app_bar.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:blood_life/core/widgets/app_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EmailForForgetPassword extends StatefulWidget {
  const EmailForForgetPassword({super.key});

  @override
  State<EmailForForgetPassword> createState() => _EmailForForgetPasswordState();
}

class _EmailForForgetPasswordState extends State<EmailForForgetPassword> {
  String userInput = '';
  final _formKey = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();

  Crud _crud = Crud();

  Future<void> _forget() async {
    var response = await _crud.postRequest(
        "$linkServerName/forgot-password?email=$userInput",
        ({
          "email": email.text,
        }), (bool success) {
      if (success) {
        print("Done successfully");
        Navigator.pushNamed(context, '/forget-password');
      } else {
        print("Fail");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 20, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomeAppBar(
                text: 'Forgot Password',
                titleColor: ManagerColor.maink7ly,
                color: Colors.white,
                textStyle: TextStyles.font14mainK7lysemiBold,
              ),
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 120),
                      child: SvgPicture.asset(
                        "assets/svgs/forget_password.svg",
                        height: 150.h,
                        width: 150.w,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      'Forget Password?',
                      style: TextStyles.font22K7lybold,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Please Write your email to receive a confirmation code to set a new password.",
                      style: TextStyles.font14GreyMedium,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Form(
                      key: _formKey,
                      child: MyTextField(
                          item: FieldItem(
                        fieldName: 'Email Address',
                        keyboardType: TextInputType.emailAddress,
                        myController: email,
                      )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              AppTextButton(
                textButton: "Confirm Mail",
                buttonWidth: 327.w,
                buttonHeight: 52.h,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _forget();
                  }
                },
                formKey: _formKey,
                backgroundColor: ManagerColor.mainred,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
