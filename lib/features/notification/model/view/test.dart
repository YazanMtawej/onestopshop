import 'package:flutter/material.dart';
import 'package:onestopshop/services/notification_service.dart';

class TestNotificationView extends StatelessWidget {
  const TestNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('اختبار الإشعارات')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                await NotificationService().showNotification(
                  id: 1,
                  title: 'إشعار فوري',
                  body: 'تم عرض هذا الإشعار مباشرة',
                );
              },
              child: const Text('إظهار إشعار فوري'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final DateTime now = DateTime.now();
                final DateTime scheduledTime = now.add(const Duration(seconds: 5));

                await NotificationService().scheduleNotification(
                  id: 2,
                  title: 'إشعار مجدول',
                  body: 'تمت جدولة هذا الإشعار بعد 5 ثوانٍ',
                  scheduledTime: scheduledTime,
                );
              },
              child: const Text('جدولة إشعار بعد 5 ثوانٍ'),
            ),
          ],
        ),
      ),
    );
  }
}
