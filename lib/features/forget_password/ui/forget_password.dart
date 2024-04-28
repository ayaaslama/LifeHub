// import 'package:blood_life/core/helper/extension.dart';
// import 'package:blood_life/core/helper/feild_item.dart';
// import 'package:blood_life/core/networking/crud.dart';
// import 'package:blood_life/core/networking/links_api.dart';
// import 'package:blood_life/core/routing/routes.dart';
// import 'package:blood_life/core/theaming/color.dart';
// import 'package:blood_life/core/theaming/stlye.dart';
// import 'package:blood_life/core/vaildator/validator.dart';
// import 'package:blood_life/core/widgets/app_bar.dart';
// import 'package:blood_life/core/widgets/app_text_button.dart';
// import 'package:blood_life/core/widgets/app_text_feild.dart';
// import 'package:blood_life/core/widgets/loading.dart';
// import 'package:blood_life/features/forget_password/logic/cubit/forgetpassword_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';

// class EmailForForgetPassword extends StatefulWidget {
//   const EmailForForgetPassword({super.key});

//   @override
//   State<EmailForForgetPassword> createState() => _EmailForForgetPasswordState();
// }

// class _EmailForForgetPasswordState extends State<EmailForForgetPassword> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (context) => ForgetpasswordCubit(),
//         child: Builder(builder: (context) {
//           final cubit = ForgetpasswordCubit();
//           return Scaffold(
//             appBar: AppBar(
//               backgroundColor: Colors.white,
//               leading: IconButton(
//                 onPressed: () {
//                   context.pop();
//                 },
//                 icon: const Icon(Icons.arrow_back_ios_sharp),
//                 color: ManagerColor.maink7ly,
//               ),
//             ),
//             body: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.only(
//                   left: 24,
//                   right: 20,
//                 ),
//                 child: Form(
//                   key: cubit.formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         height: 20.h,
//                       ),
//                       Center(
//                         child: Column(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(left: 120),
//                               child: SvgPicture.asset(
//                                 "assets/svgs/forget_password.svg",
//                                 height: 150.h,
//                                 width: 150.w,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 20.h,
//                             ),
//                             Text(
//                               'Forget Password?',
//                               style: TextStyles.font22K7lybold,
//                             ),
//                             SizedBox(
//                               height: 10.h,
//                             ),
//                             Text(
//                               "Please Write your email to receive a confirmation code to set a new password.",
//                               style: TextStyles.font14GreyMedium,
//                             ),
//                             SizedBox(
//                               height: 10.h,
//                             ),
//                             MyTextField(
//                                 item: FieldItem(
//                               fieldName: 'Email Address',
//                               focusNode: cubit.emailFocusNode,
//                               textInputAction: TextInputAction.done,
//                               keyboardType: TextInputType.emailAddress,
//                               onSave: (data) {
//                                 cubit.email = data;
//                               },
//                               validator: (value) {
//                                 return Validator.validateEmail(value);
//                               },
//                             )),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20.h,
//                       ),
//                       BlocBuilder(
//                           bloc: cubit,
//                           builder: (context, state) {
//                             return state is ForgetPasswordLoading
//                                 ? const LoadingButton()
//                                 : AppTextButton(
//                                     textButton: "Confirm Mail",
//                                     buttonWidth: 327.w,
//                                     buttonHeight: 52.h,
//                                     backgroundColor: ManagerColor.mainred,
//                                     onPressed: () {
//                                       if (cubit.formKey.currentState!
//                                           .validate()) {
//                                         cubit.formKey.currentState!.save();
//                                         cubit.forgetPassword();
//                                       } else {
//                                         cubit.autovalidateMode =
//                                             AutovalidateMode.always;
//                                       }
//                                     },
//                                   );
//                           }),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         }));
//   }
// }
