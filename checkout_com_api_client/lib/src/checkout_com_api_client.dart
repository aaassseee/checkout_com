import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:logging/logging.dart';
import 'package:uuid/uuid.dart';

import 'constant/api.dart';
import 'constant/log.dart';
import 'extension/response.dart';
import 'model/local/api_error.dart';
import 'model/local/log_event.dart';
import 'model/service/environment.dart';
import 'model/service/token_type.dart';
import 'model/service/tokenization_request.dart';
import 'model/service/tokenization_response.dart';

class CheckoutComApiClient {
  CheckoutComApiClient(this.key, {this.environment = Environment.sandbox}) {
    switch (environment) {
      case Environment.sandbox:
        _logger.level = Level.ALL;
        break;

      case Environment.live:
        _logger.level = Level.WARNING;
        break;
    }
  }

  final Environment environment;

  final String key;

  final Client client = Client();

  final Logger _logger = Logger('frames-flutter-sdk');

  String correlationID = const Uuid().v4();

  String get authority {
    switch (environment) {
      case Environment.sandbox:
        return apiSandboxAuthority;

      case Environment.live:
        return apiLiveAuthority;
    }
  }

  Map<String, String> get header => {
        HttpHeaders.authorizationHeader: key,
        HttpHeaders.userAgentHeader: 'checkout-sdk-frames-android/0.0.1',
        HttpHeaders.contentTypeHeader: 'application/json',
        'Cko-Correlation-Id': correlationID,
      };

  Map<String, String> get _metadata =>
      {'publicKey': key, 'correlationID': correlationID};

  Future<CardTokenizationSuccessResponse> generateToken(
      CardTokenizationRequest request) async {
    try {
      _logger.info(LogEvent(LogEventType.tokenRequested,
          event: {
            logEventAttributeTokenType: TokenType.card.value,
          },
          metadata: _metadata));
      final response = await client
          .post(Uri.https(authority, 'tokens'),
              headers: header, body: request.toJson())
          .timeout(apiTimeout);

      final result = response.body;
      if (result.isEmpty) {
        String message;
        if (response.isSuccess || response.statusCode == 422) {
          message = 'Invalid server response';
        } else if (response.statusCode == 401) {
          message = 'Unauthorised request';
        } else {
          message = 'Token request failed';
        }

        throw ApiNetworkError(response, message);
      }

      if (!response.isSuccess) {
        throw CardTokenizationFailResponse.fromJson(json.decode(result));
      }

      return CardTokenizationSuccessResponse.fromJson(json.decode(result));
    } catch (error, stackTrace) {
      _logger.shout(error, error, stackTrace);
      rethrow;
    }
  }

  Future<GooglePayTokenizationSuccessResponse> generateGooglePayToken(
      GooglePayTokenizationRequest request) async {
    try {
      _logger.info(LogEvent(LogEventType.tokenRequested,
          event: {
            logEventAttributeTokenType: TokenType.googlePay.value,
          },
          metadata: _metadata));
      final response = await client
          .post(Uri.https(authority, 'tokens'),
              headers: header, body: request.toJson())
          .timeout(apiTimeout);

      final result = response.body;
      if (result.isEmpty) {
        String message;
        if (response.isSuccess || response.statusCode == 422) {
          message = 'Invalid server response';
        } else if (response.statusCode == 401) {
          message = 'Unauthorised request';
        } else {
          message = 'Token request failed';
        }

        throw ApiNetworkError(response, message);
      }

      if (!response.isSuccess) {
        throw GooglePayTokenizationFailResponse.fromJson(json.decode(result));
      }

      return GooglePayTokenizationSuccessResponse.fromJson(json.decode(result));
    } catch (error, stackTrace) {
      _logger.shout(error, error, stackTrace);
      rethrow;
    }
  }
}
