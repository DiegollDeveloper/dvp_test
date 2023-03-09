import 'package:bloc/bloc.dart';
import 'package:dvp_test/core/helpers/base_screen.dart';
import 'package:dvp_test/features/login/presentation/cubit/login_cubit.dart';
import 'package:dvp_test/injection_container.dart';
import 'package:flutter/material.dart';

class LoginPage extends BaseScreen {
  const LoginPage({super.key});

  @override
  BlocBase createBloc() => sl<LoginCubit>()..onLoadPage();

  @override
  Widget buildScreen(BuildContext context, BlocBase bloc, state) => Scaffold(
        body: Container(),
      );
}
