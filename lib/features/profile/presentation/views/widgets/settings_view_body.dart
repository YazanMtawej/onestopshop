import 'package:flutter/material.dart';
import 'package:onestopshop/constents.dart';
import 'package:onestopshop/features/profile/data/models/app_settings_model.dart';
import 'package:onestopshop/features/profile/presentation/view_models/settings_cubit/settings_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, AppSettingsModel>(
      builder: (context, state) {
        final themeColor = kAppBarColor;
        return Scaffold(
          backgroundColor: themeColor.shade50,
          appBar: AppBar(
            backgroundColor: themeColor,
            title: const Text("Settings"),
            foregroundColor: Colors.white,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                _settingCard(
                  icon: Icons.dark_mode,
                  title: "Night Mode",
                  value: state.isDarkMode,
                  onChanged:
                      (_) => context.read<SettingsCubit>().toggleDarkMode(),
                  themeColor: themeColor,
                ),
                const SizedBox(height: 20),
                _settingCard(
                  icon: Icons.notifications_active,
                  title: "Notification",
                  value: state.notificationsEnabled,
                  onChanged:
                      (_) =>
                          context.read<SettingsCubit>().toggleNotifications(),
                  themeColor: themeColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _settingCard({
    required IconData icon,
    required String title,
    required bool value,
    required void Function(bool) onChanged,
    required MaterialColor themeColor,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: themeColor.shade100,
      child: ListTile(
        leading: Icon(icon, color: themeColor.shade700),
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        trailing: Switch(
          activeColor: themeColor.shade700,
          value: value,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
