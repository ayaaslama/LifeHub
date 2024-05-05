part of 'email_verify_cubit.dart';

@immutable
sealed class EmailVerifyState {}

final class EmaiVerifyInitial extends EmailVerifyState {}

final class EmailVerifySuccess extends EmailVerifyState {}

final class EmailVerifyLoading extends EmailVerifyState {}

final class EmailVerifyFailure extends EmailVerifyState {}
