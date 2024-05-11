import 'package:bloc/bloc.dart';
import 'package:blood_life/core/networking/crud.dart';
import 'package:blood_life/core/networking/links_api.dart';
import 'package:meta/meta.dart';

part 'bloodrbcs_state.dart';

class BloodrbcsCubit extends Cubit<BloodrbcsState> {
  BloodrbcsCubit() : super(BloodrbcsInitial());
  Crud crud = Crud();
  Future<void> bloodRbcs({
    required hospitalCenter,
    required date,
    required bloodType,
    required iDcard,
  }) async {
    emit(BloodrbcsLoading());
    var response = await crud.postRequest(
        "$linkServerName/Washed_Rbcs",
        ({
          "hospitalCenter": hospitalCenter,
          "date": date,
          "bloodType": bloodType,
          "iDcard": iDcard,
        }), (bool success) {
      if (success) {
        emit(BloodrbcsSuccesse());
        print("User booked successfully");
      } else {
        emit(BloodrbcsFailure());
        print("booked Fail");
      }
    });
  }
}
