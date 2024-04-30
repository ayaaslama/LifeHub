import 'package:blood_life/core/networking/crud.dart';
import 'package:blood_life/core/networking/links_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forgetpassword_state.dart';

class ForgetpasswordCubit extends Cubit<ForgetpasswordState> {
  ForgetpasswordCubit() : super(ForgetpasswordInitial());

  Crud crud = Crud();

  Future<void> forgetPassword({required String email}) async {
    emit(ForgetPasswordLoading());
    try {
      var response = await crud.postRequest(
          "$linkForgetPassword?email=$email",
          ({
            "email": email,
          }), (bool success) {
        if (success) {
          emit(ForgetPasswordSuccess());
        } else {
          emit(ForgetPasswordFailure());
        }
      });
      if (response != null && response.statusCode == 200) {
        emit(ForgetPasswordSuccess());
      }
    } on Exception catch (e) {
      emit(ForgetPasswordFailure());
    }
  }
}
