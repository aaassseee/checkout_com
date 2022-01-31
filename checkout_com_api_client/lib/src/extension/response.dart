import 'package:http/http.dart';

extension ResponseExtension on Response {
  bool get isSuccess => statusCode >= 200 && statusCode <= 299;
}
