import 'package:bloc/bloc.dart';
import 'package:blood_life/core/networking/crud.dart';
import 'package:blood_life/core/networking/links_api.dart';
import 'package:meta/meta.dart';

part 'donateblood_state.dart';

class DonatebloodCubit extends Cubit<DonatebloodState> {
  DonatebloodCubit() : super(DonatebloodInitial());
  Crud crud = Crud();
  Future<void> register({
    required id,
    required hospitalCenter,
    required date,
    required hour,
  }) async {
    emit(DonatebloodLoading());
    var response = await crud.postRequest(
        "$linkServerName/blood_register",
        ({
          "id": id,
          "hospitalCenter": hospitalCenter,
          "date": date,
          "hour": hour,
        }), (bool success) {
      if (success) {
        emit(DonatebloodSuccesse());
        print("User Registered successfully");
      } else {
        emit(DonatebloodFailure());
        print("Register Fail");
      }
    });
  }
}
