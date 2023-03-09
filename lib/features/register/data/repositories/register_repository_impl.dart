import 'package:dartz/dartz.dart';
import 'package:dvp_test/core/errors/failures.dart';
import 'package:dvp_test/core/errors/exceptions.dart';
import 'package:dvp_test/features/register/data/datasources/register_data_source.dart';
import 'package:dvp_test/features/register/domain/repositories/register_repository.dart';

class RegisterRepositoryImpl extends RegisterRepository {
  final RegisterDataSource registerDataSource;

  RegisterRepositoryImpl({required this.registerDataSource});

  @override
  Future<Either<Failure, bool>> registerUserData({required params}) async {
    try {
      final result =
          await registerDataSource.registerUserData(registerData: params);
      return Right(result);
    } on RegisterExeption catch (e) {
      return Left(RegisterFailure(message: e.message));
    }
  }
}
