import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import '../main_test/home_test.mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dvp_test/core/errors/failures.dart';
import 'package:dvp_test/core/utils/common_functions.dart';
import 'package:dvp_test/features/home/presentation/cubit/home_cubit.dart';

void signOutTests() {
  group(
    "Sign out",
    () {
      late HomeCubit homeCubit;
      late MockSignOutUseCase mockSignOutUseCase;

      setUp(() {
        mockSignOutUseCase = MockSignOutUseCase();
        homeCubit = HomeCubit(signOutUseCase: mockSignOutUseCase);
      });

      test(
        "Sign out test (Success)",
        () async {
          homeCubit.emit(
            homeCubit.state.copyWith(
              userData: homeCubit.state.userData.copyWith(
                names: "Unit",
                lastNames: "Test",
                dateOfBirth: "18/01/1998",
                addresses: ["Calle 47 #28-11"],
                email: "unit_test@dvp.com",
              ),
            ),
          );

          when(mockSignOutUseCase(any)).thenAnswer(
            (_) async => const Right(true),
          );

          await homeCubit.signOut(null);

          expect(homeCubit.state.userData.names, "");
          expect(homeCubit.state.userData.lastNames, "");
          expect(homeCubit.state.userData.dateOfBirth, "");
          expect(
              CommonFunctions.compareLists(
                homeCubit.state.userData.addresses,
                [],
              ),
              true);
          expect(homeCubit.state.userData.email, "");
        },
      );

      test(
        "Sign out test (fail)",
        () async {
          homeCubit.emit(
            homeCubit.state.copyWith(
              userData: homeCubit.state.userData.copyWith(
                names: "Unit",
                lastNames: "Test",
                dateOfBirth: "18/01/1998",
                addresses: ["Calle 47 #28-11"],
                email: "unit_test@dvp.com",
              ),
            ),
          );

          when(mockSignOutUseCase(any)).thenAnswer(
            (_) async => Left(
              HomeFailure(message: "Error"),
            ),
          );

          await homeCubit.signOut(null);

          expect(homeCubit.state.userData.names, "Unit");
          expect(homeCubit.state.userData.lastNames, "Test");
          expect(homeCubit.state.userData.dateOfBirth, "18/01/1998");
          expect(
            CommonFunctions.compareLists(
              homeCubit.state.userData.addresses,
              ["Calle 47 #28-11"],
            ),
            true,
          );
          expect(homeCubit.state.userData.email, "unit_test@dvp.com");
        },
      );
    },
  );
}
