import 'package:dartz/dartz.dart';
import 'package:dvp_test/core/errors/failures.dart';
import 'package:dvp_test/core/use_case/use_case.dart';
import 'package:dvp_test/features/home/domain/repositories/home_repository.dart';

class GetUserDataUseCase extends UseCase<dynamic, dynamic> {
  final HomeRepository homeRepository;

  GetUserDataUseCase({required this.homeRepository});

  @override
  Future<Either<Failure, dynamic>> call(params) async =>
      await homeRepository.getUserData(params: params);
}
