import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pedala/app/router/app_router.gr.dart';
import 'package:pedala/core/presentation/widgets/pedala_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    AutoRouter.of(context);
    return Scaffold(
      body: Center(
        child: PedalaButton(
          title: 'Logout',
          onTap: () => context.router.replace(const LoginScreen()),
        ),
      ),
    );
  }
}
