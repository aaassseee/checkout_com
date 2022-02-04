import 'dart:convert';

import '../../constant/log.dart';

class LogEvent {
  LogEvent(this.type, {this.event, this.metadata});

  final LogEventType type;

  final Map<String, dynamic>? event;

  final Map<String, dynamic>? metadata;

  final DateTime time = DateTime.now();

  Map<String, dynamic> toJson() => {
        'type': type.eventId,
        if (event != null) 'event': event,
        if (metadata != null) 'metadata': metadata,
        'time': time.toIso8601String(),
      };

  String toJsonString() => json.encode(toJson());

  @override
  String toString() => toJsonString();
}

enum LogEventType {
  paymentFormPresented,
  tokenRequested,
  tokenResponse,
  billingFormPresented,
}

extension LogEventTypeExtension on LogEventType {
  String get eventId {
    switch (this) {
      case LogEventType.paymentFormPresented:
        return logEventTypePaymentFormPresented;

      case LogEventType.tokenRequested:
        return logEventTypeTokenRequested;

      case LogEventType.tokenResponse:
        return logEventTypeTokenResponse;

      case LogEventType.billingFormPresented:
        return logEventTypeBillingFormPresented;
    }
  }
}
