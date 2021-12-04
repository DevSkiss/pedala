import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pedala/core/domain/utils/constants.dart';
import 'package:pedala/core/domain/utils/exception.dart';
import 'package:pedala/features/login/data/models/user_dto.dart';

abstract class AuthApiService {
  bool get hasUser;
  Future<UserCredential> login(
      {required String email, required String password});

  Future<UserCredential> registration(
      {required String email, required String password});

  Future<UserDto> signup(
      {required String firstname,
      required String lastname,
      required String username,
      required String password});

  Future<void> logout();
}

class AuthApiServiceImpl extends AuthApiService {
  var client = http.Client();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<UserCredential> login(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
        throw FirebaseAuthException(code: '404');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
        throw FirebaseAuthException(code: '401');
      }
    }
    throw UnimplementedError();
  }

  @override
  Future<UserCredential> registration(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
        throw FirebaseAuthException(code: 'weak-password');
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
        throw FirebaseAuthException(code: 'email-already-in-use');
      }
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    await auth.signOut();
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

  @override
  bool get hasUser => auth.currentUser != null;
}
