part of 'app_bloc.dart';

@immutable
abstract class AppState {}

class AppInitialState extends AppState {}
class AppLoadingState extends AppState {}
class AppLoadedState extends AppState {}

class AppFailureState<E> extends AppState {
  final E error;

  AppFailureState(this.error);
}
