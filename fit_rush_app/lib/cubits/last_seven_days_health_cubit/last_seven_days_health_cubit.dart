import 'package:fit_rush_app/cubits/last_seven_days_health_cubit/last_seven_days_health_cubit_states.dart';
import 'package:fit_rush_app/services/health_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LastSevenDaysHealthCubit extends Cubit<LastSevenDaysHealthState> {
  LastSevenDaysHealthCubit() : super(LastSevenDaysHealthInitial());

  Future<void> fetchWeekData() async {
    emit(LastSevenDaysHealthLoading());

    try {
      final steps = await HealthService.getLastSevenDaysSteps();
      final calories = await HealthService.getLastSevenDaysCalories();

      emit(LastSevenDaysHealthLoaded(steps: steps, calories: calories));
    } catch (e) {
      emit(
        LastSevenDaysHealthFailed(
          errorMessage: "Failed to fetch weekly health data.",
        ),
      );
    }
  }
}
