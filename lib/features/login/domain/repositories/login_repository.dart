import 'package:firebase_auth/firebase_auth.dart';
import 'package:pedala/app/locator_injection.dart';
import 'package:pedala/core/domain/utils/exception.dart';
import 'package:pedala/features/login/data/models/user_dto.dart';
import 'package:pedala/features/login/data/services/auth_api_service.dart';

abstract class LoginRepository {
  Future<UserCredential> login({
    required String email,
    required String password,
  });
  Future<UserCredential> registration({
    required String email,
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
  final AuthApiService apiService = locator<AuthApiService>();

  @override
  Future<UserDto> createAccount(
      {required String firstname,
      required String lastname,
      required String username,
      required String password}) async {
    try {
      return apiService.signup(
        firstname: firstname,
        lastname: lastname,
        username: username,
        password: password,
      );
    } catch (e) {
      throw UnimplementedError();
    }
  }

  @override
  Future<UserCredential> login({
    required String email,
    required String password,
  }) async {
    try {
      return await apiService.login(email: email, password: password);
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<UserCredential> registration({
    required String email,
    required String password,
  }) async {
    try {
      return await apiService.registration(email: email, password: password);
    } catch (e) {
      throw ServerException();
    }
  }
}
