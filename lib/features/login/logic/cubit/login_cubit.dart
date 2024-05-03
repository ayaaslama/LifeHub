import 'package:bloc/bloc.dart';
import 'package:blood_life/core/networking/crud.dart';
import 'package:blood_life/core/networking/links_api.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  Crud crud = Crud();
  Future<void> login({required String email, required String password}) async {
    emit(LoginSuccess());

    try {
      var response = await crud.postRequest(
          linkLogIn,
          ({
            "email": email,
            "password": password,
          }), (bool success) {
        if (success) {
          emit(LoginSuccess());
        } else {
          emit(LoginFailure());
        }
      });
      if (response != null && response.statusCode == 200) {
        emit(LoginSuccess());
      }
    } on Exception catch (e) {
      emit(LoginFailure());
    }
  }
}
