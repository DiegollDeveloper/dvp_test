import 'package:dartz/dartz.dart';
import 'package:dvp_test/core/errors/failures.dart';
import 'package:dvp_test/core/use_case/use_case.dart';
import 'package:dvp_test/features/home/domain/repositories/home_repository.dart';

class SignOutUseCase extends UseCase<bool, NoParams> {
  final HomeRepository homeRepository;

  SignOutUseCase({required this.homeRepository});

  @override
  Future<Either<Failure, bool>> call(params) async =>
      await homeRepository.signOut(params: params);
}
