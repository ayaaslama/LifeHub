part of 'bloodfilteration_cubit.dart';

@immutable
sealed class BloodfilterationState {}

final class BloodfilterationInitial extends BloodfilterationState {}

final class BloodfilterationLoading extends BloodfilterationState {}

final class BloodfilterationSuccesse extends BloodfilterationState {}

final class BloodfilterationFailure extends BloodfilterationState {}
