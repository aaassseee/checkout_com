enum TokenType { card, googlePay }

extension TokenTypeValueExtension on TokenType {
  String get value {
    switch (this) {
      case TokenType.card:
        return 'card';

      case TokenType.googlePay:
        return 'googlepay';
    }
  }
}
