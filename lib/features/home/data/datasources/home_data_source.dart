import 'package:dvp_test/core/errors/exceptions.dart';
import 'package:dvp_test/core/use_case/use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dvp_test/features/home/data/models/get_user_data_response.dart';

abstract class HomeDataSource {
  Future<GetUserDataResponse> getUserData({required NoParams params});
  Future<bool> signOut({required NoParams params});
}

class HomeDataSourceImpl extends HomeDataSource {
  final SharedPreferences sharedPreferences;

  HomeDataSourceImpl({required this.sharedPreferences});

  @override
  Future<GetUserDataResponse> getUserData({required params}) async {
    try {
      if (validateSharedUserData()) {
        return GetUserDataResponse(
          names: sharedPreferences.getString("names")!,
          lastNames: sharedPreferences.getString("lastNames")!,
          dateOfBirth: sharedPreferences.getString("dateOfBirth")!,
          addresses: sharedPreferences.getStringList("addresses")!,
        );
      } else {
        throw HomeExeption(message: "Get user data error");
      }
    } catch (e) {
      throw HomeExeption(message: "Get user data error");
    }
  }

  @override
  Future<bool> signOut({required params}) async {
    try {
      await sharedPreferences.clear();
      return true;
    } catch (e) {
      throw HomeExeption(message: "Sign out error");
    }
  }

  bool validateSharedUserData() =>
      sharedPreferences.containsKey("names") &&
      sharedPreferences.containsKey("lastNames") &&
      sharedPreferences.containsKey("dateOfBirth") &&
      sharedPreferences.containsKey("addresses");
}
