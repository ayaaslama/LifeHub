import 'package:bloc/bloc.dart';
import 'package:blood_life/core/networking/crud.dart';
import 'package:blood_life/core/networking/links_api.dart';
import 'package:meta/meta.dart';

part 'requestplasma_state.dart';

class RequestplasmaCubit extends Cubit<RequestplasmaState> {
  RequestplasmaCubit() : super(RequestplasmaInitial());
  Crud crud = Crud();
  Future<void> booked({
    required id,
    required hospitalCenter,
    required date,
    required hour,
  }) async {
    emit(RequestplasmaLoading());
    var response = await crud.postRequest(
        "$linkServerName/plasma_request",
        ({
          "id": id,
          "hospitalCenter": hospitalCenter,
          "date": date,
          "hour": hour,
        }), (bool success) {
      if (success) {
        emit(RequestplasmaSuccesse());
        print("User Registered successfully");
      } else {
        emit(RequestplasmaFailure());
        print("Register Fail");
      }
    });
  }
}
