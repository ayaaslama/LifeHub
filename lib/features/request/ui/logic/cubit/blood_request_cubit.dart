import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:blood_life/core/networking/crud.dart';
import 'package:blood_life/core/networking/links_api.dart';
part 'blood_request_state.dart';

class BloodRequestCubit extends Cubit<BloodRequestState> {
  BloodRequestCubit() : super(BloodRequestInitial());
  Crud crud = Crud();

  Future<void> signUp({
    required String id,
    required String hospitalCenter,
    required String date,
    required String bloodType,
  }) async {
    emit(BloodRequestLoading());

    var response = await crud.postRequest(
        "$linkServerName/blood_register",
        ({
          "id": id,
          "hospitalCenter": hospitalCenter,
          "date": date,
          "bloodType": bloodType,
        }), (bool success) {
      if (success) {
        emit(BloodRequestSuccess());
      } else {
        emit(BloodRequestFailure());
      }
    });
  }
}
