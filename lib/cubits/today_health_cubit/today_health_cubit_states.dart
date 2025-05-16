abstract class TodayHealthState {}

class TodayHealthInitial extends TodayHealthState {}

class TodayHealthLoading extends TodayHealthState {}

class TodayHealthLoaded extends TodayHealthState {
  final int steps;
  final double calories;
  final double distance;
  final double heartRate;

  TodayHealthLoaded({
    required this.steps,
    required this.calories,
    required this.distance,
    required this.heartRate,
  });
}

class TodayHealthFailed extends TodayHealthState {
  final String errorMessage;

  TodayHealthFailed({required this.errorMessage});
}
