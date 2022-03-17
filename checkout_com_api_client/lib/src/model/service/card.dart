class CheckoutComCard {
  const CheckoutComCard(
      this.number, this.expiryYear, this.expiryMonth, this.cvv);

  final String number;

  final int expiryYear;

  final int expiryMonth;

  final String cvv;

  @override
  String toString() {
    return 'Card{number: $number, expiryYear: $expiryYear, expiryMonth: $expiryMonth, cvv: $cvv}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CheckoutComCard &&
          runtimeType == other.runtimeType &&
          number == other.number &&
          expiryYear == other.expiryYear &&
          expiryMonth == other.expiryMonth &&
          cvv == other.cvv;

  @override
  int get hashCode =>
      number.hashCode ^
      expiryYear.hashCode ^
      expiryMonth.hashCode ^
      cvv.hashCode;
}
