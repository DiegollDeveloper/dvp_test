import 'package:dartz/dartz.dart';
import 'package:dvp_test/core/errors/failures.dart';
import 'package:dvp_test/core/use_case/use_case.dart';
import 'package:dvp_test/features/register/domain/repositories/register_repository.dart';

class RegisterUserDataUseCase extends UseCase<dynamic, dynamic> {
  final RegisterRepository registerRepository;

  RegisterUserDataUseCase({required this.registerRepository});

  @override
  Future<Either<Failure, dynamic>> call(params) async =>
      await registerRepository.registerUserData(params: params);
}
