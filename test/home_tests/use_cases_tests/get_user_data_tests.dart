import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import '../main_test/home_test.mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dvp_test/core/errors/failures.dart';
import 'package:dvp_test/core/utils/common_functions.dart';
import 'package:dvp_test/features/home/presentation/cubit/home_cubit.dart';
import 'package:dvp_test/features/home/data/models/get_user_data_response.dart';

void getUserDataTests() {
  group(
    "Get user data",
    () {
      late HomeCubit homeCubit;
      late MockGetUserDataUseCase mockGetUserDataUseCase;

      setUp(() {
        mockGetUserDataUseCase = MockGetUserDataUseCase();
        homeCubit = HomeCubit(getUserDataUseCase: mockGetUserDataUseCase);
      });

      test(
        "Get user data test (Success)",
        () async {
          when(mockGetUserDataUseCase(any)).thenAnswer(
            (_) async => Right(
              GetUserDataResponse(
                names: "Unit",
                lastNames: "Test",
                dateOfBirth: "18/01/1998",
                addresses: [
                  "Calle 20 # 47-1",
                  "Centro comercial Cacique",
                ],
                email: "unit_test@dvp.com",
              ),
            ),
          );

          await homeCubit.getUserData("unit_test@dvp.com");

          expect(homeCubit.state.dataError, false);
          expect(homeCubit.state.userData.names, "Unit");
          expect(homeCubit.state.userData.lastNames, "Test");
          expect(homeCubit.state.userData.dateOfBirth, "18/01/1998");
          expect(
              CommonFunctions.compareLists(
                homeCubit.state.userData.addresses,
                [
                  "Calle 20 # 47-1",
                  "Centro comercial Cacique",
                ],
              ),
              true);
          expect(homeCubit.state.userData.email, "unit_test@dvp.com");
        },
      );

      test(
        "Get user data test (fail)",
        () async {
          homeCubit.state.userData.clearData();

          when(mockGetUserDataUseCase(any)).thenAnswer(
            (_) async => Left(
              HomeFailure(message: "Error"),
            ),
          );

          await homeCubit.getUserData("unit_test@dvp.com");

          expect(homeCubit.state.dataError, true);
          expect(homeCubit.state.userData.names, "");
          expect(homeCubit.state.userData.lastNames, "");
          expect(homeCubit.state.userData.dateOfBirth, "");
          expect(
            CommonFunctions.compareLists(
              homeCubit.state.userData.addresses,
              [],
            ),
            true,
          );
          expect(homeCubit.state.userData.email, "");
        },
      );
    },
  );
}
