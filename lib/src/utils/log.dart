import 'dart:developer' as developer;

class Log {
  static void log(String message, {Object? error, StackTrace? stackTrace}) {
    developer.log(
      message,
      name: "Tá Caro?",
      error: error,
      stackTrace: stackTrace,
    );
  }
}
