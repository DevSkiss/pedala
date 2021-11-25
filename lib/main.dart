import 'package:flutter/material.dart';
import 'package:pedala/app/router/app_router.gr.dart';
import 'package:permission_handler/permission_handler.dart';
import 'app/locator_injection.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const PedalaApp());
}

class PedalaApp extends StatefulWidget {
  const PedalaApp({Key? key}) : super(key: key);

  @override
  State<PedalaApp> createState() => _PedalaAppState();
}

class _PedalaAppState extends State<PedalaApp> {
  final AppRouter _appRouter = AppRouter();

  @override
  void initState() {
    permission();
    super.initState();
  }

  void permission() async {
    if (await Permission.location.isDenied ||
        await Permission.location.isRestricted) {
      await Permission.location.request();
    }
  }

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
