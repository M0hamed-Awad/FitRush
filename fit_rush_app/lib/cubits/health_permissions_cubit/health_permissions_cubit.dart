import 'package:fit_rush_app/cubits/health_permissions_cubit/health_permissions_cubit_states.dart';
import 'package:fit_rush_app/services/health_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HealthPermissionsCubit extends Cubit<HealthPermissionsState> {
  HealthPermissionsCubit() : super(HealthPermissionsInitial());

  Future<void> requestPermissions() async {
    emit(HealthPermissionsLoading());
    try {
      await HealthService.requestHealthPermissions();
      emit(HealthPermissionsGranted());
    } catch (e) {
      emit(HealthPermissionsDenied(errorMessage: "Permissions not granted"));
    }
  }
}
