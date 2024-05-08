part of 'blood_request_cubit.dart';

@immutable
sealed class BloodRequestState {}

final class BloodRequestInitial extends BloodRequestState {}

final class BloodRequestLoading extends BloodRequestState {}

final class BloodRequestSuccess extends BloodRequestState {}

final class BloodRequestFailure extends BloodRequestState {}
