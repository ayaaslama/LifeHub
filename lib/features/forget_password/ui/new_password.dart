import 'package:blood_life/core/helper/extension.dart';
import 'package:blood_life/core/helper/feild_item.dart';
import 'package:blood_life/core/routing/routes.dart';
import 'package:blood_life/core/theaming/color.dart';
import 'package:blood_life/core/theaming/stlye.dart';
import 'package:blood_life/core/vaildator/validator.dart';
import 'package:blood_life/core/widgets/app_text_button.dart';
import 'package:blood_life/core/widgets/app_text_feild.dart';
import 'package:blood_life/core/widgets/loading.dart';
import 'package:blood_life/core/widgets/snack_bar.dart';
import 'package:blood_life/features/forget_password/logic/cubit/new_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NewPassword extends StatelessWidget {
  String? token, password, confirmPassword;
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  FocusNode tokenFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            context.pushReplacementNamed(Routes.forgetPassword);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
          color: ManagerColor.maink7ly,
        ),
      ),
      body: BlocConsumer<NewPasswordCubit, NewPasswordState>(
        listener: (context, state) {
          if (state is NewPasswordLoading) {
            isLoading = true;
          } else if (state is NewPasswordSuccess) {
            isLoading = false;
            context.pushNamed(Routes.myNavigationBar);
          } else if (state is NewPasswordFailure) {
            isLoading = false;
            showSnackBar("Something Went Wrong", ManagerColor.mainred);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: Form(
                key: formKey,
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
                    Center(
                      child: Text(
                        'New Password!',
                        style: TextStyles.font22K7lybold,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Please enter  the code that recived inbox, then enter new password. ",
                      style: TextStyles.font14GreyMedium,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    MyTextField(
                      item: FieldItem(
                        fieldName: 'Code',
                        focusNode: tokenFocusNode,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () {
                          FocusScope.of(context)
                              .requestFocus(passwordFocusNode);
                        },
                        validator: (value) {
                          return Validator.validateAnotherField(value);
                        },
                        onSave: (data) {
                          token = data;
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    MyTextField(
                      item: FieldItem(
                        fieldName: 'Password',
                        focusNode: passwordFocusNode,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: () {
                          FocusScope.of(context)
                              .requestFocus(confirmPasswordFocusNode);
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
                        fieldName: 'Confirm Password',
                        focusNode: confirmPasswordFocusNode,
                        textInputAction: TextInputAction.done,
                        validator: (value) {
                          return Validator.validateAnotherField(value);
                        },
                        onSave: (data) {
                          confirmPassword = data;
                        },
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    isLoading
                        ? const LoadingButton()
                        : AppTextButton(
                            textButton: "Submit",
                            buttonWidth: 327.w,
                            buttonHeight: 52.h,
                            backgroundColor: ManagerColor.mainred,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                BlocProvider.of<NewPasswordCubit>(context)
                                    .changePass(
                                        token: token!,
                                        password: password!,
                                        confirmPassword: confirmPassword!);
                              } else {
                                autoValidateMode = AutovalidateMode.always;
                              }
                            },
                          ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
