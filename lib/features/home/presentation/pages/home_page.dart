import 'package:dvp_test/core/utils/app_colors.dart';
import 'package:dvp_test/core/utils/screen_size.dart';
import 'package:dvp_test/core/widgets/custom_button.dart';
import 'package:dvp_test/features/home/presentation/pages/data_error_page.dart';
import 'package:dvp_test/features/home/presentation/widgets/user_data_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:dvp_test/injection_container.dart';
import 'package:dvp_test/core/helpers/base_screen.dart';
import 'package:dvp_test/features/home/presentation/cubit/home_cubit.dart';

class HomeScreen extends BaseScreen<HomeState, HomeCubit> {
  final Map<String, dynamic> params;

  const HomeScreen({
    super.key,
    required this.params,
  });

  @override
  HomeCubit createBloc() => sl<HomeCubit>()..onLoadPage(params);

  @override
  Widget buildScreen(BuildContext context, HomeCubit bloc, HomeState state) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: (state.dataError)
          ? DataErrorScreen(
              onRetry: () async => bloc.onLoadPage(params),
            )
          : Padding(
              padding: EdgeInsets.only(
                top: ScreenSize.height(context) * 0.1,
                bottom: ScreenSize.height(context) * 0.05,
                left: ScreenSize.width(context) * 0.1,
                right: ScreenSize.width(context) * 0.1,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Hola ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: ScreenSize.width(context) * 0.05,
                          ),
                        ),
                        TextSpan(
                          text: state.userData.names,
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenSize.width(context) * 0.06,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    "Estos son tus datos de registro",
                    style: TextStyle(
                      fontSize: ScreenSize.width(context) * 0.04,
                    ),
                  ),
                  const SizedBox(height: 20),
                  UserDataListTile(
                    tile: "Nombres",
                    data: state.userData.names,
                  ),
                  const SizedBox(height: 10),
                  UserDataListTile(
                    tile: "Apellidos",
                    data: state.userData.lastNames,
                  ),
                  const SizedBox(height: 10),
                  UserDataListTile(
                    tile: "Fecha de nacimiento",
                    data: state.userData.dateOfBirth,
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.userData.addresses.length == 1
                            ? "Direccion"
                            : "Direcciones",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenSize.width(context) * 0.04,
                        ),
                      ),
                      const SizedBox(height: 5),
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: state.userData.addresses.length,
                        itemBuilder: (context, index) => Text(
                          state.userData.addresses[index],
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: ScreenSize.width(context) * 0.05,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  CustomButton(
                    loading: false,
                    text: "Cerrar sesión",
                    onTap: () => bloc.signOut(context),
                  ),
                ],
              ),
            ),
    );
  }
}
