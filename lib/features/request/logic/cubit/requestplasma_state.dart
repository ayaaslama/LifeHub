part of 'requestplasma_cubit.dart';

@immutable
sealed class RequestplasmaState {}

final class RequestplasmaInitial extends RequestplasmaState {}

final class RequestplasmaLoading extends RequestplasmaState {}

final class RequestplasmaSuccesse extends RequestplasmaState {}

final class RequestplasmaFailure extends RequestplasmaState {}
