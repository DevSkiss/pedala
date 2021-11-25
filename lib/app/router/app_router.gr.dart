// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../../features/home/data/models/food_category_dto.dart' as _i11;
import '../../features/home/data/models/food_dto.dart' as _i12;
import '../../features/home/presentation/screens/category_detail_screen.dart'
    as _i6;
import '../../features/home/presentation/screens/food_detail_screen.dart'
    as _i7;
import '../../features/home/presentation/screens/home_screen.dart' as _i4;
import '../../features/home/presentation/screens/order_confirmation_screen.dart'
    as _i8;
import '../../features/login/presentation/screens/login_screen.dart' as _i1;
import '../../features/login/presentation/screens/signup_screen.dart' as _i2;
import '../../features/menu/presentation/screens/menu_screen.dart' as _i3;
import '../../features/profile/presentation/screens/profile_screen.dart' as _i5;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    LoginScreen.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginScreen());
    },
    SignupScreen.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignupScreen());
    },
    MenuScreen.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.MenuScreen());
    },
    HomeRouter.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.HomeScreen());
    },
    ProfileRouter.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.ProfileScreen());
    },
    CategoryDetailScreen.name: (routeData) {
      final args = routeData.argsAs<CategoryDetailScreenArgs>();
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.CategoryDetailScreen(
              key: args.key, foodCategory: args.foodCategory));
    },
    FoodDetailScreen.name: (routeData) {
      final args = routeData.argsAs<FoodDetailScreenArgs>();
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.FoodDetailScreen(key: args.key, food: args.food));
    },
    OrderConfirmation.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.OrderConfirmationScreen());
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(LoginScreen.name, path: '/'),
        _i9.RouteConfig(SignupScreen.name, path: '/signup'),
        _i9.RouteConfig(MenuScreen.name, path: '/menu', children: [
          _i9.RouteConfig(HomeRouter.name,
              path: 'home',
              parent: MenuScreen.name,
              children: [
                _i9.RouteConfig(CategoryDetailScreen.name,
                    path: 'category', parent: HomeRouter.name),
                _i9.RouteConfig(FoodDetailScreen.name,
                    path: 'food', parent: HomeRouter.name),
                _i9.RouteConfig(OrderConfirmation.name,
                    path: 'order', parent: HomeRouter.name)
              ]),
          _i9.RouteConfig(ProfileRouter.name,
              path: 'profile', parent: MenuScreen.name)
        ])
      ];
}

/// generated route for [_i1.LoginScreen]
class LoginScreen extends _i9.PageRouteInfo<void> {
  const LoginScreen() : super(name, path: '/');

  static const String name = 'LoginScreen';
}

/// generated route for [_i2.SignupScreen]
class SignupScreen extends _i9.PageRouteInfo<void> {
  const SignupScreen() : super(name, path: '/signup');

  static const String name = 'SignupScreen';
}

/// generated route for [_i3.MenuScreen]
class MenuScreen extends _i9.PageRouteInfo<void> {
  const MenuScreen({List<_i9.PageRouteInfo>? children})
      : super(name, path: '/menu', initialChildren: children);

  static const String name = 'MenuScreen';
}

/// generated route for [_i4.HomeScreen]
class HomeRouter extends _i9.PageRouteInfo<void> {
  const HomeRouter({List<_i9.PageRouteInfo>? children})
      : super(name, path: 'home', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for [_i5.ProfileScreen]
class ProfileRouter extends _i9.PageRouteInfo<void> {
  const ProfileRouter() : super(name, path: 'profile');

  static const String name = 'ProfileRouter';
}

/// generated route for [_i6.CategoryDetailScreen]
class CategoryDetailScreen extends _i9.PageRouteInfo<CategoryDetailScreenArgs> {
  CategoryDetailScreen(
      {_i10.Key? key, required _i11.FoodCategoryDto foodCategory})
      : super(name,
            path: 'category',
            args:
                CategoryDetailScreenArgs(key: key, foodCategory: foodCategory));

  static const String name = 'CategoryDetailScreen';
}

class CategoryDetailScreenArgs {
  const CategoryDetailScreenArgs({this.key, required this.foodCategory});

  final _i10.Key? key;

  final _i11.FoodCategoryDto foodCategory;

  @override
  String toString() {
    return 'CategoryDetailScreenArgs{key: $key, foodCategory: $foodCategory}';
  }
}

/// generated route for [_i7.FoodDetailScreen]
class FoodDetailScreen extends _i9.PageRouteInfo<FoodDetailScreenArgs> {
  FoodDetailScreen({_i10.Key? key, required _i12.FoodDto food})
      : super(name,
            path: 'food', args: FoodDetailScreenArgs(key: key, food: food));

  static const String name = 'FoodDetailScreen';
}

class FoodDetailScreenArgs {
  const FoodDetailScreenArgs({this.key, required this.food});

  final _i10.Key? key;

  final _i12.FoodDto food;

  @override
  String toString() {
    return 'FoodDetailScreenArgs{key: $key, food: $food}';
  }
}

/// generated route for [_i8.OrderConfirmationScreen]
class OrderConfirmation extends _i9.PageRouteInfo<void> {
  const OrderConfirmation() : super(name, path: 'order');

  static const String name = 'OrderConfirmation';
}
