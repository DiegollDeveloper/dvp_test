import 'package:dartz/dartz.dart';
import 'package:dvp_test/core/errors/failures.dart';
import 'package:dvp_test/core/use_case/use_case.dart';
import 'package:dvp_test/features/login/data/models/sign_in_data_body.dart';
import 'package:dvp_test/features/login/data/models/sign_in_data_response.dart';
import 'package:dvp_test/features/login/domain/repositories/login_repositoy.dart';

class SignInUseCase extends UseCase<SignInDataResponse, SignInDataBody> {
  LoginRepository loginRepository;

  SignInUseCase({required this.loginRepository});

  @override
  Future<Either<Failure, SignInDataResponse>> call(
          SignInDataBody params) async =>
      await loginRepository.signIn(params: params);
}
