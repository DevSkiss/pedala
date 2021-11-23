// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../../features/login/presentation/screens/login_screen.dart' as _i1;
import '../../features/login/presentation/screens/signup_screen.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    LoginScreen.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginScreen());
    },
    SignupScreen.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignupScreen());
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(LoginScreen.name, path: '/'),
        _i3.RouteConfig(SignupScreen.name, path: '/signup')
      ];
}

/// generated route for [_i1.LoginScreen]
class LoginScreen extends _i3.PageRouteInfo<void> {
  const LoginScreen() : super(name, path: '/');

  static const String name = 'LoginScreen';
}

/// generated route for [_i2.SignupScreen]
class SignupScreen extends _i3.PageRouteInfo<void> {
  const SignupScreen() : super(name, path: '/signup');

  static const String name = 'SignupScreen';
}
