import 'package:flutter/material.dart';
import 'package:dvp_test/injection_container.dart';
import 'package:dvp_test/core/helpers/base_screen.dart';
import 'package:dvp_test/features/home/presentation/cubit/home_cubit.dart';

class HomeScreen extends BaseScreen<HomeState, HomeCubit> {
  const HomeScreen({super.key});

  @override
  HomeCubit createBloc() => sl<HomeCubit>()..onLoadPage();

  @override
  Widget buildScreen(BuildContext context, HomeCubit bloc, HomeState state) {
    return Scaffold(
      body: Container(),
    );
  }
}
