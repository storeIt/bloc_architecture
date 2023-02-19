class BaseRepository {
  void executeRequest<T>({
    required Future<T> request,
    required BaseRepository repository,
  }) {}
}