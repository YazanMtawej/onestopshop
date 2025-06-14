import 'package:equatable/equatable.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();
  @override
  List<Object> get props => [];
}

class NotificationInitial extends NotificationState {}
class NotificationShown extends NotificationState {}
class NotificationScheduled extends NotificationState {}
class NotificationCancelled extends NotificationState {}
class NotificationError extends NotificationState {
  final String message;
  const NotificationError(this.message);
  @override
  List<Object> get props => [message];
}