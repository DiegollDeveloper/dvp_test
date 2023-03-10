class RegisterDataBody {
  String names;
  String lastName;
  String dateOfBirth;
  List<String> addresses;
  String email;
  String password;

  RegisterDataBody({
    required this.names,
    required this.lastName,
    required this.dateOfBirth,
    required this.addresses,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => <String, dynamic>{
        "names": names,
        "last_names": lastName,
        "date_of_birth": dateOfBirth,
        "addresses": addresses,
        "email": email,
        "password": password,
      };
}
