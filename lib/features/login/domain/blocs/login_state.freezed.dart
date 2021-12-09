// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginStateTearOff {
  const _$LoginStateTearOff();

  _LoginState call(
      {dynamic isLoading = false,
      dynamic hasError = false,
      dynamic success = false,
      dynamic isAlreadyLoggedIn = false}) {
    return _LoginState(
      isLoading: isLoading,
      hasError: hasError,
      success: success,
      isAlreadyLoggedIn: isAlreadyLoggedIn,
    );
  }
}

/// @nodoc
const $LoginState = _$LoginStateTearOff();

/// @nodoc
mixin _$LoginState {
  dynamic get isLoading => throw _privateConstructorUsedError;
  dynamic get hasError => throw _privateConstructorUsedError;
  dynamic get success => throw _privateConstructorUsedError;
  dynamic get isAlreadyLoggedIn => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginStateCopyWith<LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res>;
  $Res call(
      {dynamic isLoading,
      dynamic hasError,
      dynamic success,
      dynamic isAlreadyLoggedIn});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  final LoginState _value;
  // ignore: unused_field
  final $Res Function(LoginState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? hasError = freezed,
    Object? success = freezed,
    Object? isAlreadyLoggedIn = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as dynamic,
      hasError: hasError == freezed
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as dynamic,
      success: success == freezed
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isAlreadyLoggedIn: isAlreadyLoggedIn == freezed
          ? _value.isAlreadyLoggedIn
          : isAlreadyLoggedIn // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$LoginStateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(
          _LoginState value, $Res Function(_LoginState) then) =
      __$LoginStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {dynamic isLoading,
      dynamic hasError,
      dynamic success,
      dynamic isAlreadyLoggedIn});
}

/// @nodoc
class __$LoginStateCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$LoginStateCopyWith<$Res> {
  __$LoginStateCopyWithImpl(
      _LoginState _value, $Res Function(_LoginState) _then)
      : super(_value, (v) => _then(v as _LoginState));

  @override
  _LoginState get _value => super._value as _LoginState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? hasError = freezed,
    Object? success = freezed,
    Object? isAlreadyLoggedIn = freezed,
  }) {
    return _then(_LoginState(
      isLoading: isLoading == freezed ? _value.isLoading : isLoading,
      hasError: hasError == freezed ? _value.hasError : hasError,
      success: success == freezed ? _value.success : success,
      isAlreadyLoggedIn: isAlreadyLoggedIn == freezed
          ? _value.isAlreadyLoggedIn
          : isAlreadyLoggedIn,
    ));
  }
}

/// @nodoc

class _$_LoginState implements _LoginState {
  _$_LoginState(
      {this.isLoading = false,
      this.hasError = false,
      this.success = false,
      this.isAlreadyLoggedIn = false});

  @JsonKey(defaultValue: false)
  @override
  final dynamic isLoading;
  @JsonKey(defaultValue: false)
  @override
  final dynamic hasError;
  @JsonKey(defaultValue: false)
  @override
  final dynamic success;
  @JsonKey(defaultValue: false)
  @override
  final dynamic isAlreadyLoggedIn;

  @override
  String toString() {
    return 'LoginState(isLoading: $isLoading, hasError: $hasError, success: $success, isAlreadyLoggedIn: $isAlreadyLoggedIn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginState &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality().equals(other.hasError, hasError) &&
            const DeepCollectionEquality().equals(other.success, success) &&
            const DeepCollectionEquality()
                .equals(other.isAlreadyLoggedIn, isAlreadyLoggedIn));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(hasError),
      const DeepCollectionEquality().hash(success),
      const DeepCollectionEquality().hash(isAlreadyLoggedIn));

  @JsonKey(ignore: true)
  @override
  _$LoginStateCopyWith<_LoginState> get copyWith =>
      __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);
}

abstract class _LoginState implements LoginState {
  factory _LoginState(
      {dynamic isLoading,
      dynamic hasError,
      dynamic success,
      dynamic isAlreadyLoggedIn}) = _$_LoginState;

  @override
  dynamic get isLoading;
  @override
  dynamic get hasError;
  @override
  dynamic get success;
  @override
  dynamic get isAlreadyLoggedIn;
  @override
  @JsonKey(ignore: true)
  _$LoginStateCopyWith<_LoginState> get copyWith =>
      throw _privateConstructorUsedError;
}
