import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  static final _storage = FlutterSecureStorage();
  static Future<void> saveTokens(String access, String refresh) async {
    await _storage.write(key: 'access', value: access);
    await _storage.write(key: 'refresh', value: refresh);
  }

  static Future<String?> getAccessToken() async =>
      await _storage.read(key: 'access');
  static Future<String?> getRefreshToken() async =>
      await _storage.read(key: 'refresh');
  static Future<void> clearTokens() async => await _storage.deleteAll();
}
