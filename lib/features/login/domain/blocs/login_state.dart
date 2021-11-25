import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  factory LoginState({
    @Default(false) isLoading,
    @Default(false) hasError,
    @Default(false) success,
  }) = _LoginState;
}
