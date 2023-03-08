import 'package:dvp_test/features/login/presentation/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

init() async {
  sl.registerFactory(() => LoginCubit());
}
