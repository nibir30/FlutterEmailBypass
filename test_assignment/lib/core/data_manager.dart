import 'package:shared_preferences/shared_preferences.dart';

import 'data_formatter.dart';

class DataManager {
  // ignore: non_constant_identifier_names
  static String get refresh_token_key => "refresh_token";
  static final _data = DataManager._internal();

  DataManager._internal();

  factory DataManager() {
    return _data;
  }

  Future<String> _getStringValue(final String _key) async {
    final _sharedPreference = await SharedPreferences.getInstance();
    final String _rToken = _sharedPreference.getString(_key) ?? "";
    return _rToken;
  }

  Future<void> _setStringValue(final String _key, final String _value) async {
    final _sharedPreference = await SharedPreferences.getInstance();
    _sharedPreference.setString(_key, _value);
  }

  Future<void> saveRefreshToken(final String _refreshToken) async {
    await _setStringValue(WKey.loginRefreshKey, _refreshToken);
  }

  // static String get loginRefreshKey => "refresh_key";

  Future<void> saveToken(final String _token) async {
    await _setStringValue(WKey.loginAuthorizationKey, _token);
  }

  Future<String> getAuthToken() async {
    return await _getStringValue(WKey.loginAuthorizationKey);
  }
}

DataManager dataManager = DataManager();
