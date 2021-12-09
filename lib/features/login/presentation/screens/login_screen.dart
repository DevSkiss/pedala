import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pedala/app/router/app_router.gr.dart';
import 'package:pedala/core/domain/utils/app_colors.dart';
import 'package:pedala/core/domain/utils/dialog_utils.dart';
import 'package:pedala/core/domain/utils/ui_helpers.dart';
import 'package:pedala/core/presentation/widgets/pedala_button.dart';
import 'package:pedala/core/presentation/widgets/pedala_text.dart';
import 'package:pedala/core/presentation/widgets/pedala_textfield.dart';
import 'package:pedala/core/presentation/widgets/scrollable_column.dart';
import 'package:pedala/features/login/domain/blocs/login_bloc.dart';
import 'package:pedala/features/login/domain/blocs/login_state.dart';
import 'package:pedala/generated/assets.gen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    AutoRouter.of(context);
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.hasError) {
          DialogUtils.showDialogMessage(context,
              title: 'Pedala',
              message: 'Username and Password is Incorrect', onPressed: () {
            emailController.clear();
            passwordController.clear();
            context.router.pop();
          });
        }

        if (state.hasErrorLogin) {
          DialogUtils.showDialogMessage(context,
              title: 'Error Logging in',
              message:
                  'If you are a ${state.isCustomer ? 'Rider' : 'Customer'}. Please login as ${state.isCustomer ? 'Rider' : 'Customer'}',
              onPressed: () {
            context.router.pop();
          });
        }

        if ((state.userType == 'customer' || state.isAlreadyLoggedIn) &&
            !state.isLoading) {
          context.router.replace(const MenuScreen());
        }

        if (state.userType == 'rider' && !state.isLoading) {
          context.router.replace(const MenuDriverScreen());
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: state.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ScrollableColumn(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: <Widget>[
                      const SizedBox(height: 50),
                      Image.asset(
                        Assets.images.logo.path,
                        height: 200,
                        width: 200,
                      ),
                      PedalaText.body(
                          'You are logging in as ${state.isCustomer ? 'Customer' : 'Rider'}'),
                      verticalSpaceMedium,
                      PedalaInputField(
                        placeholder: 'Email',
                        leading: Icon(
                          Icons.email_outlined,
                          color: state.isCustomer
                              ? AppColors.pedalaRed
                              : AppColors.pedalaBlue,
                        ),
                        controller: emailController,
                      ),
                      verticalSpaceMedium,
                      PedalaInputField(
                        placeholder: 'Password',
                        password: true,
                        leading: Icon(
                          Icons.lock,
                          color: state.isCustomer
                              ? AppColors.pedalaRed
                              : AppColors.pedalaBlue,
                        ),
                        controller: passwordController,
                      ),
                      verticalSpaceLarge,
                      PedalaButton(
                        title: 'Login',
                        buttonColor: state.isCustomer
                            ? AppColors.pedalaRed
                            : AppColors.pedalaBlue,
                        onTap: () => context.read<LoginBloc>().login(
                              email: emailController.text,
                              password: passwordController.text,
                              isCustomer: state.isCustomer,
                            ),
                      ),
                      verticalSpaceMedium,
                      GestureDetector(
                        onTap: () => context.router.push(const SignupScreen()),
                        child: PedalaText.body('Create Account'),
                      ),
                      verticalSpaceMedium,
                      GestureDetector(
                        onTap: () => context.read<LoginBloc>().loginAs(),
                        child: PedalaText.body(
                            'Login as ${!state.isCustomer ? 'Customer' : 'Rider'}'),
                      )
                    ],
                  ));
      },
    );
  }
}
