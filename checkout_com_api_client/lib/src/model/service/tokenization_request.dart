import 'dart:convert';

import 'billing_address.dart';
import 'card.dart';
import 'phone.dart';
import 'token_type.dart';

class CardTokenizationRequest {
  CardTokenizationRequest(this.card, {this.billing, this.phone});

  final Card card;

  final BillingAddress? billing;

  final Phone? phone;

  Map toJson() => {
        'type': TokenType.card.value,
        'number': card.number,
        if (card.name != null) 'name': card.name,
        'expiry_month': card.expiryMonth,
        'expiry_year': card.expiryYear,
        'cvv': card.cvv,
        if (billing != null) 'billing_address': billing!.toJson(),
        if (phone != null) 'phone': phone!.toJson(),
      };

  String toJsonString() => json.encode(toJson());
}

class GooglePayTokenizationRequest {
  GooglePayTokenizationRequest(
      this.signature, this.protocolVersion, this.signedMessage);

  String? signature;

  String? protocolVersion;

  String? signedMessage;

  Map? toJson() {
    if (signature == null && protocolVersion == null && signedMessage == null) {
      return null;
    }

    return {
      'token_data': {
        if (signature != null) 'signature': signature,
        if (protocolVersion != null) 'protocolVersion': protocolVersion,
        if (signedMessage != null) 'signedMessage': signedMessage,
      }
    };
  }

  String toJsonString() => json.encode(toJson());
}
