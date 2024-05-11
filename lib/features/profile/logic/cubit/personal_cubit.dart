import 'package:bloc/bloc.dart';
import 'package:blood_life/core/networking/crud.dart';
import 'package:blood_life/core/networking/links_api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';

part 'personal_state.dart';

class PersonalCubit extends Cubit<PersonalState> {
  PersonalCubit() : super(PersonalInitial());
  Crud crud = Crud();
  final secureStorage = const FlutterSecureStorage();

  // @override
  // void initState() {
  //   super.initState();
  //   fetchData();
  // }

  Future<void> fetchData(
      {required userName,
      required email,
      required phone,
      required bloodBank,
      required gender,
      required nationalID}) async {
    try {
      String? storedEmail = await secureStorage.read(key: 'email');
      if (storedEmail != null) {
        emit(PersonalLoading());
        final data =
            await crud.fetchData("$linkServerName/personal?Email=$storedEmail");
        setState(() {
          userName = data['userName'];
          email = data['email'];
          phone = data['phone'];
          bloodBank = data['bloodBank'];
          gender = data['gender'];
          nationalID = data['nationalID'];
        });
        emit(Personalsuccess());
        print('Fetched data successfully');
      } else {
        emit(Personalfailure());
        print('No stored email found');
      }
    } catch (e) {
      emit(Personalfailure());
      print('Error fetching data: $e');
    }
  }

  void setState(Null Function() param0) {}
}
