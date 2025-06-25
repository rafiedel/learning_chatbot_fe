import 'package:shared_preferences/shared_preferences.dart';

import '../core/constants/_constants.dart';
import 'logger_service.dart';

class PrefService {
  static SharedPreferences? _pref;

  static String? get accessToken  => _pref?.getString(PreferencesKeys.authToken);
  static String? get refreshToken => _pref?.getString(PreferencesKeys.refreshTokenKey);

  static Future<void> init() async {
    LoggerService.i('Initializing Shared Preference Service');
    _pref = await SharedPreferences.getInstance();
  }

  static Future<void> saveString(String key, String value) async {
    await _pref!.setString(key, value);
  }

  static Future<void> saveInt(String key, int value) async {
    await _pref!.setInt(key, value);
  }

  static String? getString(String key) {
    return _pref!.getString(key);
  }

  static int? getInt(String key) {
    return _pref!.getInt(key);
  }

  static Future<void> removeKey(String key) async {
    await _pref!.remove(key);
  }

  static Map<String, String> getHeaders() => {
    'Authorization': 'Bearer ${accessToken ?? ""}',
    'Content-Type':  'application/json',
  };

  // save both tokens
  static Future<void> saveAuthTokens({
    required String access,
    required String refresh,
  }) async {
    await _pref!.setString(PreferencesKeys.authToken, access);
    await _pref!.setString(PreferencesKeys.refreshTokenKey, refresh);
  }
}
