import 'package:iget_sporty_admin_panel/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static const String _loginUserKey = 'loginUser';
  static const String _userModelKey = 'userModel';
  static const String _userTokenKey = 'userToken';

  Future<void> setUserLogin(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_loginUserKey, value);
  }

  Future<bool> getUserLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_loginUserKey) ?? false;
  }

  Future<void> saveUserModel(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(_userModelKey, user.toJsonString());
  }

  Future<UserModel?> getUserModel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? busniessJson = prefs.getString(_userModelKey);
    return UserModel.fromJsonString(busniessJson!);
  }

  Future<void> setUserToken(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userTokenKey, value);
  }

  Future<String> getUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userTokenKey) ?? '';
  }

  Future<void> clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userModelKey);
    await prefs.remove(_loginUserKey);
    await prefs.remove(_userTokenKey);
  }
}
