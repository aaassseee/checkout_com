import 'dart:convert';

import 'billing_address.dart';
import 'card.dart';
import 'phone.dart';
import 'token_type.dart';

abstract class TokenizationRequest {
  const TokenizationRequest(this.tokenType);

  final TokenType tokenType;

  Map? toJson();

  String toJsonString() => json.encode(toJson());
}

class CardTokenizationRequest extends TokenizationRequest {
  const CardTokenizationRequest(this.card, {this.billing, this.phone})
      : super(TokenType.card);

  final Card card;

  final BillingAddress? billing;

  final Phone? phone;

  @override
  Map? toJson() => {
        'type': tokenType.value,
        'number': card.number,
        if (card.name != null) 'name': card.name,
        'expiry_month': card.expiryMonth,
        'expiry_year': card.expiryYear,
        'cvv': card.cvv,
        if (billing != null) 'billing_address': billing!.toJson(),
        if (phone != null) 'phone': phone!.toJson(),
      };
}

class GooglePayTokenizationRequest extends TokenizationRequest {
  const GooglePayTokenizationRequest(this.paymentResult)
      : super(TokenType.googlePay);

  final Map<String, dynamic> paymentResult;

  @override
  Map? toJson() => {
        'type': tokenType.value,
        'token_data': paymentResult,
      };
}

class ApplePayTokenizationRequest extends TokenizationRequest {
  const ApplePayTokenizationRequest(this.paymentResult)
      : super(TokenType.applePay);

  final Map<String, dynamic> paymentResult;

  @override
  Map? toJson() => {
        'type': tokenType.value,
        'token_data': paymentResult,
      };
}
