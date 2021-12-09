import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: const SignupView(),
    );
  }
}

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    firstnameController.dispose();
    lastnameController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AutoRouter.of(context);
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.success && !state.isLoading) {
          DialogUtils.showDialogMessage(context,
              title: 'Pedala',
              message: 'Pedala Registration Success', onPressed: () async {
            await context.popRoute();
            await context.popRoute();
          });
        }

        if (state.hasError) {
          DialogUtils.showDialogMessage(context,
              title: 'Pedala',
              message: 'Something Went Wrong', onPressed: () async {
            await context.popRoute();
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
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
                      GestureDetector(
                        onTap: () => context.read<LoginBloc>().loginAs(),
                        child: PedalaText.body(
                          'Are you a ${state.isCustomer ? 'Rider' : 'Customer'} ?\nTap here to signup as ${state.isCustomer ? 'Rider' : 'Customer'}',
                          align: TextAlign.center,
                          color: state.isCustomer
                              ? AppColors.pedalaRed
                              : AppColors.pedalaBlue,
                        ),
                      ),
                      verticalSpaceMedium,
                      PedalaInputField(
                        placeholder: 'Firstname',
                        keyboardType: TextInputType.name,
                        leading: Icon(
                          Icons.person,
                          color: state.isCustomer
                              ? AppColors.pedalaRed
                              : AppColors.pedalaBlue,
                        ),
                        controller: firstnameController,
                      ),
                      verticalSpaceMedium,
                      PedalaInputField(
                        placeholder: 'Lastname',
                        keyboardType: TextInputType.name,
                        leading: Icon(
                          Icons.person,
                          color: state.isCustomer
                              ? AppColors.pedalaRed
                              : AppColors.pedalaBlue,
                        ),
                        controller: lastnameController,
                      ),
                      verticalSpaceMedium,
                      PedalaInputField(
                        placeholder: 'Address',
                        keyboardType: TextInputType.streetAddress,
                        leading: Icon(
                          Icons.location_on,
                          color: state.isCustomer
                              ? AppColors.pedalaRed
                              : AppColors.pedalaBlue,
                        ),
                        controller: addressController,
                      ),
                      verticalSpaceMedium,
                      PedalaInputField(
                        placeholder: 'Contact Number',
                        keyboardType: TextInputType.number,
                        leading: Icon(
                          Icons.phone,
                          color: state.isCustomer
                              ? AppColors.pedalaRed
                              : AppColors.pedalaBlue,
                        ),
                        controller: contactNumberController,
                      ),
                      verticalSpaceMedium,
                      PedalaInputField(
                        placeholder: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        leading: Icon(
                          Icons.email,
                          color: state.isCustomer
                              ? AppColors.pedalaRed
                              : AppColors.pedalaBlue,
                        ),
                        controller: usernameController,
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
                      verticalSpaceMedium,
                      PedalaInputField(
                        placeholder: 'Confirm Password',
                        password: true,
                        leading: Icon(
                          Icons.lock,
                          color: state.isCustomer
                              ? AppColors.pedalaRed
                              : AppColors.pedalaBlue,
                        ),
                        controller: confirmPasswordController,
                      ),
                      verticalSpaceLarge,
                      PedalaButton(
                        title: 'Create Account',
                        buttonColor: state.isCustomer
                            ? AppColors.pedalaRed
                            : AppColors.pedalaBlue,
                        onTap: () => context
                            .read<LoginBloc>()
                            .registrationAccount(
                              firstname: firstnameController.text,
                              lastname: lastnameController.text,
                              userType: state.isCustomer ? 'Customer' : 'Rider',
                              address: addressController.text,
                              contactNo: contactNumberController.text,
                              email: usernameController.text,
                              password: passwordController.text,
                            ),
                      ),
                      verticalSpaceMedium,
                      GestureDetector(
                        onTap: () => context.router.pop(),
                        child: PedalaText.body('Back To Login'),
                      ),
                      verticalSpaceMedium,
                    ],
                  ));
      },
    );
  }
}
