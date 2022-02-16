// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i13;

import '../../features/dashboard/presentation/driver_dashboard_screen.dart'
    as _i3;
import '../../features/home/data/models/food_category_dto.dart' as _i14;
import '../../features/home/data/models/food_dto.dart' as _i15;
import '../../features/home/presentation/screens/category_detail_screen.dart'
    as _i10;
import '../../features/home/presentation/screens/food_detail_screen.dart'
    as _i11;
import '../../features/home/presentation/screens/home_screen.dart' as _i9;
import '../../features/home/presentation/screens/order_confirmation_screen.dart'
    as _i8;
import '../../features/login/presentation/screens/login_screen.dart' as _i1;
import '../../features/login/presentation/screens/signup_screen.dart' as _i2;
import '../../features/menu/presentation/screens/menu_screen.dart' as _i5;
import '../../features/menu_driver/presentation/screens/menu_driver_screen.dart'
    as _i4;
import '../../features/recent_orders/presentation/recent_orders_screen.dart'
    as _i7;
import '../../features/track_order/presentation/screens/track_order_screen.dart'
    as _i12;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    LoginScreen.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.LoginScreen());
    },
    SignupScreen.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.SignupScreen());
    },
    DriverDashboardRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.DriverDashboardScreen());
    },
    MenuDriverScreen.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.MenuDriverScreen());
    },
    MenuScreen.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.MenuScreen());
    },
    OrderRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    RecentRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    DriverDashboardScreen.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.DriverDashboardScreen());
    },
    RecentOrdersScreen.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.RecentOrdersScreen());
    },
    OrderConfirmation.name: (routeData) {
      final args = routeData.argsAs<OrderConfirmationArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i8.OrderConfirmationScreen(
              key: args.key,
              customerLat: args.customerLat,
              customerLong: args.customerLong,
              riderLat: args.riderLat,
              riderLong: args.riderLong,
              isCustomer: args.isCustomer));
    },
    HomeRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    TrackOrderRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.EmptyRouterPage());
    },
    HomeScreen.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.HomeScreen());
    },
    CategoryDetailScreen.name: (routeData) {
      final args = routeData.argsAs<CategoryDetailScreenArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.CategoryDetailScreen(
              key: args.key, foodCategory: args.foodCategory));
    },
    FoodDetailScreen.name: (routeData) {
      final args = routeData.argsAs<FoodDetailScreenArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i11.FoodDetailScreen(key: args.key, food: args.food));
    },
    TrackOrderScreen.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i12.TrackOrderScreen());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(LoginScreen.name, path: '/'),
        _i6.RouteConfig(SignupScreen.name, path: '/signup'),
        _i6.RouteConfig(DriverDashboardRoute.name, path: 'dashboard'),
        _i6.RouteConfig(MenuDriverScreen.name, path: '/menudriver', children: [
          _i6.RouteConfig(OrderRoute.name,
              path: 'orderRoute',
              parent: MenuDriverScreen.name,
              children: [
                _i6.RouteConfig(DriverDashboardScreen.name,
                    path: '', parent: OrderRoute.name)
              ]),
          _i6.RouteConfig(RecentRoute.name,
              path: 'recentRoute',
              parent: MenuDriverScreen.name,
              children: [
                _i6.RouteConfig(RecentOrdersScreen.name,
                    path: '', parent: RecentRoute.name),
                _i6.RouteConfig(OrderConfirmation.name,
                    path: 'order', parent: RecentRoute.name)
              ])
        ]),
        _i6.RouteConfig(MenuScreen.name, path: '/menu', children: [
          _i6.RouteConfig(HomeRoute.name,
              path: 'homeroute',
              parent: MenuScreen.name,
              children: [
                _i6.RouteConfig(HomeScreen.name,
                    path: '', parent: HomeRoute.name),
                _i6.RouteConfig(CategoryDetailScreen.name,
                    path: 'category', parent: HomeRoute.name),
                _i6.RouteConfig(FoodDetailScreen.name,
                    path: 'food', parent: HomeRoute.name)
              ]),
          _i6.RouteConfig(TrackOrderRoute.name,
              path: 'trackOrderRoute',
              parent: MenuScreen.name,
              children: [
                _i6.RouteConfig(TrackOrderScreen.name,
                    path: '', parent: TrackOrderRoute.name),
                _i6.RouteConfig(OrderConfirmation.name,
                    path: 'order', parent: TrackOrderRoute.name)
              ])
        ])
      ];
}

/// generated route for [_i1.LoginScreen]
class LoginScreen extends _i6.PageRouteInfo<void> {
  const LoginScreen() : super(name, path: '/');

  static const String name = 'LoginScreen';
}

/// generated route for [_i2.SignupScreen]
class SignupScreen extends _i6.PageRouteInfo<void> {
  const SignupScreen() : super(name, path: '/signup');

  static const String name = 'SignupScreen';
}

/// generated route for [_i3.DriverDashboardScreen]
class DriverDashboardRoute extends _i6.PageRouteInfo<void> {
  const DriverDashboardRoute() : super(name, path: 'dashboard');

  static const String name = 'DriverDashboardRoute';
}

