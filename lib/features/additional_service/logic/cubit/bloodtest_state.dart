part of 'bloodtest_cubit.dart';

@immutable
sealed class BloodtestState {}

final class BloodtestInitial extends BloodtestState {}

final class BloodtestLoading extends BloodtestState {}

final class BloodtestSuccesse extends BloodtestState {}

final class BloodtestFailure extends BloodtestState {}
