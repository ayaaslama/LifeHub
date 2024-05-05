import 'package:bloc/bloc.dart';
import 'package:blood_life/core/networking/crud.dart';
import 'package:blood_life/core/networking/links_api.dart';
import 'package:meta/meta.dart';

part 'email_verify_state.dart';

class EmailVerifyCubit extends Cubit<EmailVerifyState> {
  EmailVerifyCubit() : super(EmaiVerifyInitial());
  Crud crud = Crud();
  Future<void> verify({required String email}) async {
    emit(EmailVerifyLoading());

    var response = await crud.postRequest(
        "$linkServerName/send_verify_token?email=$email",
        ({
          "email": email,
        }), (bool success) {
      if (success) {
        emit(EmailVerifySuccess());
      } else {
        emit(EmailVerifyFailure());
      }
    });
  }
}
