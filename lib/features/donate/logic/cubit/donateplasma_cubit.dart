import 'package:bloc/bloc.dart';
import 'package:blood_life/core/networking/crud.dart';
import 'package:blood_life/core/networking/links_api.dart';
import 'package:meta/meta.dart';

part 'donateplasma_state.dart';

class DonateplasmaCubit extends Cubit<DonateplasmaState> {
  DonateplasmaCubit() : super(DonateplasmaInitial());
  Crud crud = Crud();
  Future<void> register({
    required id,
    required hospitalCenter,
    required date,
    required hour,
  }) async {
    emit(DonatePlasmaLoading());
    var response = await crud.postRequest(
        "$linkServerName/plasma_register",
        ({
          "id": id,
          "hospitalCenter": hospitalCenter,
          "date": date,
          "hour": hour,
        }), (bool success) {
      if (success) {
        emit(DonatePlasmaSuccesse());
        print("User Registered successfully");
      } else {
        emit(DonatePlasmaFailure());
        print("Register Fail");
      }
    });
  }
}
