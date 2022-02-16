import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    @Default(false) bool isLoading,
    @Default(false) bool hasError,
    @Default(false) bool success,
    @Default(false) bool isAlreadyLoggedIn,
    @Default(true) bool isCustomer,
    @Default(false) bool hasErrorLogin,
    String? userType,
  }) = _LoginState;
}
