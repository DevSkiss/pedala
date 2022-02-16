// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'driver_dashboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DriverDashboardStateTearOff {
  const _$DriverDashboardStateTearOff();

  _DriverDashboardState call(
      {bool isLoading = false,
      bool hasError = false,
      bool isFinished = false,
      LocationData? location}) {
    return _DriverDashboardState(
      isLoading: isLoading,
      hasError: hasError,
      isFinished: isFinished,
      location: location,
    );
  }
}

/// @nodoc
const $DriverDashboardState = _$DriverDashboardStateTearOff();

/// @nodoc
mixin _$DriverDashboardState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;
  bool get isFinished => throw _privateConstructorUsedError;
  LocationData? get location => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DriverDashboardStateCopyWith<DriverDashboardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DriverDashboardStateCopyWith<$Res> {
  factory $DriverDashboardStateCopyWith(DriverDashboardState value,
          $Res Function(DriverDashboardState) then) =
      _$DriverDashboardStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading, bool hasError, bool isFinished, LocationData? location});
}

/// @nodoc
class _$DriverDashboardStateCopyWithImpl<$Res>
    implements $DriverDashboardStateCopyWith<$Res> {
  _$DriverDashboardStateCopyWithImpl(this._value, this._then);

  final DriverDashboardState _value;
  // ignore: unused_field
  final $Res Function(DriverDashboardState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? hasError = freezed,
    Object? isFinished = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: hasError == freezed
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      isFinished: isFinished == freezed
          ? _value.isFinished
          : isFinished // ignore: cast_nullable_to_non_nullable
              as bool,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationData?,
    ));
  }
}

/// @nodoc
abstract class _$DriverDashboardStateCopyWith<$Res>
    implements $DriverDashboardStateCopyWith<$Res> {
  factory _$DriverDashboardStateCopyWith(_DriverDashboardState value,
          $Res Function(_DriverDashboardState) then) =
      __$DriverDashboardStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading, bool hasError, bool isFinished, LocationData? location});
}

/// @nodoc
class __$DriverDashboardStateCopyWithImpl<$Res>
    extends _$DriverDashboardStateCopyWithImpl<$Res>
    implements _$DriverDashboardStateCopyWith<$Res> {
  __$DriverDashboardStateCopyWithImpl(
      _DriverDashboardState _value, $Res Function(_DriverDashboardState) _then)
      : super(_value, (v) => _then(v as _DriverDashboardState));

  @override
  _DriverDashboardState get _value => super._value as _DriverDashboardState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? hasError = freezed,
    Object? isFinished = freezed,
    Object? location = freezed,
  }) {
    return _then(_DriverDashboardState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: hasError == freezed
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
      isFinished: isFinished == freezed
          ? _value.isFinished
          : isFinished // ignore: cast_nullable_to_non_nullable
              as bool,
      location: location == freezed
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationData?,
    ));
  }
}

/// @nodoc

class _$_DriverDashboardState implements _DriverDashboardState {
  _$_DriverDashboardState(
      {this.isLoading = false,
      this.hasError = false,
      this.isFinished = false,
      this.location});

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @JsonKey(defaultValue: false)
  @override
  final bool hasError;
  @JsonKey(defaultValue: false)
  @override
  final bool isFinished;
  @override
  final LocationData? location;

  @override
  String toString() {
    return 'DriverDashboardState(isLoading: $isLoading, hasError: $hasError, isFinished: $isFinished, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DriverDashboardState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError) &&
            (identical(other.isFinished, isFinished) ||
                other.isFinished == isFinished) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, hasError, isFinished, location);

  @JsonKey(ignore: true)
  @override
  _$DriverDashboardStateCopyWith<_DriverDashboardState> get copyWith =>
      __$DriverDashboardStateCopyWithImpl<_DriverDashboardState>(
          this, _$identity);
}

abstract class _DriverDashboardState implements DriverDashboardState {
  factory _DriverDashboardState(
      {bool isLoading,
      bool hasError,
      bool isFinished,
      LocationData? location}) = _$_DriverDashboardState;

  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  bool get isFinished;
  @override
  LocationData? get location;
  @override
  @JsonKey(ignore: true)
  _$DriverDashboardStateCopyWith<_DriverDashboardState> get copyWith =>
      throw _privateConstructorUsedError;
}
