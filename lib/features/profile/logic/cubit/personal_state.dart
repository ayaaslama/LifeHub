part of 'personal_cubit.dart';

@immutable
sealed class PersonalState {}

class PersonalInitial extends PersonalState {}

class PersonalLoading extends PersonalState {}

class Personalsuccess extends PersonalState {
  final String userName;
  final String email;
  final String phone;
  final String bloodBank;
  final String gender;
  final String nationalID;

  Personalsuccess({
    required this.userName,
    required this.email,
    required this.phone,
    required this.bloodBank,
    required this.gender,
    required this.nationalID,
  });
}

class Personalfailure extends PersonalState {}
