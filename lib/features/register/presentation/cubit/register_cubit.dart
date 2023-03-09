import 'package:dvp_test/core/utils/screen_size.dart';
import 'package:dvp_test/core/widgets/custom_text_field.dart';
import 'package:dvp_test/features/register/data/models/address_model.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState.initial());

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

  void addressDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          backgroundColor: Colors.grey[200]!,
          child: Padding(
            padding: EdgeInsets.only(
              top: ScreenSize.height(dialogContext) * 0.025,
              left: ScreenSize.width(dialogContext) * 0.05,
              right: ScreenSize.width(dialogContext) * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Añadir nueva dirección",
                    style: TextStyle(
                      fontSize: ScreenSize.width(context) * 0.045,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  heightConstant: 0.05,
                  label: "",
                  hint: "Ciudad",
                  controller: TextEditingController(),
                  focus: FocusNode(),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Container(
                      height: ScreenSize.height(context) * 0.05,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[300]!,
                            blurRadius: 0.5,
                          )
                        ],
                      ),
                      child: DropdownButton(
                        value: "Carrera",
                        onChanged: (val) {},
                        items: const [
                          DropdownMenuItem(
                            value: "Calle",
                            child: Text("Calle"),
                          ),
                          DropdownMenuItem(
                            value: "Carrera",
                            child: Text("Carrera"),
                          ),
                          DropdownMenuItem(
                            value: "Avenida",
                            child: Text("Avenida"),
                          ),
                        ],
                        // icon: const SizedBox(),
                        underline: const SizedBox(),
                        style: TextStyle(
                          color: Colors.grey[700]!,
                          fontSize: ScreenSize.width(context) * 0.041,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: CustomTextField(
                        heightConstant: 0.05,
                        label: "",
                        hint: "",
                        controller: TextEditingController(),
                        focus: FocusNode(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text("#"),
                    const SizedBox(width: 10),
                    Flexible(
                      child: CustomTextField(
                        heightConstant: 0.05,
                        label: "",
                        hint: "",
                        controller: TextEditingController(),
                        focus: FocusNode(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text("-"),
                    const SizedBox(width: 10),
                    Flexible(
                      child: CustomTextField(
                        heightConstant: 0.05,
                        label: "",
                        hint: "",
                        controller: TextEditingController(),
                        focus: FocusNode(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
