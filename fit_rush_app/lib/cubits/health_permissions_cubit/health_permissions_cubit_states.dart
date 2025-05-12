abstract class HealthPermissionsState {}

class HealthPermissionsInitial extends HealthPermissionsState {}

class HealthPermissionsLoading extends HealthPermissionsState {}

class HealthPermissionsGranted extends HealthPermissionsState {}

class HealthPermissionsDenied extends HealthPermissionsState {
  final String errorMessage;

  HealthPermissionsDenied({required this.errorMessage});
}
