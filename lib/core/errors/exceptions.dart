class LoginExeption implements Exception {
  final String message;

  LoginExeption({required this.message});
}

class RegisterExeption implements Exception {
  final String message;

  RegisterExeption({required this.message});
}

class HomeExeption implements Exception {
  final String message;

  HomeExeption({required this.message});
}
