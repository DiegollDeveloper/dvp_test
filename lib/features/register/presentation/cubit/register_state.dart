part of 'register_cubit.dart';

class RegisterState {
  final bool loadingPage;
  final bool dateSelected;
  final bool registeringUserData;
  final bool hidePassword;
  final bool hideConfirmPassword;

  final TextEditingController namesController;
  final TextEditingController lastNamesController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final FocusNode namesFocus;
  final FocusNode lastNamesFocus;
  final FocusNode emailFocus;
  final FocusNode passwordFocus;
  final FocusNode confirmPasswordFocus;

  final DateTime dateOfBirth;
  final List<AddressModel> addresses;

  const RegisterState({
    required this.loadingPage,
    required this.dateSelected,
    required this.registeringUserData,
    required this.hidePassword,
    required this.hideConfirmPassword,
    required this.namesController,
    required this.lastNamesController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.namesFocus,
    required this.lastNamesFocus,
    required this.emailFocus,
    required this.passwordFocus,
    required this.confirmPasswordFocus,
    required this.dateOfBirth,
    required this.addresses,
  });

  factory RegisterState.initial() => RegisterState(
        loadingPage: false,
        dateSelected: false,
        registeringUserData: false,
        hidePassword: true,
        hideConfirmPassword: true,
        namesController: TextEditingController(),
        lastNamesController: TextEditingController(),
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
        confirmPasswordController: TextEditingController(),
        namesFocus: FocusNode(),
        lastNamesFocus: FocusNode(),
        emailFocus: FocusNode(),
        passwordFocus: FocusNode(),
        confirmPasswordFocus: FocusNode(),
        dateOfBirth: DateTime.now(),
        addresses: [
          AddressModel(
            addressController: TextEditingController(),
            addressFocus: FocusNode(),
          ),
        ],
      );

  RegisterState copyWith({
    bool? loadingPage,
    bool? dateSelected,
    bool? registeringUserData,
    bool? hidePassword,
    bool? hideConfirmPassword,
    DateTime? dateOfBirth,
    List<AddressModel>? addresses,
  }) =>
      RegisterState(
        loadingPage: loadingPage ?? this.loadingPage,
        dateSelected: dateSelected ?? this.dateSelected,
        registeringUserData: registeringUserData ?? this.registeringUserData,
        hidePassword: hidePassword ?? this.hidePassword,
        hideConfirmPassword: hideConfirmPassword ?? this.hideConfirmPassword,
        namesController: namesController,
        lastNamesController: lastNamesController,
        emailController: emailController,
        passwordController: passwordController,
        confirmPasswordController: confirmPasswordController,
        namesFocus: namesFocus,
        lastNamesFocus: lastNamesFocus,
        emailFocus: emailFocus,
        passwordFocus: passwordFocus,
        confirmPasswordFocus: confirmPasswordFocus,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        addresses: addresses ?? this.addresses,
      );
}
