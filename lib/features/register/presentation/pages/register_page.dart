import 'package:dvp_test/core/utils/common_functions.dart';
import 'package:dvp_test/core/widgets/custom_button.dart';
import 'package:dvp_test/core/widgets/custom_text_field.dart';
import 'package:dvp_test/features/register/presentation/widgets/custom_date_field.dart';
import 'package:dvp_test/navigator.dart';
import 'package:flutter/material.dart';
import 'package:dvp_test/core/utils/screen_size.dart';
import 'package:dvp_test/core/helpers/base_screen.dart';
import 'package:dvp_test/features/register/presentation/cubit/register_cubit.dart';
import 'package:dvp_test/injection_container.dart';

class RegisterPage extends BaseScreen<RegisterState, RegisterCubit> {
  const RegisterPage({super.key});

  @override
  RegisterCubit createBloc() => sl<RegisterCubit>()..onLoadPage();

  @override
  Widget buildScreen(
      BuildContext context, RegisterCubit bloc, RegisterState state) {
    return Scaffold(
      backgroundColor: Colors.grey[300]!,
      body: GestureDetector(
        onTap: () => CommonFunctions.unfocusAllFields(context),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: ScreenSize.height(context) * 0.08,
              bottom: ScreenSize.height(context) * 0.05,
              left: ScreenSize.width(context) * 0.1,
              right: ScreenSize.width(context) * 0.1,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  onPressed: () => AppNavigator.pop(),
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.purple,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Registrate completando los siguientes campos",
                  style: TextStyle(
                    fontSize: ScreenSize.width(context) * 0.075,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                ),
                const SizedBox(height: 40),
                CustomTextField(
                  label: "Nombres",
                  controller: state.namesController,
                  focus: state.namesFocus,
                  type: TextFieldType.text,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  label: "Apellidos",
                  controller: state.lastNamesController,
                  focus: state.lastNamesFocus,
                  type: TextFieldType.text,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomDateField(
                  label: "Fecha de nacimiento",
                  date: state.dateSelected
                      ? CommonFunctions.formartDateOfBirth(state.dateOfBirth)
                      : null,
                  onTap: (context) => bloc.selectDateOfBirth(context),
                ),
                const SizedBox(height: 20),
                ListView.builder(
                  primary: false,
                  padding: EdgeInsets.zero,
                  itemCount: state.addresses.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        Flexible(
                          child: CustomTextField(
                            label:
                                "Dirección${(state.addresses.length > 1) ? " ${index + 1}" : ""}",
                            controller:
                                state.addresses[index].addressController,
                            focus: state.addresses[index].addressFocus,
                            type: TextFieldType.text,
                          ),
                        ),
                        if (index != 0)
                          IconButton(
                            onPressed: () =>
                                bloc.onRemoveAddressButtonTap(index),
                            icon: const Icon(
                              Icons.remove,
                              color: Colors.purple,
                            ),
                          )
                      ],
                    ),
                  ),
                ),
                if (state.addresses.length < 4)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextButton(
                        onPressed: () => bloc.onAddAddressButtonTap(),
                        child: Text(
                          "Añadir nueva dirección",
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: ScreenSize.width(context) * 0.04,
                          ),
                        ),
                      ),
                    ),
                  ),
                CustomTextField(
                  label: "Correo electrónico",
                  controller: state.emailController,
                  focus: state.emailFocus,
                  type: TextFieldType.email,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: "Contraseña",
                  controller: state.passwordController,
                  focus: state.passwordFocus,
                  type: TextFieldType.password,
                  hidePassword: state.hidePassword,
                  onSuffixTap: () => bloc.onShowPasswordButtonTap(),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: "Confirmar contraseña",
                  controller: state.confirmPasswordController,
                  focus: state.confirmPasswordFocus,
                  type: TextFieldType.password,
                  hidePassword: state.hideConfirmPassword,
                  onSuffixTap: () => bloc.onShowConfirmPasswordButtonTap(),
                ),
                const SizedBox(height: 50),
                CustomButton(
                  onTap: () => bloc.onRegisterButtonTap(context),
                  loading: state.registeringUserData,
                  text: "Registrarme",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
