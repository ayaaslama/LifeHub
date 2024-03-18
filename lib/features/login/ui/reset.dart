import 'package:blood_life/core/helper/feild_item.dart';
import 'package:blood_life/core/networking/crud.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:blood_life/core/widgets/app_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({Key? key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  String userInput = '';
  final _formKey = GlobalKey<FormState>();

  final TextEditingController token = TextEditingController();
  final TextEditingController pass = TextEditingController();
  final TextEditingController confirm = TextEditingController();
  // Crud _crud = Crud();

  // Future<void> _reset() async {
  //   var response = await _crud.postRequest(
  //       "https://3a51-156-203-190-131.ngrok-free.app/api/Users/reset-password",
  //       ({
  //         "token": token.text,
  //         "password": pass.text,
  //         "confirmPassword": confirm.text,
  //       }), (bool success) {
  //     if (success) {
  //       print("Done successfully");
  //       Navigator.pushNamed(context, '/login');
  //     } else {
  //       print("Fail");
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Health Hub",
                  style: TextStyle(
                    color: Color.fromRGBO(234, 68, 68, 1),
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 20, top: 20),
                  child: Divider(),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Enter code and new password",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      MyTextField(
                        item: FieldItem(
                          fieldName: 'Enter Code',
                          keyboardType: TextInputType.emailAddress,
                          myController: token,
                          onChanged: (value) {
                            setState(() {
                              userInput = value;
                            });
                          },
                        ),
                      ),
                      MyTextField(
                        item: FieldItem(
                          fieldName: 'Enter New Password',
                          keyboardType: TextInputType.emailAddress,
                          myController: pass,
                          onChanged: (value) {
                            setState(() {
                              userInput = value;
                            });
                          },
                        ),
                      ),
                      MyTextField(
                        item: FieldItem(
                          fieldName: 'Confirm New Password',
                          keyboardType: TextInputType.emailAddress,
                          myController: confirm,
                          onChanged: (value) {
                            setState(() {
                              userInput = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: AppTextButton(
                    textButton: "Reset Password",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        //_reset();
                        Navigator.pushNamed(context, '/login');
                      }
                    },
                    backgroundColor: const Color.fromRGBO(234, 68, 68, 1),
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(height: 20.h),
                AppTextButton(
                  textButton: "Back to log in",
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  backgroundColor: Colors.white,
                  textColor: Colors.red,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
