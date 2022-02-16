import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pedala/app/router/app_router.gr.dart';

class MenuDriverScreen extends StatefulWidget {
  const MenuDriverScreen({Key? key}) : super(key: key);

  @override
  State<MenuDriverScreen> createState() => _MenuDriverScreenState();
}

class _MenuDriverScreenState extends State<MenuDriverScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        routes: const [
          OrderRoute(),
          RecentRoute(),
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: const [
              BottomNavigationBarItem(
                label: 'Orders',
                icon: Icon(
                  Icons.food_bank_outlined,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Recent Orders',
                icon: Icon(Icons.list_alt_rounded),
              ),
            ],
          );
        });
  }
}
