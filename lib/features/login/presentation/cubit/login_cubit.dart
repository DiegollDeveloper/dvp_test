// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:dvp_test/navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dvp_test/core/use_case/use_case.dart';
import 'package:dvp_test/core/utils/common_functions.dart';
import 'package:dvp_test/core/utils/common_constants.dart';
import 'package:dvp_test/core/utils/in_app_notification.dart';
import 'package:dvp_test/features/login/data/models/sign_in_data_body.dart';
import 'package:dvp_test/features/login/domain/usecases/sign_in_use_case.dart';
import 'package:dvp_test/features/login/data/models/sign_in_data_response.dart';
import 'package:dvp_test/features/login/domain/usecases/fetch_recent_email_use_case.dart';
import 'package:dvp_test/features/login/domain/usecases/fetch_registered_email_use_case.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final SignInUseCase signInUseCase;
  final FetchRegisteredEmailUseCase fetchRegisteredEmailUseCase;
  final FetchRecentEmailUseCase fetchRecentEmailUseCase;

  LoginCubit({
    required this.signInUseCase,
    required this.fetchRegisteredEmailUseCase,
    required this.fetchRecentEmailUseCase,
  }) : super(LoginState.initial());

  void onLoadPage() {
    fetchRecentEmail();
  }

  void onRegisterTextTap() {
    AppNavigator.push(Routes.register);
  }

  void onShowPasswordButtonTap() {
    emit(state.copyWith(hidePassword: !state.hidePassword));
  }

  bool validateSignInFields(BuildContext? context) {
    if (state.emailController.text.isEmpty) {
      InAppNotification.show(
        context: context,
        message: "Debes ingresar tu correo",
        type: NotificationType.warning,
      );
      return false;
    } else if (!CommonConstants.emailRegExp
        .hasMatch(state.emailController.text)) {
      InAppNotification.show(
        context: context,
        message: "Debes ingresar un correo válido",
        type: NotificationType.warning,
      );
      return false;
    } else if (state.passwordController.text.isEmpty) {
      InAppNotification.show(
        context: context,
        message: "Debes ingresar tu contraseña",
        type: NotificationType.warning,
      );
      return false;
    }
    return true;
  }

  Future<void> fetchRecentEmail() async {
    final result = await fetchRecentEmailUseCase(NoParams());
    result.fold(
      (l) => null,
      (r) {
        state.emailController.text = r;
        emit(state.copyWith());
      },
    );
  }

  Future<bool?> fetchRegisteredEmail(BuildContext? context) async {
    final result =
        await fetchRegisteredEmailUseCase(state.emailController.text);
    return result.fold(
      (l) {
        InAppNotification.show(
          context: context!.mounted ? context : null,
          title: "Ocurrió un error",
          message: "Intenta nuevamente",
          type: NotificationType.error,
        );
        return null;
      },
      (r) {
        if (!r) {
          InAppNotification.show(
            context: context!.mounted ? context : null,
            message: "Usuario o contraseña incorrectos",
            type: NotificationType.error,
          );
          return false;
        } else {
          return true;
        }
      },
    );
  }

  Future<void> signIn(BuildContext? context) async {
    final result = await signInUseCase(
      SignInDataBody(
        email: state.emailController.text,
        password: state.passwordController.text,
      ),
    );
    emit(state.copyWith(joinning: false));
    result.fold(
      (l) => InAppNotification.show(
        title: "No se puedo iniciar sesión",
        message: "Intenta nuevamente",
        type: NotificationType.error,
      ),
      (r) {
        if (r.signInResponse == SignInResponse.incorrectPassword) {
          InAppNotification.show(
            context: context,
            message: "Usuario o contraseña incorrectos",
            type: NotificationType.error,
          );
          return;
        }
        if (context != null) {
          goToHomePage();
        }
      },
    );
  }

  Future<void> onSignInButtonTap(BuildContext? context) async {
    CommonFunctions.unfocusAllFields(context);
    emit(state.copyWith(joinning: true));
    if (!validateSignInFields(context) ||
        await fetchRegisteredEmail(context) == false) {
      emit(state.copyWith(joinning: false));
      return;
    }
    signIn(context);
  }

  void goToHomePage() {
    AppNavigator.pushNamedAndRemoveUntil(Routes.home, arguments: {
      "email": state.emailController.text,
    });
  }
}
