import 'package:bloc/bloc.dart';
import 'package:blood_life/core/networking/crud.dart';
import 'package:blood_life/core/networking/links_api.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
  Crud crud = Crud();

  Future<void> signUp(
      {required String userName,
      required String email,
      required String nationalID,
      required String phone,
      required String password,
      required String city,
      required String bloodBank,
      required String birthDate,
      required String gender}) async {
    emit(SignupLoading());

    var response = await crud.postRequest(
        linkSignUp,
        ({
          "userName": userName,
          "email": email,
          "nationalID": nationalID,
          "phone": phone,
          "password": password,
          "city": city,
          "bloodBank": bloodBank,
          "birthDate": birthDate,
          "gender": gender,
        }), (bool success) {
      if (success) {
        emit(SignupSuccess());
      } else {
        emit(SignupFailure());
      }
    });
  }
}
