import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedala/app/locator_injection.dart';
import 'package:pedala/features/login/data/models/user_dto.dart';
import 'package:pedala/features/login/data/services/auth_api_service.dart';
import 'package:pedala/features/login/domain/blocs/login_state.dart';
import 'package:pedala/features/login/domain/repositories/login_repository.dart';

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
  final AuthApiService _authApiService = locator<AuthApiService>();

  Future<bool> initialized() async {
    emit(state.copyWith(
      isLoading: false,
      isAlreadyLoggedIn: false,
      success: false,
    ));

    if (_authApiService.hasUser) {
      // log(_authApiService.hasUser.toString());
      return true;
    } else {
      return false;
    }
  }

  Future<void> login({required String email, required String password}) async {
    emit(state.copyWith(
      hasError: false,
      isLoading: true,
      isAlreadyLoggedIn: false,
      success: false,
    ));
    try {
      // emit(state.copyWith(
      //   isLoading: true,
      //   hasError: false,
      //   success: false,
      // ));
      //await Future.delayed(const Duration(seconds: 3));
      UserCredential user = await loginRepository.login(
        email: email,
        password: password,
      );

      log('this is bloc result user:');
      log(user.user.toString());
      emit(state.copyWith(
        isLoading: false,
        isAlreadyLoggedIn: true,
        success: true,
      ));

      // if (user.access != '') {
      //   debugPrint('access: ${user.access.toString()}');
      //   _sharedPreferences.setString('access', user.access);
      // }

      // emit(state.copyWith(
      //   success: true,
      //   isLoading: false,
      // ));
    } catch (e) {
      log('catch this is bloc result user:');
      log(e.toString());
      emit(state.copyWith(
        hasError: true,
        isLoading: false,
      ));
      emit(state.copyWith(
        hasError: false,
        isLoading: false,
      ));
    }
  }

  Future<void> registrationAccount({required email, required password}) async {
    try {
      UserCredential user = await loginRepository.registration(
        email: email,
        password: password,
      );

      log('register');
      log(user.additionalUserInfo.toString());
    } catch (e) {
      debugPrint('catch error $e');
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
