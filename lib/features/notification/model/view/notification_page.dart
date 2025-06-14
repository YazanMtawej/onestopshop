import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:onestopshop/features/notification/view_model/notification_cubit.dart';
import 'package:onestopshop/features/notification/view_model/notification_state.dart';
import 'package:onestopshop/services/notification_service.dart';
import 'package:permission_handler/permission_handler.dart';


class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  late NotificationCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = NotificationCubit(NotificationService())..init();
    _requestPermission();
  }

  Future<void> _requestPermission() async {
    if (await Permission.notification.isDenied) {
      await Permission.notification.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _cubit,
      child: Scaffold(
        appBar: AppBar(title: const Text('الإشعارات المحلية')),
        body: BlocListener<NotificationCubit, NotificationState>(
          listener: (context, state) {
            if (state is NotificationError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('خطأ: ${state.message}')));
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () => _cubit.showNotification("فوري", "إشعار الآن"),
                  child: const Text('إظهار إشعار فوري'),
                ),
                ElevatedButton(
                  onPressed: () => _cubit.scheduleNotification(
                    "مجدول", "سيظهر بعد 5 ثوانٍ",
                    DateTime.now().add(const Duration(seconds: 5)),
                  ),
                  child: const Text('جدولة إشعار بعد 5 ثواني'),
                ),
                ElevatedButton(
                  onPressed: _cubit.cancelAll,
                  child: const Text('إلغاء كل الإشعارات'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}