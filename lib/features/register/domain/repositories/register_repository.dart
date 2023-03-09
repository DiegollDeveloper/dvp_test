import 'package:dartz/dartz.dart';
import 'package:dvp_test/core/errors/failures.dart';

abstract class RegisterRepository {
  Future<Either<Failure, dynamic>> registerUserData({required dynamic params});
}
