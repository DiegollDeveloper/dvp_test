part of 'login_cubit.dart';

class LoginState extends Equatable {
  final bool loadingPage;

  const LoginState({
    required this.loadingPage,
  });

  factory LoginState.initial() => const LoginState(
        loadingPage: false,
      );

  LoginState copyWith({
    bool? loadingPage,
  }) =>
      LoginState(
        loadingPage: loadingPage ?? this.loadingPage,
      );

  @override
  List<Object> get props => [];
}
