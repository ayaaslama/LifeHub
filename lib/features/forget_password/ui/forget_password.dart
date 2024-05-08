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
import 'package:blood_life/features/forget_password/logic/cubit/forgetpassword_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EmailForForgetPassword extends StatelessWidget {
  String? email;
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  FocusNode emailFocuNode = FocusNode();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            context.pushReplacementNamed(Routes.logIn);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
          color: ManagerColor.maink7ly,
        ),
      ),
      body: BlocConsumer<ForgetpasswordCubit, ForgetpasswordState>(
        listener: (context, state) {
          if ((state is ForgetPasswordLoading)) {
            isLoading = true;
          } else if (state is ForgetPasswordSuccess) {
            isLoading = false;
            context.pushNamed(Routes.newPassword);
          } else if (state is ForgetPasswordFailure) {
            isLoading = false;
            showSnackBar("Something Went Wrong", ManagerColor.mainred);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        'Forget Password?',
                        style: TextStyles.font22K7lybold,
                      ),
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
                    MyTextField(
                        item: FieldItem(
                      fieldName: 'Email Address',
                      focusNode: emailFocuNode,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.emailAddress,
                      onSave: (data) {
                        email = data;
                      },
                      validator: (value) {
                        return Validator.validateEmail(value);
                      },
                    )),
                    SizedBox(
                      height: 20.h,
                    ),
                    isLoading
                        ? const LoadingButton()
                        : AppTextButton(
                            textButton: "Confirm Mail",
                            buttonWidth: 327.w,
                            buttonHeight: 52.h,
                            backgroundColor: ManagerColor.mainred,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                BlocProvider.of<ForgetpasswordCubit>(context)
                                    .forgetPassword(email: email!);
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
