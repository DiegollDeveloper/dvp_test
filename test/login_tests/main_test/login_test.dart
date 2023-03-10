import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dvp_test/features/login/domain/usecases/fetch_recent_email_use_case.dart';
import '../use_cases_tests/sign_in_tests.dart';

@GenerateMocks([
  FetchRecentEmailUseCase,
])
void main() {
  group("Login tests", () {
    fetchRecentEmailTests();
  });
}
