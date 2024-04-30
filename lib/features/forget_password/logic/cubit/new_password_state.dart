part of 'new_password_cubit.dart';

@immutable
sealed class NewPasswordState {}

final class NewPasswordInitial extends NewPasswordState {}

final class NewPasswordLoading extends NewPasswordState {}

final class NewPasswordSuccess extends NewPasswordState {}

final class NewPasswordFailure extends NewPasswordState {}
