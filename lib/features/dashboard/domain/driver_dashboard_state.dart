import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:location/location.dart';

part 'driver_dashboard_state.freezed.dart';

@freezed
class DriverDashboardState with _$DriverDashboardState {
  factory DriverDashboardState({
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    @Default(false) bool isFinished,
    LocationData? location,
  }) = _DriverDashboardState;
}
