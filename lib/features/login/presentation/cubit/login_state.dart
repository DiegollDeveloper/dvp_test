part of 'login_cubit.dart';

class LoginState {
  final bool loadingPage;

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final FocusNode emailFocus;
  final FocusNode passwordFocus;

  const LoginState({
    required this.loadingPage,
    required this.emailController,
    required this.passwordController,
    required this.emailFocus,
    required this.passwordFocus,
  });

  factory LoginState.initial() => LoginState(
        loadingPage: false,
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
        emailFocus: FocusNode(),
        passwordFocus: FocusNode(),
      );

  LoginState copyWith({
    bool? loadingPage,
  }) =>
      LoginState(
        loadingPage: loadingPage ?? this.loadingPage,
        emailController: emailController,
        passwordController: passwordController,
        emailFocus: emailFocus,
        passwordFocus: passwordFocus,
      );

  // @override
  // List<Object> get props => [];
}
