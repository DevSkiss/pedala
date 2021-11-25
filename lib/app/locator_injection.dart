import 'package:get_it/get_it.dart';
import 'package:pedala/features/login/data/services/auth_api_service.dart';
import 'package:pedala/features/login/domain/blocs/login_bloc.dart';
import 'package:pedala/features/login/domain/repositories/login_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> init() async {
  // Blocs
  locator.registerFactory(
    () => LoginBloc(),
  );

  // Services
  locator.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl());
  locator.registerLazySingleton<AuthApiService>(() => AuthApiServiceImpl());

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => sharedPreferences);
}
