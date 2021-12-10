typedef Empty = Function();
typedef Loading = Function();
typedef Success<T> = Function(T data);
typedef Error = Function(String message, Exception? exception);
typedef OrElse = Function();

abstract class State {
  dynamic when({
    Empty? empty,
    Loading? loading,
    Success? success,
    Error? error,
    required OrElse orElse,
  });

  static empty() => StateEmpty();
  static loading() => StateLoading();
  static success<T>(T data) => StateSuccess<T>(data);
  static error(String message, {Exception? exception}) => StateError(message, exception: exception);
}

class StateEmpty extends State {
  @override
  when({Empty? empty, Loading? loading, Success? success, Error? error, required OrElse orElse}) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }
}

class StateLoading extends State {
  @override
  when({Empty? empty, Loading? loading, Success? success, Error? error, required OrElse orElse}) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }
}

class StateSuccess<T> extends State {
  final T data;
  StateSuccess(this.data);

  @override
  when({Empty? empty, Loading? loading, Success? success, Error? error, required OrElse orElse}) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }
}

class StateError extends State {
  final String message;
  final Exception? exception;

  StateError(this.message, {this.exception});

  @override
  when({Empty? empty, Loading? loading, Success? success, Error? error, required OrElse orElse}) {
    if (error != null) {
      return error(message, exception);
    }
    return orElse();
  }
}
