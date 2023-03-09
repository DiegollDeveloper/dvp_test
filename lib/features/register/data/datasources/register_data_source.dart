import 'package:shared_preferences/shared_preferences.dart';

abstract class RegisterDataSource {
  Future<dynamic> registerUserData({required dynamic params});
}

class RegisterDataSourceImpl extends RegisterDataSource {
  final SharedPreferences sharedPreferences;

  RegisterDataSourceImpl({required this.sharedPreferences});

  @override
  Future<dynamic> registerUserData({required params}) async {
    return false;
  }
}
