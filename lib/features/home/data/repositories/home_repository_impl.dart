import 'package:dvp_test/core/errors/exceptions.dart';
import 'package:dvp_test/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:dvp_test/features/home/data/datasources/home_data_source.dart';
import 'package:dvp_test/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDataSource homeDataSource;

  HomeRepositoryImpl({required this.homeDataSource});

  @override
  Future<Either<Failure, dynamic>> getUserData({required params}) async {
    try {
      final result = await homeDataSource.getUserData(params: params);
      return Right(result);
    } on RegisterExeption catch (e) {
      return Left(RegisterFailure(message: e.message));
    }
  }
}