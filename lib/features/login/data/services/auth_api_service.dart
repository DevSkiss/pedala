import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pedala/core/domain/utils/constants.dart';
import 'package:pedala/core/domain/utils/exception.dart';
import 'package:pedala/features/login/data/models/user_auth_dto.dart';
import 'package:pedala/features/login/data/models/user_dto.dart';

abstract class AuthApiService {
  Future<UserAuthDto> login(
      {required String username, required String password});

  Future<UserDto> signup(
      {required String firstname,
      required String lastname,
      required String username,
      required String password});
}

class AuthApiServiceImpl extends AuthApiService {
  var client = http.Client();

  @override
  Future<UserAuthDto> login(
      {required String username, required String password}) async {
    final requestBody = jsonEncode(<String, String>{
      'username': username,
      'password': password,
    });
    dynamic result = await _postUserToUrl(
        Uri.parse(baseUrl + '/api/passenger/login'),
        body: requestBody);
    return UserAuthDto.fromJson(json.decode(result));
  }

  @override
  Future<UserDto> signup(
      {required String firstname,
      required String lastname,
      required String username,
      required String password}) async {
    final requestBody = jsonEncode(<String, String>{
      'firstname': firstname,
      'lastname': lastname,
      'username': username,
      'password': password,
    });
    dynamic result = await _postUserToUrl(Uri.parse(baseUrl + '/api/passenger'),
        body: requestBody);
    return UserDto.fromJson(json.decode(result));
  }

  Future<dynamic> _postUserToUrl(Uri url, {Object? body}) async {
    final response = await client.post(
      url,
      headers: {
        httpContentType: httpApplicationJson,
      },
      body: body,
    );

    if (response.statusCode == 200) {
      return response.body;
    } else if (response.statusCode == 404) {
      throw UserNotFoundException();
    } else {
      throw ServerException();
    }
  }
}
