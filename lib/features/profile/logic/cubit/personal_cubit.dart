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

  String _userName = '';
  String _email = '';
  String _phone = '';
  String _bloodBank = '';
  String _gender = '';
  String _nationalID = '';

  String get userName => _userName;
  String get email => _email;
  String get phone => _phone;
  String get bloodBank => _bloodBank;
  String get gender => _gender;
  String get nationalID => _nationalID;

  Future<void> fetchData() async {
    try {
      String? storedEmail = await secureStorage.read(key: 'email');
      if (storedEmail != null) {
        emit(PersonalLoading());
        final data =
            await crud.fetchData("$linkServerName/personal?Email=$storedEmail");
        _userName = data['userName'];
        _email = data['email'];
        _phone = data['phone'];
        _bloodBank = data['bloodBank'];
        _gender = data['gender'];
        _nationalID = data['nationalID'];
        await secureStorage.write(key: 'userName', value: _userName);
        emit(Personalsuccess(
          userName: _userName,
          email: _email,
          phone: _phone,
          bloodBank: _bloodBank,
          gender: _gender,
          nationalID: _nationalID,
        ));
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
}
