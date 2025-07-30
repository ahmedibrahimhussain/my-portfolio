part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final DeveloperStatsModel model;
  HomeSuccess(this.model);
}

class HomeFailure extends HomeState {
  final String error;
  HomeFailure(this.error);
}