import 'package:dvp_test/core/errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dvp_test/features/register/data/models/register_data_body.dart';

abstract class RegisterDataSource {
  Future<bool> registerUserData({required RegisterDataBody registerData});
}

class RegisterDataSourceImpl extends RegisterDataSource {
  final SharedPreferences sharedPreferences;

  RegisterDataSourceImpl({required this.sharedPreferences});

  @override
  Future<bool> registerUserData({required registerData}) async {
    try {
      await sharedPreferences.setString("names", registerData.names);
      await sharedPreferences.setString("lastNames", registerData.lastName);
      await sharedPreferences.setString(
          "dateOfBirth", registerData.dateOfBirth);
      await sharedPreferences.setStringList(
          "addresses", registerData.addresses);
      return true;
    } catch (e) {
      throw RegisterExeption(message: "Register user data error");
    }
  }
}
