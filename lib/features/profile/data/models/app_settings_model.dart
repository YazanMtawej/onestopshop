class AppSettingsModel {
  final bool isDarkMode;
  final bool notificationsEnabled;
  AppSettingsModel({
    required this.isDarkMode,
    required this.notificationsEnabled,
  });
  AppSettingsModel copyWith({bool? isDarkMode, bool? notificationsEnabled}) {
    return AppSettingsModel(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    );
  }
}
