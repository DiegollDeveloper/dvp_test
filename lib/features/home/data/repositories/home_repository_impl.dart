import 'package:dartz/dartz.dart';
import 'package:dvp_test/core/errors/failures.dart';
import 'package:dvp_test/core/errors/exceptions.dart';
import 'package:dvp_test/features/home/data/datasources/home_data_source.dart';
import 'package:dvp_test/features/home/data/models/get_user_data_response.dart';
import 'package:dvp_test/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDataSource homeDataSource;

  HomeRepositoryImpl({required this.homeDataSource});

  @override
  Future<Either<Failure, GetUserDataResponse>> getUserData(
      {required params}) async {
    try {
      final result = await homeDataSource.getUserData(userEmail: params);
      return Right(result);
    } on HomeExeption catch (e) {
      return Left(HomeFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, bool>> signOut({required params}) async {
    try {
      final result = await homeDataSource.signOut(userEmail: params);
      return Right(result);
    } on HomeExeption catch (e) {
      return Left(HomeFailure(message: e.message));
    }
  }
}