/// generated route for [_i4.MenuDriverScreen]
class MenuDriverScreen extends _i6.PageRouteInfo<void> {
  const MenuDriverScreen({List<_i6.PageRouteInfo>? children})
      : super(name, path: '/menudriver', initialChildren: children);

  static const String name = 'MenuDriverScreen';
}

/// generated route for [_i5.MenuScreen]
class MenuScreen extends _i6.PageRouteInfo<void> {
  const MenuScreen({List<_i6.PageRouteInfo>? children})
      : super(name, path: '/menu', initialChildren: children);

  static const String name = 'MenuScreen';
}

/// generated route for [_i6.EmptyRouterPage]
class OrderRoute extends _i6.PageRouteInfo<void> {
  const OrderRoute({List<_i6.PageRouteInfo>? children})
      : super(name, path: 'orderRoute', initialChildren: children);

  static const String name = 'OrderRoute';
}

/// generated route for [_i6.EmptyRouterPage]
class RecentRoute extends _i6.PageRouteInfo<void> {
  const RecentRoute({List<_i6.PageRouteInfo>? children})
      : super(name, path: 'recentRoute', initialChildren: children);

  static const String name = 'RecentRoute';
}

/// generated route for [_i3.DriverDashboardScreen]
class DriverDashboardScreen extends _i6.PageRouteInfo<void> {
  const DriverDashboardScreen() : super(name, path: '');

  static const String name = 'DriverDashboardScreen';
}

/// generated route for [_i7.RecentOrdersScreen]
class RecentOrdersScreen extends _i6.PageRouteInfo<void> {
  const RecentOrdersScreen() : super(name, path: '');

  static const String name = 'RecentOrdersScreen';
}

/// generated route for [_i8.OrderConfirmationScreen]
class OrderConfirmation extends _i6.PageRouteInfo<OrderConfirmationArgs> {
  OrderConfirmation(
      {_i13.Key? key,
      required String customerLat,
      required String customerLong,
      required String riderLat,
      required String riderLong,
      bool isCustomer = false})
      : super(name,
            path: 'order',
            args: OrderConfirmationArgs(
                key: key,
                customerLat: customerLat,
                customerLong: customerLong,
                riderLat: riderLat,
                riderLong: riderLong,
                isCustomer: isCustomer));

  static const String name = 'OrderConfirmation';
}

class OrderConfirmationArgs {
  const OrderConfirmationArgs(
      {this.key,
      required this.customerLat,
      required this.customerLong,
      required this.riderLat,
      required this.riderLong,
      this.isCustomer = false});

  final _i13.Key? key;

  final String customerLat;

  final String customerLong;

  final String riderLat;

  final String riderLong;

  final bool isCustomer;

  @override
  String toString() {
    return 'OrderConfirmationArgs{key: $key, customerLat: $customerLat, customerLong: $customerLong, riderLat: $riderLat, riderLong: $riderLong, isCustomer: $isCustomer}';
  }
}

/// generated route for [_i6.EmptyRouterPage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(name, path: 'homeroute', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for [_i6.EmptyRouterPage]
class TrackOrderRoute extends _i6.PageRouteInfo<void> {
  const TrackOrderRoute({List<_i6.PageRouteInfo>? children})
      : super(name, path: 'trackOrderRoute', initialChildren: children);

  static const String name = 'TrackOrderRoute';
}

/// generated route for [_i9.HomeScreen]
class HomeScreen extends _i6.PageRouteInfo<void> {
  const HomeScreen() : super(name, path: '');

  static const String name = 'HomeScreen';
}

/// generated route for [_i10.CategoryDetailScreen]
class CategoryDetailScreen extends _i6.PageRouteInfo<CategoryDetailScreenArgs> {
  CategoryDetailScreen(
      {_i13.Key? key, required _i14.FoodCategoryDto foodCategory})
      : super(name,
            path: 'category',
            args:
                CategoryDetailScreenArgs(key: key, foodCategory: foodCategory));

  static const String name = 'CategoryDetailScreen';
}

class CategoryDetailScreenArgs {
  const CategoryDetailScreenArgs({this.key, required this.foodCategory});

  final _i13.Key? key;

  final _i14.FoodCategoryDto foodCategory;

  @override
  String toString() {
    return 'CategoryDetailScreenArgs{key: $key, foodCategory: $foodCategory}';
  }
}

/// generated route for [_i11.FoodDetailScreen]
class FoodDetailScreen extends _i6.PageRouteInfo<FoodDetailScreenArgs> {
  FoodDetailScreen({_i13.Key? key, required _i15.FoodDto food})
      : super(name,
            path: 'food', args: FoodDetailScreenArgs(key: key, food: food));

  static const String name = 'FoodDetailScreen';
}

class FoodDetailScreenArgs {
  const FoodDetailScreenArgs({this.key, required this.food});

  final _i13.Key? key;

  final _i15.FoodDto food;

  @override
  String toString() {
    return 'FoodDetailScreenArgs{key: $key, food: $food}';
  }
}

/// generated route for [_i12.TrackOrderScreen]
class TrackOrderScreen extends _i6.PageRouteInfo<void> {
  const TrackOrderScreen() : super(name, path: '');

  static const String name = 'TrackOrderScreen';
}
