import 'package:dartz/dartz.dart';
import 'package:dvp_test/core/errors/failures.dart';
import 'package:dvp_test/core/use_case/use_case.dart';
import 'package:dvp_test/features/login/domain/repositories/login_repositoy.dart';

class FetchRegisteredEmailUseCase extends UseCase<bool, String> {
  LoginRepository loginRepository;

  FetchRegisteredEmailUseCase({required this.loginRepository});

  @override
  Future<Either<Failure, bool>> call(String params) async =>
      await loginRepository.fetchRegisteredEmail(params: params);
}
