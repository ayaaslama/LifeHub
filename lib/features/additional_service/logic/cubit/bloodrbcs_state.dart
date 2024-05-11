part of 'bloodrbcs_cubit.dart';

@immutable
sealed class BloodrbcsState {}

final class BloodrbcsInitial extends BloodrbcsState {}

final class BloodrbcsLoading extends BloodrbcsState {}

final class BloodrbcsSuccesse extends BloodrbcsState {}

final class BloodrbcsFailure extends BloodrbcsState {}
