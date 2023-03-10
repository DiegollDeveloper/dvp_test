import 'dart:convert';
import 'package:dvp_test/core/errors/exceptions.dart';
import 'package:dvp_test/core/use_case/use_case.dart';
import 'package:dvp_test/core/utils/common_functions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dvp_test/features/login/data/models/sign_in_data_response.dart';
import 'package:dvp_test/features/login/data/models/sign_in_data_body.dart';

abstract class LoginDataSource {
  Future<SignInDataResponse> signIn({required SignInDataBody loginData});
  Future<bool> fetchRegisteredEmail({required String email});
  Future<String> fetchRecentEmail({required NoParams params});
}

class LoginDataSourceImpl extends LoginDataSource {
  SharedPreferences sharedPreferences;

  LoginDataSourceImpl({required this.sharedPreferences});

  @override
  Future<SignInDataResponse> signIn({required SignInDataBody loginData}) async {
    try {
      if (loginData.password == getDencryptedPassword(loginData.email)) {
        sharedPreferences.setString("recentEmail", loginData.email);
        return SignInDataResponse(signInResponse: SignInResponse.success);
      } else {
        return SignInDataResponse(
            signInResponse: SignInResponse.incorrectPassword);
      }
    } catch (e) {
      throw LoginExeption(message: "Sign In error");
    }
  }

  @override
  Future<bool> fetchRegisteredEmail({required String email}) async {
    try {
      return sharedPreferences.containsKey(email);
    } catch (e) {
      throw LoginExeption(message: "Fetch registered email error");
    }
  }

  String getDencryptedPassword(String email) {
    String userData = sharedPreferences.getString(email)!;
    Map<String, dynamic> decodedUserData = json.decode(userData);
    return CommonFunctions.decryptedText(decodedUserData["password"]);
  }

  @override
  Future<String> fetchRecentEmail({required NoParams params}) async {
    try {
      return sharedPreferences.getString("recentEmail") ?? "";
    } catch (e) {
      throw LoginExeption(message: "Fetch registered email error");
    }
  }
}
