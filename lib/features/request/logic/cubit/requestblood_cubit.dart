import 'package:bloc/bloc.dart';
import 'package:blood_life/core/networking/crud.dart';
import 'package:blood_life/core/networking/links_api.dart';
import 'package:meta/meta.dart';

part 'requestblood_state.dart';

class RequestbloodCubit extends Cubit<RequestbloodState> {
  RequestbloodCubit() : super(RequestbloodInitial());
  Crud crud = Crud();
  Future<void> booked({
    required id,
    required hospitalCenter,
    required date,
    required hour,
  }) async {
    emit(RequestbloodLoading());
    var response = await crud.postRequest(
        "$linkServerName/blood_request",
        ({
          "id": id,
          "hospitalCenter": hospitalCenter,
          "date": date,
          "hour": hour,
        }), (bool success) {
      if (success) {
        emit(RequestbloodSuccesse());
        print("User Registered successfully");
      } else {
        emit(RequestbloodFailure());
        print("Register Fail");
      }
    });
  }
}
