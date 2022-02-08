class Card {
  const Card(
      this.number, this.name, this.expiryMonth, this.expiryYear, this.cvv);

  final String number;

  final String? name;

  final int expiryMonth;

  final int expiryYear;

  final String cvv;

  @override
  String toString() {
    return 'Card{number: $number, name: $name, expiryMonth: $expiryMonth, expiryYear: $expiryYear, cvv: $cvv}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Card &&
          runtimeType == other.runtimeType &&
          number == other.number &&
          name == other.name &&
          expiryMonth == other.expiryMonth &&
          expiryYear == other.expiryYear &&
          cvv == other.cvv;

  @override
  int get hashCode =>
      number.hashCode ^
      name.hashCode ^
      expiryMonth.hashCode ^
      expiryYear.hashCode ^
      cvv.hashCode;
}
