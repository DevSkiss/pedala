import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pedala/core/domain/utils/app_colors.dart';
import 'package:pedala/core/domain/utils/ui_helpers.dart';
import 'package:pedala/core/presentation/widgets/pedala_button.dart';
import 'package:pedala/core/presentation/widgets/pedala_text.dart';
import 'package:pedala/core/presentation/widgets/pedala_textfield.dart';
import 'package:pedala/core/presentation/widgets/scrollable_column.dart';
import 'package:pedala/generated/assets.gen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AutoRouter.of(context);
    return Scaffold(
        body: ScrollableColumn(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: <Widget>[
        const SizedBox(height: 50),
        Image.asset(
          Assets.images.logo.path,
          height: 200,
          width: 200,
        ),
        PedalaInputField(
          placeholder: 'Firstname',
          leading: const Icon(
            Icons.person,
            color: AppColors.pedalaRed,
          ),
          controller: firstnameController,
        ),
        verticalSpaceMedium,
        PedalaInputField(
          placeholder: 'Lastname',
          leading: const Icon(
            Icons.person,
            color: AppColors.pedalaRed,
          ),
          controller: lastnameController,
        ),
        verticalSpaceMedium,
        PedalaInputField(
          placeholder: 'Username',
          leading: const Icon(
            Icons.person,
            color: AppColors.pedalaRed,
          ),
          controller: usernameController,
        ),
        verticalSpaceMedium,
        PedalaInputField(
          placeholder: 'Password',
          password: true,
          leading: const Icon(
            Icons.lock,
            color: AppColors.pedalaRed,
          ),
          controller: passwordController,
        ),
        verticalSpaceMedium,
        PedalaInputField(
          placeholder: 'Confirm Password',
          password: true,
          leading: const Icon(
            Icons.lock,
            color: AppColors.pedalaRed,
          ),
          controller: confirmPasswordController,
        ),
        verticalSpaceLarge,
        PedalaButton(
          title: 'Sign up',
          onTap: () {},
        ),
        verticalSpaceMedium,
        GestureDetector(
          onTap: () => context.router.pop(),
          child: PedalaText.body('Login'),
        )
      ],
    ));
  }
}
