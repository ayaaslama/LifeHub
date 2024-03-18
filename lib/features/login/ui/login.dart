import 'package:blood_life/core/helper/feild_item.dart';
import 'package:blood_life/core/networking/crud.dart';
import 'package:blood_life/core/networking/links_api.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/widgets/app_clicked_text.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:blood_life/core/widgets/app_text_feild.dart';
import 'package:blood_life/features/login/ui/widgets/terms_and_condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  // Crud _crud = Crud();
  // Future<void> _login() async {
  //   var response = await _crud.postRequest(
  //       linkLogIn,
  //       ({
  //         "email": email.text,
  //         "password": password.text,
  //       }), (bool success) {
  //     if (success) {
  //       print("User Login successfully");
  //       Navigator.pushNamed(context, '/home');
  //     } else {
  //       print("LogIn Fail");
  //     }
  //   });
  //   if (response != null && response.statusCode == 200) {
  //     Navigator.pushNamed(context, '/home');
  //   }
  // }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: double.infinity,
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 34),
                  child:
                      Text("Welcome Back", style: TextStyles.font24mainRedbold),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: const Color.fromARGB(255, 136, 136, 136),
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      MyTextField(
                        item: FieldItem(
                          fieldName: 'Email',
                          formKey: _formKey,
                          useicon: true,
                          icon: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress,
                          myController: email,
                        ),
                      ),
                      MyTextField(
                        item: FieldItem(
                          fieldName: 'Password',
                          myController: password,
                          formKey: _formKey,
                          useSuffixIcon: true,
                          icon: Icons.lock_outlined,
                          useicon: true,
                          obscureText: _obscureText,
                          keyboardType: TextInputType.visiblePassword,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 230, top: 20),
                  child: ClicKedText(
                    text: "Forget Password?",
                    onPressed: '/forget_password',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: AppTextButton(
                    textButton: "Login",
                    buttonWidth: 327.w,
                    buttonHeight: 52.h,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushNamed(context, '/home');
                      }
                    },
                    formKey: _formKey,
                    backgroundColor: ManagerColor.mainred,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 24.0),
                  child: TermAndConditionText(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don’t have an account?  ",
                          style: TextStyles.font14DarkBlackMedium),
                      const ClicKedText(
                        text: "Register Now",
                        onPressed: '/signup',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
