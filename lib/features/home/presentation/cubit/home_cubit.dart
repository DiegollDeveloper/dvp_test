import 'package:dvp_test/features/home/domain/usecases/get_user_data_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  GetUserDataUseCase getUserDataUseCase;

  HomeCubit({
    required this.getUserDataUseCase,
  }) : super(HomeState.initial());

  void onLoadPage() {}
}
