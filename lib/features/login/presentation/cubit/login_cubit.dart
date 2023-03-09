import 'package:dvp_test/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());

  void onLoadPage() {}

  void onRegisterTextTap() {
    AppNavigator.push(Routes.register);
  }
}
