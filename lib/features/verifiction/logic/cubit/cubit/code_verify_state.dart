part of 'code_verify_cubit.dart';

@immutable
sealed class CodeVerifyState {}

final class CodeVerifyInitial extends CodeVerifyState {}

final class CodeVerifySuccess extends CodeVerifyState {}

final class CodeVerifyLoading extends CodeVerifyState {}

final class CodeVerifyFailure extends CodeVerifyState {}
