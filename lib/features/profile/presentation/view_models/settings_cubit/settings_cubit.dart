import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onestopshop/features/profile/data/models/app_settings_model.dart';
import 'package:onestopshop/core/services/app_settings_service.dart';


class SettingsCubit extends Cubit<AppSettingsModel> {
  final AppSettingsService _service;
  SettingsCubit(this._service)
    : super(AppSettingsModel(isDarkMode: false, notificationsEnabled: true)) {
    loadSettings();
  }
  Future<void> loadSettings() async {
    final (dark, notif) = await _service.loadSettings();
    emit(AppSettingsModel(isDarkMode: dark, notificationsEnabled: notif));
  }

  void toggleDarkMode() {
    final updated = state.copyWith(isDarkMode: !state.isDarkMode);
    emit(updated);
    _save(updated);
  }

  void toggleNotifications() {
    final updated = state.copyWith(
      notificationsEnabled: !state.notificationsEnabled,
    );
    emit(updated);
    _save(updated);
  }

  void _save(AppSettingsModel model) {
    _service.saveSettings(
      isDarkMode: model.isDarkMode,
      notificationsEnabled: model.notificationsEnabled,
    );
  }
}
