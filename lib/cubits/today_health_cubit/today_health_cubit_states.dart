abstract class TodayHealthState {}

class TodayHealthInitial extends TodayHealthState {}

class TodayHealthLoading extends TodayHealthState {}

class TodayHealthLoaded extends TodayHealthState {
  final int steps;
  final int activeMinutes;
  final double calories;
  final double distance;

  TodayHealthLoaded({
    required this.steps,
    required this.activeMinutes,
    required this.calories,
    required this.distance,
  });
}

class TodayHealthFailed extends TodayHealthState {
  final String errorMessage;

  TodayHealthFailed({required this.errorMessage});
}
