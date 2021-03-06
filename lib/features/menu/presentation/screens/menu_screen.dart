import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pedala/app/router/app_router.gr.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        routes: const [
          HomeRoute(),
          TrackOrderRoute(),
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: const [
              BottomNavigationBarItem(
                label: 'Users',
                icon: Icon(
                  Icons.home,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Track Orders',
                icon: Icon(Icons.delivery_dining_rounded),
              ),
            ],
          );
        });
  }
}
