import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:pedala/features/login/presentation/screens/login_screen.dart';
import 'package:pedala/features/login/presentation/screens/signup_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute<dynamic>>[
    AutoRoute<dynamic>(
      initial: true,
      path: '/',
      page: LoginScreen,
      // children: <AutoRoute<dynamic>>[
      //   CustomRoute<dynamic>(
      //     path: '',
      //     page: RestaurantScreen,
      //     transitionsBuilder: TransitionsBuilders.slideTop,
      //   ),
      //   CustomRoute<dynamic>(
      //     path: 'amenities',
      //     page: AmenitiesScreen,
      //     transitionsBuilder: TransitionsBuilders.slideBottom,
      //   ),
      //   CustomRoute<dynamic>(
      //     path: 'checkout',
      //     page: CheckoutScreen,
      //     transitionsBuilder: TransitionsBuilders.fadeIn,
      //   ),
      //   CustomRoute<dynamic>(
      //     path: 'merch',
      //     page: MerchandiseScreen,
      //     transitionsBuilder: TransitionsBuilders.slideBottom,
      //   ),
      //   CustomRoute<dynamic>(
      //     path: 'profile',
      //     page: ProfileScreen,
      //     transitionsBuilder: TransitionsBuilders.slideBottom,
      //   ),
      //   CustomRoute<dynamic>(
      //     path: 'settings',
      //     page: SettingsScreen,
      //     transitionsBuilder: TransitionsBuilders.slideBottom,
      //   ),
      // ],
    ),
    AutoRoute<dynamic>(
      path: '/signup',
      page: SignupScreen,
    )
  ],
)
class $AppRouter {}
