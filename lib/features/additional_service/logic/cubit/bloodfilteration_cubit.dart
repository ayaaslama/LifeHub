import 'package:bloc/bloc.dart';
import 'package:blood_life/core/networking/crud.dart';
import 'package:blood_life/core/networking/links_api.dart';
import 'package:meta/meta.dart';

part 'bloodfilteration_state.dart';

class BloodfilterationCubit extends Cubit<BloodfilterationState> {
  BloodfilterationCubit() : super(BloodfilterationInitial());
  Crud crud = Crud();
  Future<void> bloodFiltration({
    required hospitalCenter,
    required typeOfTest,
    required date,
    required bloodType,
    required iDcard,
  }) async {
    emit(BloodfilterationLoading());
    var response = await crud.postRequest(
        "$linkServerName/Blood_Filtration",
        ({
          "hospitalCenter": hospitalCenter,
          "typeOfTest": typeOfTest,
          "date": date,
          "bloodType": bloodType,
          "iDcard": iDcard,
        }), (bool success) {
      if (success) {
        emit(BloodfilterationSuccesse());
        print("User booked successfully");
      } else {
        emit(BloodfilterationFailure());
        print("booked Fail");
      }
    });
  }
}
