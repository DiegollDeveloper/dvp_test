import 'dart:convert';
import 'package:dvp_test/core/errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dvp_test/features/home/data/models/get_user_data_response.dart';

abstract class HomeDataSource {
  Future<GetUserDataResponse> getUserData({required String userEmail});
  Future<bool> signOut({required String userEmail});
}

class HomeDataSourceImpl extends HomeDataSource {
  final SharedPreferences sharedPreferences;

  HomeDataSourceImpl({required this.sharedPreferences});

  @override
  Future<GetUserDataResponse> getUserData({required userEmail}) async {
    try {
      if (!sharedPreferences.containsKey(userEmail)) {
        throw HomeExeption(message: "Get user data error");
      }
      String userData = sharedPreferences.getString(userEmail)!;
      Map<String, dynamic> decodedUserData = json.decode(userData);
      return GetUserDataResponse.fromJson(decodedUserData);
    } catch (e) {
      throw HomeExeption(message: "Get user data error");
    }
  }

  @override
  Future<bool> signOut({required userEmail}) async {
    try {
      return true;
    } catch (e) {
      throw HomeExeption(message: "Sign out error");
    }
  }
}
