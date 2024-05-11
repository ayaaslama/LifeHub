import 'package:bloc/bloc.dart';
import 'package:blood_life/core/networking/crud.dart';
import 'package:blood_life/core/networking/links_api.dart';
import 'package:meta/meta.dart';

part 'bloodtest_state.dart';

class BloodtestCubit extends Cubit<BloodtestState> {
  BloodtestCubit() : super(BloodtestInitial());
  Crud crud = Crud();
  Future<void> bloodTest({
    required hospitalCenter,
    required typeOfTest,
    required date,
    required bloodType,
    required iDcard,
  }) async {
    emit(BloodtestLoading());
    var response = await crud.postRequest(
        "$linkServerName/Blood_Test",
        ({
          "hospitalCenter": hospitalCenter,
          "typeOfTest": typeOfTest,
          "date": date,
          "bloodType": bloodType,
          "iDcard": iDcard,
        }), (bool success) {
      if (success) {
        emit(BloodtestSuccesse());
        print("User booked successfully");
      } else {
        emit(BloodtestFailure());
        print("booked Fail");
      }
    });
  }
}
