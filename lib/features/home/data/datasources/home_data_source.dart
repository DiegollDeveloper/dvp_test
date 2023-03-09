import 'package:shared_preferences/shared_preferences.dart';

abstract class HomeDataSource {
  Future<dynamic> getUserData({required dynamic params});
}

class HomeDataSourceImpl extends HomeDataSource {
  final SharedPreferences sharedPreferences;

  HomeDataSourceImpl({required this.sharedPreferences});

  @override
  Future<dynamic> getUserData({required params}) async {
    return false;
  }
}
