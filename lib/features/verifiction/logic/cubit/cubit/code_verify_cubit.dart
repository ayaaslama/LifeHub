import 'package:bloc/bloc.dart';
import 'package:blood_life/core/networking/crud.dart';
import 'package:blood_life/core/networking/links_api.dart';
import 'package:meta/meta.dart';

part 'code_verify_state.dart';

class CodeVerifyCubit extends Cubit<CodeVerifyState> {
  CodeVerifyCubit() : super(CodeVerifyInitial());
  Crud crud = Crud();
  Future<void> verify({required String code}) async {
    emit(CodeVerifyLoading());

    var response = await crud.postRequest(
        "$linkServerName/enter_token_verify?token=$code",
        ({
          "code": code,
        }), (bool success) {
      if (success) {
        emit(CodeVerifySuccess());
      } else {
        emit(CodeVerifyFailure());
      }
    });
  }
}
