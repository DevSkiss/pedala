import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:pedala/features/home/presentation/screens/category_detail_screen.dart';
import 'package:pedala/features/home/presentation/screens/food_detail_screen.dart';
import 'package:pedala/features/home/presentation/screens/home_screen.dart';
import 'package:pedala/features/home/presentation/screens/order_confirmation_screen.dart';
import 'package:pedala/features/login/presentation/screens/login_screen.dart';
import 'package:pedala/features/login/presentation/screens/signup_screen.dart';
import 'package:pedala/features/menu/presentation/screens/menu_screen.dart';
import 'package:pedala/features/profile/presentation/screens/profile_screen.dart';

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
      path: '/menu',
      page: MenuScreen,
      children: [
        AutoRoute(
          path: 'home',
          name: 'HomeRouter',
          page: HomeScreen,
          children: [
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
            AutoRoute<dynamic>(
              path: 'order',
              name: 'OrderConfirmation',
              page: OrderConfirmationScreen,
            )
          ],
        ),
        AutoRoute<dynamic>(
          path: 'profile',
          name: 'ProfileRouter',
          page: ProfileScreen,
        ),
      ],
    ),
  ],
)
class $AppRouter {}
