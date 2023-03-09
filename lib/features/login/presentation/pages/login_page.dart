import 'package:dvp_test/core/widgets/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:dvp_test/injection_container.dart';
import 'package:dvp_test/core/utils/screen_size.dart';
import 'package:dvp_test/core/helpers/base_screen.dart';
import 'package:dvp_test/core/widgets/custom_text_field.dart';
import 'package:dvp_test/features/login/presentation/cubit/login_cubit.dart';

class LoginPage extends BaseScreen<LoginState, LoginCubit> {
  const LoginPage({super.key});

  @override
  LoginCubit createBloc() => sl<LoginCubit>()..onLoadPage();

  @override
  Widget buildScreen(BuildContext context, LoginCubit bloc, LoginState state) =>
      Scaffold(
        backgroundColor: Colors.grey[300],
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenSize.width(context) * 0.1,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.email,
                color: Colors.purple,
                size: ScreenSize.width(context) * 0.4,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                label: "Correo electrónico",
                controller: state.emailController,
                focus: state.emailFocus,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                label: "Contraseña",
                controller: state.passwordController,
                focus: state.passwordFocus,
              ),
              const SizedBox(height: 20),
              CustomButton(
                loading: false,
                text: "Iniciar sesión",
                onTap: () {},
              ),
              const SizedBox(height: 60),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: ScreenSize.width(context) * 0.04,
                  ),
                  children: [
                    const TextSpan(
                      text: "Aún no tengo una cuenta. ",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => bloc.onRegisterTextTap(),
                      text: "REGISTRARME",
                      style: const TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
