import 'dart:convert';

import 'billing_address.dart';
import 'card.dart';
import 'phone.dart';
import 'token_type.dart';

abstract class TokenizationRequest {
  const TokenizationRequest();

  TokenType get tokenType;

  Map? toJson();

  String toJsonString() => json.encode(toJson());
}

class CardTokenizationRequest extends TokenizationRequest {
  const CardTokenizationRequest(this.card,
      {this.name, this.billing, this.phone});

  final CheckoutComCard card;

  final String? name;

  final BillingAddress? billing;

  final Phone? phone;

  @override
  TokenType get tokenType => TokenType.card;

  @override
  Map? toJson() => {
        'type': tokenType.value,
        'number': card.number,
        if (name != null) 'name': name,
        'expiry_month': card.expiryMonth,
        'expiry_year': card.expiryYear,
        'cvv': card.cvv,
        if (billing != null) 'billing_address': billing!.toJson(),
        if (phone != null) 'phone': phone!.toJson(),
      };
}

class GooglePayTokenizationRequest extends TokenizationRequest {
  GooglePayTokenizationRequest(String token)
      : paymentResult = json.decode(token);

  final Map<String, dynamic> paymentResult;

  @override
  TokenType get tokenType => TokenType.googlePay;

  @override
  Map? toJson() => {
        'type': tokenType.value,
        'token_data': paymentResult,
      };
}

class ApplePayTokenizationRequest extends TokenizationRequest {
  ApplePayTokenizationRequest(String token)
      : paymentResult = json.decode(token);

  final Map<String, dynamic> paymentResult;

  @override
  TokenType get tokenType => TokenType.applePay;

  @override
  Map? toJson() => {
        'type': tokenType.value,
        'token_data': paymentResult,
      };
}
