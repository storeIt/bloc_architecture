part of 'app_bloc.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}
class AppLoadingState extends AppState {}

class AppSuccessState<V> extends AppState {
  final V value;

  AppSuccessState(this.value);
}

class AppFailureState<E> extends AppState {
  final E error;

  AppFailureState(this.error);
}
