import 'package:flutter/material.dart';
import 'package:pedala/app/router/app_router.gr.dart';
import 'package:pedala/features/login/domain/repositories/login_repository.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(PedalaApp());
}

class PedalaApp extends StatelessWidget {
  PedalaApp({Key? key}) : super(key: key);

  final AppRouter _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LoginRepository>.value(
          value: LoginRepositoryImpl(),
        )
      ],
      child: MaterialApp.router(
        title: 'Pedala',
        debugShowCheckedModeBanner: false,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
