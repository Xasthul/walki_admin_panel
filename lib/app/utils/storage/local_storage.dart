import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final _storage = SharedPreferencesAsync();

  static const _accessTokenKey = '_accessTokenKey';

  Future<void> saveAccessToken(String accessToken) => _storage.setString(_accessTokenKey, accessToken);

  Future<String?> get accessToken => _storage.getString(_accessTokenKey);

  Future<void> clearAccessToken() => _storage.remove(_accessTokenKey);
}
