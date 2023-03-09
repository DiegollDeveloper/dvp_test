import 'package:flutter/material.dart';
import 'package:dvp_test/navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dvp_test/core/use_case/use_case.dart';
import 'package:dvp_test/core/singletons/user_data.dart';
import 'package:dvp_test/core/utils/in_app_notification.dart';
import 'package:dvp_test/features/home/domain/usecases/sign_out_use_case.dart';
import 'package:dvp_test/features/home/domain/usecases/get_user_data_use_case.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  GetUserDataUseCase getUserDataUseCase;
  SignOutUseCase signOutUseCase;

  HomeCubit({
    required this.getUserDataUseCase,
    required this.signOutUseCase,
  }) : super(HomeState.initial());

  Future<void> onLoadPage() async {
    emit(state.copyWith(
      loadingPage: true,
      dataError: false,
    ));
    await getUserData();
    emit(state.copyWith(loadingPage: false));
  }

  Future<void> getUserData() async {
    final result = await getUserDataUseCase(NoParams());
    result.fold(
      (l) => emit(state.copyWith(dataError: true)),
      (r) {
        emit(
          state.copyWith(
            userData: state.userData.copyWith(
              names: r.names,
              lastNames: r.lastNames,
              dateOfBirth: r.dateOfBirth,
              addresses: r.addresses,
            ),
          ),
        );
      },
    );
  }

  Future<void> signOut(BuildContext? context) async {
    final result = await signOutUseCase(NoParams());
    result.fold(
      (l) => InAppNotification.show(
        message: "Intenta nuevamente",
        type: NotificationType.error,
      ),
      (r) {
        if (context != null) {
          AppNavigator.pushNamedAndRemoveUntil(Routes.register);
        }
      },
    );
  }
}
