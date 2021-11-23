import 'package:flutter/material.dart';
import 'package:pedala/core/domain/utils/app_colors.dart';
import 'package:pedala/features/home/presentation/screens/home_screen.dart';
import 'package:pedala/features/profile/presentation/screens/profile_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildScreens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_sharp),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.pedalaRed,
        onTap: _onItemTapped,
      ),
    );
  }

  List<Widget> buildScreens = <Widget>[
    const HomeScreen(),
    const ProfileScreen(),
  ];
}
