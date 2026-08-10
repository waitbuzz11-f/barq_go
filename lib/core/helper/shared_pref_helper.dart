import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SharedPrefHelper {
  SharedPrefHelper._();

  // =========================================================
  //                      SHARED PREFS
  // =========================================================

  static late final SharedPreferences _prefs;

  /// Must be called once in main()
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setData<T>(String key, T value) async {
    if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is int) {
      await _prefs.setInt(key, value);
    } else if (value is bool) {
      await _prefs.setBool(key, value);
    } else if (value is double) {
      await _prefs.setDouble(key, value);
    } else {
      throw Exception('Unsupported type: ${value.runtimeType}');
    }
  }

  static T? get<T>(String key) {
    final value = _prefs.get(key);
    if (value is T) return value;
    return null;
  }

  static String getString(String key, {String fallback = ''}) {
    return _prefs.getString(key) ?? fallback;
  }

  static bool getBool(String key, {bool fallback = false}) {
    return _prefs.getBool(key) ?? fallback;
  }

  static int getInt(String key, {int fallback = 0}) {
    return _prefs.getInt(key) ?? fallback;
  }

  static double getDouble(String key, {double fallback = 0.0}) {
    return _prefs.getDouble(key) ?? fallback;
  }

  static Future<void> remove(String key) async {
    await _prefs.remove(key);
  }

  static Future<void> clear() async {
    await _prefs.clear();
  }

  // =========================================================
  //                    SECURE STORAGE
  // =========================================================

  static const FlutterSecureStorage _secure = FlutterSecureStorage(
    aOptions: AndroidOptions(),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  static Future<void> setSecuredString(String key, String value) async {
    await _secure.write(key: key, value: value);
  }

  static Future<String> getSecuredString(String key) async {
    return await _secure.read(key: key) ?? '';
  }

  static Future<void> removeSecure(String key) async {
    await _secure.delete(key: key);
  }

  static Future<void> clearSecure() async {
    await _secure.deleteAll();
  }

  /// Migrate from SharedPrefs → SecureStorage
  static Future<String> migrateSecure(String key) async {
    final secureValue = await getSecuredString(key);
    if (secureValue.isNotEmpty) return secureValue;

    final legacyValue = _prefs.get(key);
    if (legacyValue == null) return '';

    final value = legacyValue.toString();

    await setSecuredString(key, value);
    await remove(key);

    return value;
  }
}
