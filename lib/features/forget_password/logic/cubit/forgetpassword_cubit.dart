import 'package:blood_life/core/networking/crud.dart';
import 'package:blood_life/core/networking/links_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forgetpassword_state.dart';

class ForgetpasswordCubit extends Cubit<ForgetpasswordState> {
  ForgetpasswordCubit() : super(ForgetpasswordInitial());

  Crud crud = Crud();

  Future<void> forgetPassword({required String email}) async {
    emit(ForgetPasswordLoading());

    try {
      await crud.postRequest(
        "$linkForgetPassword",
        {
          "email": email,
        },
        (bool success) {
          if (success) {
            emit(ForgetPasswordSuccess());
          } else {
            emit(ForgetPasswordFailure());
          }
        },
      );
    } on DioError catch (e) {
      if (e.response != null && e.response!.statusCode == 400) {
        emit(ForgetPasswordFailure());
      } else {
        emit(ForgetPasswordFailure());
      }
    } catch (e) {
      emit(ForgetPasswordFailure());
    }
  }
}
