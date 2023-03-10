import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import '../main_test/login_test.mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dvp_test/core/errors/failures.dart';
import 'package:dvp_test/features/login/presentation/cubit/login_cubit.dart';

void fetchRecentEmailTests() {
  group(
    "Fetch recent email",
    () {
      late LoginCubit loginCubit;
      late MockFetchRecentEmailUseCase mockFetchRecentEmailUseCase;

      setUp(() {
        mockFetchRecentEmailUseCase = MockFetchRecentEmailUseCase();
        loginCubit =
            LoginCubit(fetchRecentEmailUseCase: mockFetchRecentEmailUseCase);
      });

      test(
        "Fetch recent email test (Success)",
        () async {
          when(mockFetchRecentEmailUseCase(any)).thenAnswer(
            (_) async => const Right(
              "unit_test@dvp.com",
            ),
          );

          await loginCubit.fetchRecentEmail();

          expect(loginCubit.state.emailController.text, "unit_test@dvp.com");
        },
      );

      test(
        "Fetch recent email test (fail)",
        () async {
          when(mockFetchRecentEmailUseCase(any)).thenAnswer(
            (_) async => Left(
              LoginFailure(message: "Error"),
            ),
          );

          await loginCubit.fetchRecentEmail();

          expect(loginCubit.state.emailController.text, "");
        },
      );
    },
  );
}
