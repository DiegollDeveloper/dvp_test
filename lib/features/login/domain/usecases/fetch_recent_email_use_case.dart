import 'package:dartz/dartz.dart';
import 'package:dvp_test/core/errors/failures.dart';
import 'package:dvp_test/core/use_case/use_case.dart';
import 'package:dvp_test/features/login/domain/repositories/login_repositoy.dart';

class FetchRecentEmailUseCase extends UseCase<String, NoParams> {
  LoginRepository loginRepository;

  FetchRecentEmailUseCase({required this.loginRepository});

  @override
  Future<Either<Failure, String>> call(NoParams params) async =>
      await loginRepository.fetchRecentEmail(params: params);
}
