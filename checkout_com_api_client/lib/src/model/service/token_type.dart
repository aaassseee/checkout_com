enum TokenType { card, googlePay, applePay }

extension TokenTypeValueExtension on TokenType {
  String get value {
    switch (this) {
      case TokenType.card:
        return 'card';

      case TokenType.googlePay:
        return 'googlepay';

      case TokenType.applePay:
        return 'applepay';
    }
  }
}
