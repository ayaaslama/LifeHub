part of 'requestblood_cubit.dart';

@immutable
sealed class RequestbloodState {}

final class RequestbloodInitial extends RequestbloodState {}

final class RequestbloodLoading extends RequestbloodState {}

final class RequestbloodSuccesse extends RequestbloodState {}

final class RequestbloodFailure extends RequestbloodState {}
