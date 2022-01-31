import 'package:http/http.dart';

class ApiError extends Error {
  ApiError();
}

class ApiNetworkError extends ApiError {
  ApiNetworkError(this.response, this.message);

  final Response response;

  final String message;

  @override
  String toString() {
    return 'ApiNetworkError{response: $response, message: $message}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ApiNetworkError &&
          runtimeType == other.runtimeType &&
          response == other.response &&
          message == other.message;

  @override
  int get hashCode => response.hashCode ^ message.hashCode;
}
