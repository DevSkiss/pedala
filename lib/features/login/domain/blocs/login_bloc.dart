import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedala/features/login/domain/blocs/login_state.dart';
import 'package:pedala/features/login/domain/repositories/login_repository.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc({required this.loginRepository})
      : super(LoginState(
          isLoading: false,
          success: false,
          hasError: false,
        )) {
    initialized();
  }

  final LoginRepository loginRepository;

  void initialized() async {}

  Future<void> login(
      {required String username, required String password}) async {
    try {
      emit(state.copyWith(
        isLoading: true,
        hasError: false,
        success: false,
      ));
      await Future.delayed(const Duration(seconds: 3));
      await loginRepository.login(username: username, password: password);

      emit(state.copyWith(
        success: true,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        hasError: true,
        isLoading: false,
      ));
    }
  }

  Future<void> createAccount() async {}
}
