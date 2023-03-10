part of 'login_cubit.dart';

class LoginState {
  final bool loadingPage;
  final bool joinning;
  final bool hidePassword;

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final FocusNode emailFocus;
  final FocusNode passwordFocus;

  const LoginState({
    required this.loadingPage,
    required this.joinning,
    required this.hidePassword,
    required this.emailController,
    required this.passwordController,
    required this.emailFocus,
    required this.passwordFocus,
  });

  factory LoginState.initial() => LoginState(
        loadingPage: false,
        joinning: false,
        hidePassword: true,
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
        emailFocus: FocusNode(),
        passwordFocus: FocusNode(),
      );

  LoginState copyWith({
    bool? loadingPage,
    bool? joinning,
    bool? hidePassword,
  }) =>
      LoginState(
        loadingPage: loadingPage ?? this.loadingPage,
        joinning: joinning ?? this.joinning,
        hidePassword: hidePassword ?? this.hidePassword,
        emailController: emailController,
        passwordController: passwordController,
        emailFocus: emailFocus,
        passwordFocus: passwordFocus,
      );
}
