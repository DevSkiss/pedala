import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:pedala/features/dashboard/presentation/driver_dashboard_screen.dart';
import 'package:pedala/features/home/presentation/screens/category_detail_screen.dart';
import 'package:pedala/features/home/presentation/screens/food_detail_screen.dart';
import 'package:pedala/features/home/presentation/screens/home_screen.dart';
import 'package:pedala/features/home/presentation/screens/order_confirmation_screen.dart';
import 'package:pedala/features/login/presentation/screens/login_screen.dart';
import 'package:pedala/features/login/presentation/screens/signup_screen.dart';
import 'package:pedala/features/menu/presentation/screens/menu_screen.dart';
import 'package:pedala/features/menu_driver/presentation/screens/menu_driver_screen.dart';
import 'package:pedala/features/recent_orders/presentation/recent_orders_screen.dart';
import 'package:pedala/features/track_order/presentation/screens/track_order_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute<dynamic>>[
    AutoRoute<dynamic>(
      initial: true,
      path: '/',
      page: LoginScreen,
    ),
    AutoRoute<dynamic>(
      path: '/signup',
      page: SignupScreen,
    ),
    AutoRoute<dynamic>(
      path: 'dashboard',
      name: 'DriverDashboardRoute',
      page: DriverDashboardScreen,
    ),
    AutoRoute<dynamic>(
      path: '/menudriver',
      page: MenuDriverScreen,
      children: [
        AutoRoute(
            path: 'orderRoute',
            name: 'OrderRoute',
            page: EmptyRouterPage,
            children: [
              AutoRoute(
                path: '',
                page: DriverDashboardScreen,
              ),
            ]),
        AutoRoute(
            path: 'recentRoute',
            name: 'RecentRoute',
            page: EmptyRouterPage,
            children: [
              AutoRoute<dynamic>(
                path: '',
                page: RecentOrdersScreen,
              ),
              AutoRoute<dynamic>(
                path: 'order',
                name: 'OrderConfirmation',
                page: OrderConfirmationScreen,
              ),
            ]),
      ],
    ),
    AutoRoute<dynamic>(
      path: '/menu',
      page: MenuScreen,
      children: [
        AutoRoute(
            path: 'homeroute',
            name: 'HomeRoute',
            page: EmptyRouterPage,
            children: [
              AutoRoute(
                path: '',
                page: HomeScreen,
              ),
              AutoRoute<dynamic>(
                path: 'category',
                name: 'CategoryDetailScreen',
                page: CategoryDetailScreen,
              ),
              AutoRoute<dynamic>(
                path: 'food',
                name: 'FoodDetailScreen',
                page: FoodDetailScreen,
              ),
            ]),
        AutoRoute(
            path: 'trackOrderRoute',
            name: 'TrackOrderRoute',
            page: EmptyRouterPage,
            children: [
              AutoRoute<dynamic>(
                path: '',
                page: TrackOrderScreen,
              ),
              AutoRoute<dynamic>(
                path: 'order',
                name: 'OrderConfirmation',
                page: OrderConfirmationScreen,
              ),
            ]),
      ],
    ),
  ],
)
class $AppRouter {}
