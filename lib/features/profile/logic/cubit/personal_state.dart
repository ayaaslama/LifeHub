part of 'personal_cubit.dart';

@immutable
sealed class PersonalState {}

final class PersonalInitial extends PersonalState {}

final class PersonalLoading extends PersonalState {}

final class Personalsuccess extends PersonalState {}

final class Personalfailure extends PersonalState {}
