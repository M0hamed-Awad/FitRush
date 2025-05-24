import 'package:fit_rush_app/cubits/today_health_cubit/today_health_cubit_states.dart';
import 'package:fit_rush_app/services/health_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodayHealthCubit extends Cubit<TodayHealthState> {
  TodayHealthCubit() : super(TodayHealthInitial());

  Future<void> fetchTodayData() async {
    emit(TodayHealthLoading());
    try {
      final steps = await HealthService.getTodaysSteps();
      final calories = await HealthService.getTodaysCalories();
      final distance = await HealthService.getTodaysDistanceCovered();
      final activeMinutes = await HealthService.getTodaysMoveMinutes();

      emit(
        TodayHealthLoaded(
          steps: steps ?? 0,
          calories: calories ?? 0.0,
          distance: distance ?? 0.0,
          activeMinutes: activeMinutes ?? 0,
        ),
      );
    } catch (e) {
      emit(
        TodayHealthFailed(errorMessage: "Failed to fetch today's health data."),
      );
    }
  }
}
