import 'package:dartz/dartz.dart';
import 'package:dvp_test/core/errors/failures.dart';
import 'package:dvp_test/features/home/data/models/get_user_data_response.dart';

abstract class HomeRepository {
  Future<Either<Failure, GetUserDataResponse>> getUserData(
      {required String params});

  Future<Either<Failure, bool>> signOut({required String params});
}
