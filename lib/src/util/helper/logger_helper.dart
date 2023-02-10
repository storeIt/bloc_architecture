import 'package:logger/logger.dart';

class LoggerHelper {
  final Logger _logger;

  LoggerHelper() : _logger = Logger(printer: PrettyPrinter());

  void e(String message, dynamic e, StackTrace? stack) {
    _logger.e(message, e, stack);
  }
}
