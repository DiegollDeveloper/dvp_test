class GetUserDataResponse {
  String names;
  String lastNames;
  String dateOfBirth;
  List<String> addresses;

  GetUserDataResponse({
    required this.names,
    required this.lastNames,
    required this.dateOfBirth,
    required this.addresses,
  });
}
