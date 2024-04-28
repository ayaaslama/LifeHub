import 'package:blood_life/core/helper/extension.dart';
import 'package:blood_life/core/helper/feild_item.dart';
import 'package:blood_life/core/routing/routes.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/vaildator/validator.dart';
import 'package:blood_life/core/widgets/app_clicked_text.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:blood_life/core/widgets/app_text_feild.dart';
import 'package:blood_life/core/widgets/snack_bar.dart';
import 'package:blood_life/features/login/logic/cubit/login_cubit.dart';
import 'package:blood_life/features/login/ui/widgets/terms_and_condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LogIn extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  String? email, password;

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            isLoading = true;
          } else if (state is LoginSuccess) {
            context.pushNamed(Routes.home);
            isLoading = false;
          } else if (state is LoginFailure) {
            showSnackBar("Something Went Wrong", ManagerColor.mainred);
            isLoading = false;
          }
        },
        builder: (context, state) => ModalProgressHUD(
          inAsyncCall: isLoading,
          child: Container(
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
                      child: Text("Welcome Back",
                          style: TextStyles.font24mainRedbold),
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
                      autovalidateMode: autoValidateMode,
                      key: _formKey,
                      child: Column(
                        children: [
                          MyTextField(
                            item: FieldItem(
                              fieldName: 'Email',
                              validator: (value) {
                                return Validator.validateEmail(value);
                              },
                              onSave: (data) {
                                email = data;
                              },
                              useicon: true,
                              icon: Icons.email_outlined,
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          MyTextField(
                            item: FieldItem(
                              fieldName: 'Password',
                              validator: (value) {
                                return Validator.validatePassword(value);
                              },
                              onSave: (data) {
                                password = data;
                              },
                              useSuffixIcon: true,
                              icon: Icons.lock_outlined,
                              useicon: true,
                              //obscureText: _obscureText,
                              keyboardType: TextInputType.visiblePassword,
                              // suffixIcon: IconButton(
                              //   icon: Icon(
                              //     _obscureText
                              //         ? Icons.visibility
                              //         : Icons.visibility_off,
                              //   ),
                              //   onPressed: () {
                              //     setState(() {
                              //       _obscureText = !_obscureText;
                              //     });
                              //   },
                              // ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 230, top: 20),
                      child: ClicKedText(
                        text: "Forget Password?",
                        routeName: Routes.forgetPassword,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: AppTextButton(
                        textButton: "Login",
                        buttonWidth: 327.w,
                        buttonHeight: 52.h,
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<LoginCubit>(context)
                                .login(email: email!, password: password!);
                          } else {}
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
                            routeName: Routes.signUp,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
