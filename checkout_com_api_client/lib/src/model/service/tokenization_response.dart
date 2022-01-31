import 'billing_address.dart';
import 'phone.dart';

abstract class TokenizationResponse {
  const TokenizationResponse._();

  factory TokenizationResponse.card(Map<String, dynamic> json) {
    return CardTokenizationSuccessResponse.fromJson(json);
  }

  factory TokenizationResponse.googlePay(Map<String, dynamic> json) {
    return GooglePayTokenizationSuccessResponse.fromJson(json);
  }
}

abstract class TokenizationSuccessResponse extends TokenizationResponse {
  const TokenizationSuccessResponse._(
      this.type,
      this.token,
      this.expiresOn,
      this.expiryMonth,
      this.expiryYear,
      this.scheme,
      this.last4,
      this.bin,
      this.cardType,
      this.cardCategory,
      this.issuer,
      this.issuerCountry,
      this.productId,
      this.productType)
      : super._();

  final String type;

  final String token;

  final String expiresOn;

  final int expiryMonth;

  final int expiryYear;

  final String scheme;

  final String last4;

  final String bin;

  final String cardType;

  final String cardCategory;

  final String issuer;

  final String issuerCountry;

  final String productId;

  final String productType;

  @override
  String toString() {
    return 'TokenizationSuccessResponse{type: $type, token: $token, expiresOn: $expiresOn, expiryMonth: $expiryMonth, expiryYear: $expiryYear, scheme: $scheme, last4: $last4, bin: $bin, cardType: $cardType, cardCategory: $cardCategory, issuer: $issuer, issuerCountry: $issuerCountry, productId: $productId, productType: $productType}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TokenizationSuccessResponse &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          token == other.token &&
          expiresOn == other.expiresOn &&
          expiryMonth == other.expiryMonth &&
          expiryYear == other.expiryYear &&
          scheme == other.scheme &&
          last4 == other.last4 &&
          bin == other.bin &&
          cardType == other.cardType &&
          cardCategory == other.cardCategory &&
          issuer == other.issuer &&
          issuerCountry == other.issuerCountry &&
          productId == other.productId &&
          productType == other.productType;

  @override
  int get hashCode =>
      type.hashCode ^
      token.hashCode ^
      expiresOn.hashCode ^
      expiryMonth.hashCode ^
      expiryYear.hashCode ^
      scheme.hashCode ^
      last4.hashCode ^
      bin.hashCode ^
      cardType.hashCode ^
      cardCategory.hashCode ^
      issuer.hashCode ^
      issuerCountry.hashCode ^
      productId.hashCode ^
      productType.hashCode;
}

abstract class TokenizationFailResponse extends TokenizationResponse {
  const TokenizationFailResponse._(
      this.requestId, this.errorType, this.errorCodes)
      : super._();

  TokenizationFailResponse.fromJson(Map<String, dynamic> json)
      : this._(json['request_id'], json['error_type'], json['error_codes']);

  final String requestId;

  final String errorType;

  final List<String> errorCodes;
}

class CardTokenizationSuccessResponse extends TokenizationSuccessResponse {
  CardTokenizationSuccessResponse._(
      String type,
      String token,
      String expiresOn,
      int expiryMonth,
      int expiryYear,
      String scheme,
      String last4,
      String bin,
      String cardType,
      String cardCategory,
      String issuer,
      String issuerCountry,
      String productId,
      String productType,
      this.billingAddress,
      this.phone,
      this.name)
      : super._(
            type,
            token,
            expiresOn,
            expiryMonth,
            expiryYear,
            scheme,
            last4,
            bin,
            cardType,
            cardCategory,
            issuer,
            issuerCountry,
            productId,
            productType);

  CardTokenizationSuccessResponse.fromJson(Map<String, dynamic> json)
      : this._(
            json['type'],
            json['token'],
            json['expires_on'],
            json['expiry_month'],
            json['expiry_year'],
            json['scheme'],
            json['last4'],
            json['bin'],
            json['card_type'],
            json['card_category'],
            json['issuer'],
            json['issuer_country'],
            json['product_id'],
            json['product_type'],
            BillingAddress.fromJson(json['billing_address']),
            Phone.fromJson(json['phone']),
            json['name']);

  final BillingAddress billingAddress;

  final Phone phone;

  final String name;
}

class CardTokenizationFailResponse extends TokenizationFailResponse {
  CardTokenizationFailResponse._(
      String requestId, String errorType, List<String> errorCodes)
      : super._(requestId, errorType, errorCodes);

  CardTokenizationFailResponse.fromJson(Map<String, dynamic> json)
      : super.fromJson(json);
}

class GooglePayTokenizationSuccessResponse extends TokenizationSuccessResponse {
  GooglePayTokenizationSuccessResponse._(
      String type,
      String token,
      String expiresOn,
      int expiryMonth,
      int expiryYear,
      String scheme,
      String last4,
      String bin,
      String cardType,
      String cardCategory,
      String issuer,
      String issuerCountry,
      String productId,
      String productType)
      : super._(
            type,
            token,
            expiresOn,
            expiryMonth,
            expiryYear,
            scheme,
            last4,
            bin,
            cardType,
            cardCategory,
            issuer,
            issuerCountry,
            productId,
            productType);

  GooglePayTokenizationSuccessResponse.fromJson(Map<String, dynamic> json)
      : this._(
            json['type'],
            json['token'],
            json['expires_on'],
            json['expiry_month'],
            json['expiry_year'],
            json['scheme'],
            json['last4'],
            json['bin'],
            json['card_type'],
            json['card_category'],
            json['issuer'],
            json['issuer_country'],
            json['product_id'],
            json['product_type']);
}

class GooglePayTokenizationFailResponse extends TokenizationFailResponse {
  GooglePayTokenizationFailResponse._(
      String requestId, String errorType, List<String> errorCodes)
      : super._(requestId, errorType, errorCodes);

  GooglePayTokenizationFailResponse.fromJson(Map<String, dynamic> json)
      : super.fromJson(json);
}
