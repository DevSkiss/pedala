import 'package:pedala/app/locator_injection.dart';
import 'package:pedala/core/domain/utils/exception.dart';
import 'package:pedala/features/login/data/models/user_auth_dto.dart';
import 'package:pedala/features/login/data/models/user_dto.dart';
import 'package:pedala/features/login/data/services/auth_api_service.dart';

abstract class LoginRepository {
  Future<UserAuthDto> login({
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
  Future<UserAuthDto> login({
    required String username,
    required String password,
  }) async {
    try {
      return await apiService.login(username: username, password: password);
    } catch (e) {
      throw ServerException();
    }
  }
}
