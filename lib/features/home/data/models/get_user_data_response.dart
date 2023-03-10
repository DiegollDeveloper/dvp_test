import 'package:dvp_test/core/utils/common_functions.dart';

class GetUserDataResponse {
  String names;
  String lastNames;
  String dateOfBirth;
  List<String> addresses;
  String email;

  GetUserDataResponse({
    required this.names,
    required this.lastNames,
    required this.dateOfBirth,
    required this.addresses,
    required this.email,
  });

  factory GetUserDataResponse.fromJson(Map<String, dynamic> json) =>
      GetUserDataResponse(
        names: json["names"],
        lastNames: json["last_names"],
        dateOfBirth: json["date_of_birth"],
        addresses: CommonFunctions.formatAddressesStringList(json["addresses"]),
        email: json["email"],
      );
}
