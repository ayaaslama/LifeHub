// import 'dart:js';

// import 'package:blood_life/core/helper/constants.dart';
// import 'package:blood_life/core/helper/extension.dart';
// import 'package:blood_life/core/networking/crud.dart';
// import 'package:blood_life/core/networking/links_api.dart';
// import 'package:blood_life/core/routing/routes.dart';
// import 'package:blood_life/core/theaming/color.dart';
// import 'package:blood_life/core/widgets/snack_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// part 'forgetpassword_state.dart';

// class ForgetpasswordCubit extends Cubit<ForgetpasswordState> {
//   ForgetpasswordCubit() : super(ForgetpasswordInitial());
//   final GlobalKey<FormState> formKey = GlobalKey();
//   String? email;
//   final emailFocusNode = FocusNode();
//   AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
//   static ForgetpasswordCubit of(context) => BlocProvider.of(context);
//   Crud crud = Crud();

//   static BuildContext context = navigatorKey.currentContext!;

//   Future<void> forgetPassword() async {
//     formKey.currentState!.save();
//     if (formKey.currentState!.validate()) {
//       emit(ForgetPasswordLoading());
//       try {
//         var response = await crud.postRequest(
//             "$linkServerName/forgot-password?email=$email",
//             ({
//               "email": email!,
//             }),
//       } catch (e) {
//         print("Error Catch $e");
//       }

//       emit(ForgetpasswordInitial());
//     } else {
//       autovalidateMode = AutovalidateMode.always;
//     }
//   }
// }
