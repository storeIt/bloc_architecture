part of 'app_bloc.dart';

@immutable
abstract class AppEvent {}

class AppLoadingEvent extends AppEvent {}
class AppLoadedEvent extends AppEvent {}

class AppFailureEvent extends AppEvent {
  final String message;

  AppFailureEvent({required this.message});
}
