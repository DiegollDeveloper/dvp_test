// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:dvp_test/navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dvp_test/core/utils/common_constants.dart';
import 'package:dvp_test/core/utils/common_functions.dart';
import 'package:dvp_test/core/utils/in_app_notification.dart';
import 'package:dvp_test/features/register/data/models/address_model.dart';
import 'package:dvp_test/features/register/data/models/register_data_body.dart';
import 'package:dvp_test/features/register/domain/usecases/register_user_data_use_case.dart';
import 'package:dvp_test/features/login/domain/usecases/fetch_registered_email_use_case.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUserDataUseCase registerUserDataUseCase;
  final FetchRegisteredEmailUseCase fetchRegisteredEmailUseCase;

  RegisterCubit({
    required this.registerUserDataUseCase,
    required this.fetchRegisteredEmailUseCase,
  }) : super(RegisterState.initial());

  void onLoadPage() {}

  Future<void> selectDateOfBirth(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: state.dateSelected ? state.dateOfBirth : DateTime.now(),
      currentDate: state.dateSelected ? state.dateOfBirth : DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 36500)),
      lastDate: DateTime.now(),
      fieldLabelText: "Escribe la fecha",
      helpText: "Fecha de nacimiento",
      cancelText: "Cancelar",
      confirmText: "Confirmar",
    );

    if (selectedDate != null) {
      emit(
        state.copyWith(
          dateSelected: true,
          dateOfBirth: selectedDate,
        ),
      );
    }
  }

  void onAddAddressButtonTap() {
    state.addresses.add(
      AddressModel(
        addressController: TextEditingController(),
        addressFocus: FocusNode(),
      ),
    );
    emit(state.copyWith());
  }

  void onRemoveAddressButtonTap(int addressIndex) {
    state.addresses.removeAt(addressIndex);
    emit(state.copyWith());
  }

  bool validateAddresses() {
    return state.addresses
        .any((element) => element.addressController.text.isEmpty);
  }

  bool validateRegisterFields(BuildContext? context) {
    if (state.namesController.text.isEmpty) {
      InAppNotification.show(
        context: context,
        message: "Debes agregar tu nombre",
        type: NotificationType.warning,
      );
      return false;
    } else if (state.lastNamesController.text.isEmpty) {
      InAppNotification.show(
        context: context,
        message: "Debes agregar tus apellidos",
        type: NotificationType.warning,
      );
      return false;
    } else if (!state.dateSelected) {
      InAppNotification.show(
        context: context,
        message: "Debes agregar tu fecha de nacimiento",
        type: NotificationType.warning,
      );
      return false;
    } else if (state.addresses.length == 1 &&
        state.addresses.first.addressController.text.isEmpty) {
      InAppNotification.show(
        context: context,
        message: "Debes agregar tu dirección",
        type: NotificationType.warning,
      );
      return false;
    } else if (validateAddresses()) {
      InAppNotification.show(
        context: context,
        message: "Debes completar todas las direcciones",
        type: NotificationType.warning,
      );
      return false;
    } else if (state.emailController.text.isEmpty) {
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
        message: "Debes ingresar una contraseña",
        type: NotificationType.warning,
      );
      return false;
    } else if (state.passwordController.text.length < 6) {
      InAppNotification.show(
        context: context,
        message: "Debes ingresar una contraseña más extensa",
        type: NotificationType.warning,
      );
      return false;
    } else if (state.confirmPasswordController.text.isEmpty) {
      InAppNotification.show(
        context: context,
        message: "Debes confirmar la contraseña",
        type: NotificationType.warning,
      );
      return false;
    } else if (state.passwordController.text !=
        state.confirmPasswordController.text) {
      InAppNotification.show(
        context: context,
        message: "Las contraseñas no coinciden",
        type: NotificationType.warning,
      );
      return false;
    } else {
      return true;
    }
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
        if (r) {
          InAppNotification.show(
            context: context!.mounted ? context : null,
            message: "El correo ya se encuentra registrado",
            type: NotificationType.error,
          );
          return true;
        } else {
          return false;
        }
      },
    );
  }

  Future<void> onRegisterButtonTap(BuildContext? context) async {
    if (!validateRegisterFields(context)) return;
    if (await fetchRegisteredEmail(context) == true) return;
    registerUserData(context);
  }

  Future<void> registerUserData(BuildContext? context) async {
    emit(state.copyWith(registeringUserData: true));
    final result = await registerUserDataUseCase(
      RegisterDataBody(
        names: state.namesController.text,
        lastName: state.lastNamesController.text,
        dateOfBirth: CommonFunctions.formartDateOfBirth(state.dateOfBirth),
        addresses: CommonFunctions.getAddressesStringsList(state.addresses),
        email: state.emailController.text,
        password: CommonFunctions.encrypText(state.passwordController.text),
      ),
    );
    emit(state.copyWith(registeringUserData: false));
    result.fold(
      (l) => InAppNotification.show(
        context: context,
        title: "Ocurrión un error",
        message: "Intenta registrarte nuevamente",
        type: NotificationType.error,
      ),
      (r) {
        if (context != null) {
          goToHomePage();
        }
      },
    );
  }

  void goToHomePage() {
    AppNavigator.pushNamedAndRemoveUntil(
      Routes.home,
      arguments: {"email": state.emailController.text},
    );
  }

  void onShowPasswordButtonTap() {
    emit(state.copyWith(hidePassword: !state.hidePassword));
  }

  void onShowConfirmPasswordButtonTap() {
    emit(state.copyWith(hideConfirmPassword: !state.hideConfirmPassword));
  }
}
