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
import 'package:blood_life/features/verifiction/logic/cubit/cubit/email_verify_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class EmailForVerfiy extends StatelessWidget {
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
      ),
      body: BlocConsumer<EmailVerifyCubit, EmailVerifyState>(
        listener: (context, state) {
          if (state is EmailVerifyLoading) {
            isLoading = true;
          } else if (state is EmailVerifySuccess) {
            isLoading = false;
            context.pushNamed(Routes.code);
          } else if (state is EmailVerifyFailure) {
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            "assets/svgs/verify.svg",
                            height: 150.h,
                            width: 150.w,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            'We need to verifiy your details',
                            style: TextStyles.font22K7lybold,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "Enter your email below to receive your code for a complete register.",
                            style: TextStyles.font14GreyMedium,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          MyTextField(
                              item: FieldItem(
                            fieldName: 'Email ',
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
                        ],
                      ),
                    ),
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
                                BlocProvider.of<EmailVerifyCubit>(context)
                                    .verify(email: email!);
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
