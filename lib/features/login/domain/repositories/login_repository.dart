import 'package:flutter/material.dart';
import 'package:pedala/features/login/data/models/user_dto.dart';

abstract class LoginRepository {
  Future<UserDto> login({
    required String username,
    required String password,
  });
  Future<UserDto> createAccount({
    required String firstname,
    required String lastname,
    required String username,
    required String password,
  });
}

class LoginRepositoryImpl implements LoginRepository {
  @override
  Future<UserDto> createAccount(
      {required String firstname,
      required String lastname,
      required String username,
      required String password}) async {
    try {
      return UserDto(
        'Pedala',
        'Pedal',
        'pedala',
        'secret',
      );
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<UserDto> login({
    required String username,
    required String password,
  }) async {
    if (username == 'pedala' && password == 'secret') {
      debugPrint('success');
      return UserDto(
        'Pedala',
        'Pedal',
        'pedala',
        '',
      );
    } else {
      debugPrint('error');
      throw UnimplementedError();
    }
  }
}
