class LastSevenDaysHealthState {}

class LastSevenDaysHealthInitial extends LastSevenDaysHealthState {}

class LastSevenDaysHealthLoading extends LastSevenDaysHealthState {}

class LastSevenDaysHealthLoaded extends LastSevenDaysHealthState {
  final List<int> steps;
  final List<double> calories;

  LastSevenDaysHealthLoaded({required this.steps, required this.calories});
}

class LastSevenDaysHealthFailed extends LastSevenDaysHealthState {
  final String errorMessage;

  LastSevenDaysHealthFailed({required this.errorMessage});
}
