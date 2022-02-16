import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedala/app/locator_injection.dart';
import 'package:pedala/core/domain/utils/exception.dart';
import 'package:pedala/features/login/data/models/user_dto.dart';
import 'package:pedala/features/login/data/services/auth_api_service.dart';
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
  final AuthApiService _authApiService = locator<AuthApiService>();
  final SharedPreferences _sharedPreferences = locator<SharedPreferences>();

  Future<void> initialized() async {
    emit(state.copyWith(
      isLoading: false,
      isAlreadyLoggedIn: false,
      success: false,
    ));
  }

  void loginAs() {
    emit(state.copyWith(
      isCustomer: !state.isCustomer,
      hasError: false,
      hasErrorLogin: false,
      success: false,
      isLoading: false,
    ));
  }

  Future<void> login(
      {required String email,
      required String password,
      required bool isCustomer}) async {
    emit(state.copyWith(
      hasError: false,
      isLoading: true,
      isAlreadyLoggedIn: false,
      hasErrorLogin: false,
      success: false,
    ));
    try {
      emit(state.copyWith(
        isLoading: true,
        hasError: false,
        success: false,
      ));
      UserCredential user = await loginRepository.login(
        email: email,
        password: password,
      );

      log('this is bloc result user:');
      log(user.user.toString());
      UserDto userDetails =
          await loginRepository.getDetails(userId: user.user?.uid ?? '');

      if (user.user.toString() != '') {
        _sharedPreferences.setString(
            'UserDetailsDTO', json.encode(userDetails));
      }

      if (userDetails.usertype == 'Customer') {
        if (isCustomer) {
          emit(state.copyWith(
            isLoading: false,
            userType: 'customer',
            success: true,
          ));
        } else {
          await _authApiService.logout();
          emit(state.copyWith(
            isLoading: false,
            hasErrorLogin: true,
            success: false,
          ));
        }
      } else {
        if (!isCustomer) {
          emit(state.copyWith(
            isLoading: false,
            userType: 'rider',
            success: true,
          ));
        } else {
          await _authApiService.logout();
          emit(state.copyWith(
            isLoading: false,
            hasErrorLogin: true,
            success: false,
          ));
        }
      }

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

  Future<void> registrationAccount(
      {required String firstname,
      required String lastname,
      required String userType,
      required String address,
      required String contactNo,
      required String email,
      required String password}) async {
    try {
      emit(state.copyWith(isLoading: true));
      await loginRepository.registration(
        firstname: firstname,
        lastname: lastname,
        userType: userType,
        address: address,
        contactNo: contactNo,
        email: email,
        password: password,
      );

      emit(state.copyWith(
        success: true,
        isLoading: false,
      ));
    } catch (e) {
      debugPrint('catch error $e');
      throw UserAlreadyExisting();
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
