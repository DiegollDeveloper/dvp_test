import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dvp_test/features/home/domain/usecases/get_user_data_use_case.dart';

import '../use_cases_tests/get_user_data_tests.dart';

@GenerateMocks([GetUserDataUseCase])
void main() {
  group("Home tests", () {
    getUserDataTests();
  });
}
