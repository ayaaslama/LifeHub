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
import 'package:blood_life/features/verifiction/logic/cubit/cubit/code_verify_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CodeForVerfiy extends StatelessWidget {
  String? code;
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
            context.pushReplacementNamed(Routes.emailVerify);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
          color: ManagerColor.maink7ly,
        ),
      ),
      body: BlocConsumer<CodeVerifyCubit, CodeVerifyState>(
        listener: (context, state) {
          if (state is CodeVerifyLoading) {
            isLoading = true;
          } else if (state is CodeVerifySuccess) {
            isLoading = false;
            context.pushNamed(Routes.home);
          } else if (state is CodeVerifyFailure) {
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
                            'Code recived!',
                            style: TextStyles.font22K7lybold,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            "The code will be expire in 10 minutes!",
                            style: TextStyles.font14GreyMedium,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          MyTextField(
                              item: FieldItem(
                            fieldName: 'Code',
                            focusNode: emailFocuNode,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.emailAddress,
                            onSave: (data) {
                              code = data;
                            },
                            validator: (value) {
                              return Validator.validateAnotherField(value);
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
                            textButton: "verify Code",
                            buttonWidth: 327.w,
                            buttonHeight: 52.h,
                            backgroundColor: ManagerColor.mainred,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                BlocProvider.of<CodeVerifyCubit>(context)
                                    .verify(code: code!);
                              } else {
                                autoValidateMode = AutovalidateMode.always;
                              }
                            },
                          ),
                    SizedBox(
                      height: 10.h,
                    ),
                    AppTextButton(
                      textButton: "Send New Code",
                      textColor: ManagerColor.mainred,
                      buttonWidth: 327.w,
                      buttonHeight: 52.h,
                      backgroundColor: ManagerColor.white,
                      onPressed: () {},
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
