import 'dart:convert';
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
      final String registerDataEnconded = json.encode(registerData.toJson());
      await sharedPreferences.setString(
        registerData.email,
        registerDataEnconded,
      );
      await sharedPreferences.setString("recentEmail", registerData.email);
      return true;
    } catch (e) {
      throw RegisterExeption(message: "Register user data error");
    }
  }
}
