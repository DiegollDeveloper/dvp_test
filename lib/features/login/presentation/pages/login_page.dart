import 'package:bloc/bloc.dart';
import 'package:dvp_test/core/helpers/base_screen.dart';
import 'package:flutter/material.dart';

class LoginPage extends BaseScreen {
  const LoginPage({super.key});

  @override
  BlocBase createBloc() {
    // TODO: implement createBloc
    throw UnimplementedError();
  }

  @override
  Widget buildScreen(BuildContext context, BlocBase bloc, state) => Scaffold(
        body: Container(),
      );
}
