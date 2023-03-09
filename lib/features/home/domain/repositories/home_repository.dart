import 'package:dartz/dartz.dart';
import 'package:dvp_test/core/errors/failures.dart';

abstract class HomeRepository {
  Future<Either<Failure, dynamic>> getUserData({required dynamic params});
}
