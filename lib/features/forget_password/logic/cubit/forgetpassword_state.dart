part of 'forgetpassword_cubit.dart';

@immutable
sealed class ForgetpasswordState {}

final class ForgetpasswordInitial extends ForgetpasswordState {}

final class ForgetPasswordLoading extends ForgetpasswordState {}

final class ForgetPasswordSuccess extends ForgetpasswordState {}

final class ForgetPasswordFailure extends ForgetpasswordState {}
