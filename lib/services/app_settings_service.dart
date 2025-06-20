import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsService {
  static const _darkModeKey = 'darkMode';
  static const _notificationsKey = 'notifications';
  Future<void> saveSettings({
    required bool isDarkMode,
    required bool notificationsEnabled,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_darkModeKey, isDarkMode);
    await prefs.setBool(_notificationsKey, notificationsEnabled);
  }

  Future<(bool, bool)> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool(_darkModeKey) ?? false;
    final notificationsEnabled = prefs.getBool(_notificationsKey) ?? true;
    return (isDarkMode, notificationsEnabled);
  }
}
