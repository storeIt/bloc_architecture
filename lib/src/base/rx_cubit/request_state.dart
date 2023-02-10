import 'base_state.dart';

enum RequestStatus { init, loading, loaded, error }

class RequestState extends BaseState {
  final RequestStatus status;
  final String? errorMessage;

  const RequestState({
    this.status = RequestStatus.init,
    this.errorMessage,
  });

  const RequestState.init() :
        this(status: RequestStatus.init);

  const RequestState.loading() :
        this(status: RequestStatus.loading);

  @override
  List<Object?> get props => [
    status,
    errorMessage,
  ];

  @override
  String toString() => '($status: $errorMessage)';
}