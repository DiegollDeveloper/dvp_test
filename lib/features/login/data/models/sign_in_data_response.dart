class SignInDataResponse {
  final SignInResponse signInResponse;

  SignInDataResponse({
    required this.signInResponse,
  });
}

enum SignInResponse {
  success,
  incorrectPassword,
}
