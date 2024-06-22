part of 'requests_cubit.dart';

@immutable
sealed class RequestsState {}

final class RequestsInitial extends RequestsState {}

final class RequestsLoaded extends RequestsState {
  RequestsLoaded();
}
