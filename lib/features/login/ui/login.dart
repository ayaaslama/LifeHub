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
import 'package:blood_life/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Login extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? email, password;
  bool isLoading = false;
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final secureStorage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginLoading) {
            isLoading = true;
          } else if (state is LoginSuccess) {
            isLoading = false;
            context.pushNamed(Routes.myNavigationBar);
          } else if (state is LoginFailure) {
            showSnackBar("Something Went Wrong", ManagerColor.mainred);
            isLoading = false;
          }
        },
        builder: (context, state) => Container(
          color: Colors.white,
          height: double.infinity,
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 34),
                    child: Text("Welcome Back",
                        style: TextStyles.font22mainRedbold),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                      "We're excited to have you back, can't wait to see what you've been up to since you last logged in",
                      textAlign: TextAlign.start,
                      style: TextStyles.font14GreyMedium),
                  SizedBox(
                    height: 10.h,
                  ),
                  Form(
                    autovalidateMode: autoValidateMode,
                    key: formKey,
                    child: Column(
                      children: [
                        MyTextField(
                          item: FieldItem(
                            fieldName: 'Email',
                            focusNode: emailFocusNode,
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () {
                              FocusScope.of(context)
                                  .requestFocus(emailFocusNode);
                            },
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
                            focusNode: passwordFocusNode,
                            textInputAction: TextInputAction.done,
                            onEditingComplete: () {
                              FocusScope.of(context)
                                  .requestFocus(passwordFocusNode);
                            },
                            onSave: (data) {
                              password = data;
                            },
                            useSuffixIcon: true,
                            icon: Icons.lock_outlined,
                            useicon: true,
                            keyboardType: TextInputType.visiblePassword,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 240, top: 10),
                    child: ClicKedText(
                      text: "Forget Password?",
                      routeName: Routes.forgetPassword,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: isLoading
                        ? const LoadingButton()
                        : AppTextButton(
                            textButton: "Login",
                            buttonWidth: 327.w,
                            buttonHeight: 52.h,
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();

                                BlocProvider.of<LoginCubit>(context)
                                    .login(email: email!, password: password!);
                                await secureStorage.write(
                                    key: 'email', value: email!);
                              }
                            },
                            formKey: formKey,
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
    );
  }
}
