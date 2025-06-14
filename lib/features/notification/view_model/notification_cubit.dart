import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:onestopshop/services/notification_service.dart';

import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final NotificationService _service;

  NotificationCubit(this._service) : super(NotificationInitial());

  Future<void> init() async {
    await _service.init();
  }

  Future<void> showNotification(String title, String body) async {
    try {
      await _service.showNotification(
        id: DateTime.now().millisecondsSinceEpoch ~/ 1000,
        title: title,
        body: body,
      );
      emit(NotificationShown());
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }

  Future<void> scheduleNotification(String title, String body, DateTime time) async {
    try {
      await _service.scheduleNotification(
        id: DateTime.now().millisecondsSinceEpoch ~/ 1000,
        title: title,
        body: body,
        scheduledTime: time,
      );
      emit(NotificationScheduled());
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }

  Future<void> cancelAll() async {
    try {
      await _service.cancelAll();
      emit(NotificationCancelled());
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }
}