import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedala/app/locator_injection.dart';
import 'package:pedala/features/login/data/models/user_auth_dto.dart';
import 'package:pedala/features/login/data/models/user_dto.dart';
import 'package:pedala/features/login/domain/blocs/login_state.dart';
import 'package:pedala/features/login/domain/repositories/login_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc()
      : super(LoginState(
          isLoading: false,
          success: false,
          hasError: false,
        )) {
    initialized();
  }
  final LoginRepository loginRepository = locator<LoginRepository>();
  final SharedPreferences _sharedPreferences = locator<SharedPreferences>();

  void initialized() async {
    emit(state.copyWith(isLoading: true));
    String? result = _sharedPreferences.getString('access');
    log(result ?? '');
    if (result != '') {
      emit(state.copyWith(
        isLoading: false,
        isAlreadyLoggedIn: true,
        success: true,
      ));
    } else {
      emit(state.copyWith(
        isLoading: false,
        isAlreadyLoggedIn: false,
      ));
    }
  }

  Future<void> login(
      {required String username, required String password}) async {
    try {
      emit(state.copyWith(
        isLoading: true,
        hasError: false,
        success: false,
      ));
      await Future.delayed(const Duration(seconds: 3));
      UserAuthDto user = await loginRepository.login(
        username: username,
        password: password,
      );

      if (user.access != '') {
        debugPrint('access: ${user.access.toString()}');
        _sharedPreferences.setString('access', user.access);
      }

      emit(state.copyWith(
        success: true,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        hasError: true,
        isLoading: false,
      ));
    }
  }

  Future<void> createAccount({
    required String firstname,
    required String lastname,
    required String username,
    required String password,
  }) async {
    try {
      emit(state.copyWith(
        isLoading: true,
        hasError: false,
        success: false,
      ));
      await Future.delayed(const Duration(seconds: 3));
      UserDto user = await loginRepository.createAccount(
          firstname: firstname,
          lastname: lastname,
          username: username,
          password: password);

      debugPrint(json.encode(user).toString());
      emit(state.copyWith(
        success: true,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        hasError: true,
        isLoading: false,
      ));
    }
  }
}
