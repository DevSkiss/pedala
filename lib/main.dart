import 'package:flutter/material.dart';
import 'package:pedala/app/router/app_router.gr.dart';
import 'app/locator_injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(PedalaApp());
}

class PedalaApp extends StatelessWidget {
  PedalaApp({Key? key}) : super(key: key);

  final AppRouter _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pedala',
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
