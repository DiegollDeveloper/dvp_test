import 'package:dvp_test/features/home/data/datasources/home_data_source.dart';
import 'package:dvp_test/features/home/domain/repositories/home_repository.dart';
import 'package:dvp_test/features/home/domain/usecases/get_user_data_use_case.dart';
import 'package:dvp_test/features/home/domain/usecases/sign_out_use_case.dart';
import 'package:dvp_test/features/home/presentation/cubit/home_cubit.dart';
import 'package:dvp_test/features/login/presentation/cubit/login_cubit.dart';
import 'package:dvp_test/features/register/data/datasources/register_data_source.dart';
import 'package:dvp_test/features/register/data/repositories/register_repository_impl.dart';
import 'package:dvp_test/features/register/domain/repositories/register_repository.dart';
import 'package:dvp_test/features/register/domain/usecases/register_user_data_use_case.dart';
import 'package:dvp_test/features/register/presentation/cubit/register_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/home/data/repositories/home_repository_impl.dart';

final GetIt sl = GetIt.instance;

init() async {
  await registerSharedPreferences();
  registerDataSources();
  registerRepositories();
  registerUseCases();
  registerBlocs();
}

void registerBlocs() {
  sl.registerFactory(() => LoginCubit());
  sl.registerFactory(() => RegisterCubit(registerUserDataUseCase: sl()));
  sl.registerFactory(
      () => HomeCubit(getUserDataUseCase: sl(), signOutUseCase: sl()));
}

void registerUseCases() {
  sl.registerLazySingleton(
      () => RegisterUserDataUseCase(registerRepository: sl()));
  sl.registerLazySingleton(() => GetUserDataUseCase(homeRepository: sl()));
  sl.registerLazySingleton(() => SignOutUseCase(homeRepository: sl()));
}

void registerRepositories() {
  sl.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositoryImpl(registerDataSource: sl()));
  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(homeDataSource: sl()));
}

void registerDataSources() {
  sl.registerLazySingleton<RegisterDataSource>(
      () => RegisterDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<HomeDataSource>(
      () => HomeDataSourceImpl(sharedPreferences: sl()));
}

Future<void> registerSharedPreferences() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}
