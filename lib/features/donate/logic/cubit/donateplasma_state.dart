part of 'donateplasma_cubit.dart';

@immutable
sealed class DonateplasmaState {}

final class DonateplasmaInitial extends DonateplasmaState {}

final class DonatePlasmaLoading extends DonateplasmaState {}

final class DonatePlasmaSuccesse extends DonateplasmaState {}

final class DonatePlasmaFailure extends DonateplasmaState {}
