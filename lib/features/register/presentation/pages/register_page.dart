import 'package:dvp_test/core/utils/common_functions.dart';
import 'package:dvp_test/core/widgets/custom_text_field.dart';
import 'package:dvp_test/features/register/presentation/widgets/custom_date_field.dart';
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
      backgroundColor: Colors.grey[200]!,
      body: Padding(
        padding: EdgeInsets.only(
          top: ScreenSize.height(context) * 0.1,
          left: ScreenSize.width(context) * 0.1,
          right: ScreenSize.width(context) * 0.1,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Registrate completando los siguientes campos",
              style: TextStyle(
                fontSize: ScreenSize.width(context) * 0.075,
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            CustomTextField(
              label: "Nombres",
              controller: state.namesController,
              focus: state.namesFocus,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              label: "Apellidos",
              controller: state.lastNamesController,
              focus: state.lastNamesFocus,
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
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => bloc.addressDialog(context),
              child: Container(
                height: ScreenSize.height(context) * 0.075,
                width: double.infinity,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dirección",
                      style: TextStyle(
                        color: state.addresses.isEmpty
                            ? Colors.grey[700]!
                            : Colors.purple,
                        fontSize: ScreenSize.width(context) *
                            ((state.addresses.isEmpty) ? 0.041 : 0.034),
                      ),
                    ),
                    // Row(
                    //   children: [
                    //     DropdownButton(
                    //       value: "Carrera",
                    //       onChanged: (val) {},
                    //       items: const [
                    //         DropdownMenuItem(
                    //           value: "Calle",
                    //           child: Text("Calle"),
                    //         ),
                    //         DropdownMenuItem(
                    //           value: "Carrera",
                    //           child: Text("Carrera"),
                    //         ),
                    //         DropdownMenuItem(
                    //           value: "Avenida",
                    //           child: Text("Avenida"),
                    //         ),
                    //       ],
                    //       icon: const SizedBox(),
                    //       underline: const SizedBox(),
                    //       style: TextStyle(
                    //         color: Colors.grey[700]!,
                    //         fontSize: ScreenSize.width(context) * 0.041,
                    //       ),
                    //     ),
                    //     Flexible(child: TextField()),
                    //     Text("#"),
                    //     Flexible(child: TextField()),
                    //     Text("-"),
                    //     Flexible(child: TextField()),
                    //   ],
                    // ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
