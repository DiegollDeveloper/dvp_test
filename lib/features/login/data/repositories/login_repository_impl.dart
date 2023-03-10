import 'package:dartz/dartz.dart';
import 'package:dvp_test/core/errors/failures.dart';
import 'package:dvp_test/core/errors/exceptions.dart';
import 'package:dvp_test/features/login/data/models/sign_in_data_body.dart';
import 'package:dvp_test/features/login/data/models/sign_in_data_response.dart';
import 'package:dvp_test/features/login/data/datasources/login_data_source.dart';
import 'package:dvp_test/features/login/domain/repositories/login_repositoy.dart';

class LoginRepositoryImpl extends LoginRepository {
  LoginDataSource loginDataSource;

  LoginRepositoryImpl({required this.loginDataSource});

  @override
  Future<Either<Failure, SignInDataResponse>> signIn(
      {required SignInDataBody params}) async {
    try {
      final result = await loginDataSource.signIn(loginData: params);
      return Right(result);
    } on LoginExeption catch (e) {
      return Left(LoginFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> fetchRegisteredEmail(
      {required String params}) async {
    try {
      final result = await loginDataSource.fetchRegisteredEmail(email: params);
      return Right(result);
    } on LoginExeption catch (e) {
      return Left(LoginFailure(message: e.message));
    }
  }
}
