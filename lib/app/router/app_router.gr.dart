// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../features/login/presentation/screens/login_screen.dart' as _i1;
import '../../features/login/presentation/screens/signup_screen.dart' as _i2;
import '../../features/menu/presentation/screens/menu_screen.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    LoginScreen.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginScreen());
    },
    SignupScreen.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignupScreen());
    },
    MenuScreen.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.MenuScreen());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(LoginScreen.name, path: '/'),
        _i4.RouteConfig(SignupScreen.name, path: '/signup'),
        _i4.RouteConfig(MenuScreen.name, path: '/menu')
      ];
}

/// generated route for [_i1.LoginScreen]
class LoginScreen extends _i4.PageRouteInfo<void> {
  const LoginScreen() : super(name, path: '/');

  static const String name = 'LoginScreen';
}

/// generated route for [_i2.SignupScreen]
class SignupScreen extends _i4.PageRouteInfo<void> {
  const SignupScreen() : super(name, path: '/signup');

  static const String name = 'SignupScreen';
}

/// generated route for [_i3.MenuScreen]
class MenuScreen extends _i4.PageRouteInfo<void> {
  const MenuScreen() : super(name, path: '/menu');

  static const String name = 'MenuScreen';
}
