import 'package:bloc_architecture/src/base/app_cubit/base_state.dart';

enum RequestStatus { initial, loading, loaded, failure }

class RequestState extends BaseState {
  final RequestStatus status;
  final String? errorMessage;

  const RequestState({
    this.status = RequestStatus.initial,
    this.errorMessage,
  });

  const RequestState.initial() : this(status: RequestStatus.initial);
  const RequestState.loading() : this(status: RequestStatus.loading);

  @override
  List<Object?> get props => [status, errorMessage];

  @override
  String toString() => '$status: $errorMessage';
}
