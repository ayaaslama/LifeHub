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

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  String userInput = '';
  final _formKey = GlobalKey<FormState>();

  final TextEditingController token = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController confirm = TextEditingController();
  Crud _crud = Crud();

  Future<void> _chagnePass() async {
    var response = await _crud.postRequest(
        "$linkServerName/reset-password",
        ({
          "token": token.text,
          "password": pass.text,
          "confirmPassword": confirm.text,
        }), (bool success) {
      if (success) {
        print("Done successfully");
        Navigator.pushNamed(context, '/login');
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
                text: 'New Password',
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
                    Text(
                      'New password',
                      style: TextStyles.font22K7lybold,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'Pleasw write new password',
                      style: TextStyles.font14GreyMedium,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Form(
                      key: _formKey,
                      child: MyTextField(
                          item: FieldItem(
                        fieldName: 'Password',
                        keyboardType: TextInputType.emailAddress,
                        myController: pass,
                      )),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Form(
                      key: _formKey,
                      child: MyTextField(
                          item: FieldItem(
                        fieldName: 'Confirm Password',
                        keyboardType: TextInputType.emailAddress,
                        myController: confirm,
                      )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              AppTextButton(
                textButton: "Confirm Password",
                buttonWidth: 327.w,
                buttonHeight: 52.h,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _chagnePass();
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
