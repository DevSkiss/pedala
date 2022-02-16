import 'package:get_it/get_it.dart';
import 'package:pedala/features/home/data/services/home_api_service.dart';
import 'package:pedala/features/home/domain/blocs/home_bloc.dart';
import 'package:pedala/features/home/domain/repositories/home_repository.dart';
import 'package:pedala/features/login/data/services/auth_api_service.dart';
import 'package:pedala/features/login/domain/blocs/login_bloc.dart';
import 'package:pedala/features/login/domain/repositories/login_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> init() async {
  // Blocs
  locator.registerFactory(() => LoginBloc());
  locator.registerFactory(() => HomeBloc());

  //Repositories
  locator.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl());
  locator.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl());

  // Services
  locator.registerLazySingleton<AuthApiService>(() => AuthApiServiceImpl());
  locator.registerLazySingleton<HomeApiService>(() => HomeApiServiceImpl());

  // Utils
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => sharedPreferences);
}
