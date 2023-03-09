import 'package:dvp_test/core/utils/in_app_notification.dart';
import 'package:dvp_test/features/register/domain/usecases/register_user_data_use_case.dart';
import 'package:dvp_test/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dvp_test/features/register/data/models/address_model.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUserDataUseCase registerUserDataUseCase;

  RegisterCubit({
    required this.registerUserDataUseCase,
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
    } else {
      return true;
    }
  }

  void registerUserData(BuildContext? context) {
    if (!validateRegisterFields(context)) return;
    AppNavigator.pushNamedAndRemoveUntil(Routes.home);
  }
}
