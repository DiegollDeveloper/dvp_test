abstract class Failure {}

class LoginFailure extends Failure {
  final String message;

  LoginFailure({required this.message});
}

class RegisterFailure extends Failure {
  final String message;

  RegisterFailure({required this.message});
}

class HomeFailure extends Failure {
  final String message;

  HomeFailure({required this.message});
}
