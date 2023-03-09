part of 'home_cubit.dart';

class HomeState {
  final bool loadingPage;
  final bool dataError;

  final UserData userData;

  const HomeState({
    required this.loadingPage,
    required this.dataError,
    required this.userData,
  });

  factory HomeState.initial() => HomeState(
        loadingPage: false,
        dataError: false,
        userData: UserData(),
      );

  HomeState copyWith({
    bool? loadingPage,
    bool? dataError,
    UserData? userData,
  }) =>
      HomeState(
        loadingPage: loadingPage ?? this.loadingPage,
        dataError: dataError ?? this.dataError,
        userData: userData ?? this.userData,
      );
}
