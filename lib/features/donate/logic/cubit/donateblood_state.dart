part of 'donateblood_cubit.dart';

@immutable
sealed class DonatebloodState {}

final class DonatebloodInitial extends DonatebloodState {}

final class DonatebloodLoading extends DonatebloodState {}

final class DonatebloodSuccesse extends DonatebloodState {}

final class DonatebloodFailure extends DonatebloodState {}
