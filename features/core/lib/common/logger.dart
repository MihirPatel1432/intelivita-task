import 'package:logger/logger.dart';

class AppLogger {
  AppLogger._();

  static final Logger _logger = Logger(printer: PrettyPrinter());

  static void v(dynamic message) {
    _logger.w(message);
  }

  /// Log a message at level [Level.debug].
  static void d(dynamic message) {
    _logger.d(message);
  }

  /// Log a message at level [Level.info].
  static void i(dynamic message) {
    _logger.i(message);
  }

  /// Log a message at level [Level.warning].
  static void w(dynamic message) {
    _logger.w(message);
  }

  /// Log a message at level [Level.error].
  static void e(dynamic message) {
    _logger.e(message);
  }

  /// Log a message at level [Level.f].
  static void wtf(dynamic message) {
    _logger.f(message);
  }
}
