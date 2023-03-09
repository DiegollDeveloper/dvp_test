part of 'home_cubit.dart';

class HomeState {
  final bool loadingPage;

  const HomeState({
    required this.loadingPage,
  });

  factory HomeState.initial() => const HomeState(loadingPage: false);

  HomeState copyWith({
    bool? loadingPage,
  }) =>
      HomeState(
        loadingPage: loadingPage ?? this.loadingPage,
      );
}
