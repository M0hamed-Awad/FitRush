import 'package:fit_rush_app/cubits/health_permissions_cubit/health_permissions_cubit_states.dart';
import 'package:fit_rush_app/services/health_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HealthPermissionsCubit extends Cubit<HealthPermissionsState> {
  HealthPermissionsCubit() : super(HealthPermissionsInitial());

  Future<void> requestPermissionsOnce() async {
    emit(HealthPermissionsLoading());

    final prefs = await SharedPreferences.getInstance();
    final alreadyRequested =
        prefs.getBool('hasRequestedHealthPermission') ?? false;

    if (alreadyRequested) {
      emit(HealthPermissionsGranted());
      return;
    }

    try {
      final granted = await HealthService.requestHealthPermissions();
      if (granted) {
        await prefs.setBool('hasRequestedHealthPermission', true);
        emit(HealthPermissionsGranted());
      } else {
        emit(HealthPermissionsDenied(errorMessage: "Permissions not granted"));
      }
    } catch (e) {
      emit(HealthPermissionsDenied(errorMessage: "Permissions not granted"));
    }
  }
}