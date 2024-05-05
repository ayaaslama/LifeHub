import 'package:bloc/bloc.dart';
import 'package:blood_life/core/networking/crud.dart';
import 'package:blood_life/core/networking/links_api.dart';
import 'package:blood_life/features/forget_password/logic/cubit/forgetpassword_cubit.dart';
import 'package:meta/meta.dart';

part 'new_password_state.dart';

class NewPasswordCubit extends Cubit<NewPasswordState> {
  NewPasswordCubit() : super(NewPasswordInitial());
  Crud crud = Crud();

  Future<void> changePass(
      {required String token,
      required String password,
      required String confirmPassword}) async {
    emit(NewPasswordLoading());

    var response = await crud.postRequest(
        "$linkServerName/reset-password",
        ({
          "token": token,
          "password": password,
          "confirmPassword": confirmPassword,
        }), (bool success) {
      if (success) {
        emit(NewPasswordSuccess());
      } else {
        emit(NewPasswordFailure());
      }
    });
  }
}
