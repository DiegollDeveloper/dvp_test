import 'package:flutter/material.dart';
import 'package:dvp_test/navigator.dart';
import 'package:dvp_test/injection_container.dart';
import 'package:dvp_test/core/utils/app_colors.dart';
import 'package:dvp_test/core/utils/screen_size.dart';
import 'package:dvp_test/core/helpers/base_screen.dart';
import 'package:dvp_test/core/widgets/custom_button.dart';
import 'package:dvp_test/core/utils/common_functions.dart';
import 'package:dvp_test/core/widgets/custom_text_field.dart';
import 'package:dvp_test/features/register/presentation/pages/addresses_list.dart';
import 'package:dvp_test/features/register/presentation/widgets/custom_date_field.dart';
import 'package:dvp_test/features/register/presentation/cubit/register_cubit.dart';

class RegisterPage extends BaseScreen<RegisterState, RegisterCubit> {
  const RegisterPage({super.key});

  @override
  RegisterCubit createBloc() => sl<RegisterCubit>()..onLoadPage();

  @override
  Widget buildScreen(
      BuildContext context, RegisterCubit bloc, RegisterState state) {
    return Scaffold(
      backgroundColor: AppColors.background,
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
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Registrate completando los siguientes campos",
                  style: TextStyle(
                    fontSize: ScreenSize.width(context) * 0.075,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
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
                AddressesList(
                  addresses: state.addresses,
                  onRemoveAddressTap: (index) =>
                      bloc.onRemoveAddressButtonTap(index),
                ),
                if (state.addresses.length < 4)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: TextButton(
                        onPressed: () => bloc.onAddAddressButtonTap(),
                        child: Text(
                          "A??adir nueva direcci??n",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: ScreenSize.width(context) * 0.04,
                          ),
                        ),
                      ),
                    ),
                  ),
                CustomTextField(
                  label: "Correo electr??nico",
                  controller: state.emailController,
                  focus: state.emailFocus,
                  type: TextFieldType.email,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: "Contrase??a",
                  controller: state.passwordController,
                  focus: state.passwordFocus,
                  type: TextFieldType.password,
                  hidePassword: state.hidePassword,
                  onSuffixTap: () => bloc.onShowPasswordButtonTap(),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: "Confirmar contrase??a",
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
