import 'package:dartz/dartz.dart';
import 'package:dvp_test/core/errors/failures.dart';
import 'package:dvp_test/core/use_case/use_case.dart';
import 'package:dvp_test/features/home/data/models/get_user_data_response.dart';
import 'package:dvp_test/features/home/domain/repositories/home_repository.dart';

class GetUserDataUseCase extends UseCase<GetUserDataResponse, String> {
  final HomeRepository homeRepository;

  GetUserDataUseCase({required this.homeRepository});

  @override
  Future<Either<Failure, GetUserDataResponse>> call(params) async =>
      await homeRepository.getUserData(params: params);
}
