import 'package:dartz/dartz.dart';
import 'package:dvp_test/core/errors/failures.dart';
import 'package:dvp_test/core/use_case/use_case.dart';
import 'package:dvp_test/features/login/data/models/sign_in_data_body.dart';
import 'package:dvp_test/features/login/data/models/sign_in_data_response.dart';

abstract class LoginRepository {
  Future<Either<Failure, SignInDataResponse>> signIn(
      {required SignInDataBody params});
  Future<Either<Failure, bool>> fetchRegisteredEmail({required String params});
  Future<Either<Failure, String>> fetchRecentEmail({required NoParams params});
}
