import 'package:dartz/dartz.dart';
import 'package:dvp_test/core/errors/failures.dart';
import 'package:dvp_test/features/register/data/models/register_data_body.dart';

abstract class RegisterRepository {
  Future<Either<Failure, bool>> registerUserData(
      {required RegisterDataBody params});
}
