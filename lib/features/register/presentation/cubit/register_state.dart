part of 'register_cubit.dart';

class RegisterState {
  final bool loadingPage;
  final bool dateSelected;

  final TextEditingController namesController;
  final TextEditingController lastNamesController;
  final FocusNode namesFocus;
  final FocusNode lastNamesFocus;

  final DateTime dateOfBirth;
  final List<AddressModel> addresses;

  const RegisterState({
    required this.loadingPage,
    required this.dateSelected,
    required this.namesController,
    required this.lastNamesController,
    required this.namesFocus,
    required this.lastNamesFocus,
    required this.dateOfBirth,
    required this.addresses,
  });

  factory RegisterState.initial() => RegisterState(
        loadingPage: false,
        dateSelected: false,
        namesController: TextEditingController(),
        lastNamesController: TextEditingController(),
        namesFocus: FocusNode(),
        lastNamesFocus: FocusNode(),
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
    DateTime? dateOfBirth,
    List<AddressModel>? addresses,
  }) =>
      RegisterState(
        loadingPage: loadingPage ?? this.loadingPage,
        dateSelected: dateSelected ?? this.dateSelected,
        namesController: namesController,
        lastNamesController: lastNamesController,
        namesFocus: namesFocus,
        lastNamesFocus: lastNamesFocus,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        addresses: addresses ?? this.addresses,
      );

  // @override
  // List<Object> get props => [
  //       loadingPage,
  //       dateSelected,
  //       namesController,
  //       lastNamesController,
  //       namesFocus,
  //       lastNamesFocus,
  //       dateOfBirth,
  //       addresses,
  //     ];
}
