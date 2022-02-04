import '../utility.dart';
import 'card_type.dart';

class CardFormValue {
  CardFormValue(
      {this.number, this.expirationYear, this.expirationMonth, this.cvv});

  String? number;

  int? expirationYear;

  int? expirationMonth;

  String? cvv;

  CardType get cardType => CardUtility.getCardType(number);

  @override
  String toString() {
    return 'CardFormValue{number: $number, expirationYear: $expirationYear, expirationMonth: $expirationMonth, cvv: $cvv}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardFormValue &&
          runtimeType == other.runtimeType &&
          number == other.number &&
          expirationYear == other.expirationYear &&
          expirationMonth == other.expirationMonth &&
          cvv == other.cvv;

  @override
  int get hashCode =>
      number.hashCode ^
      expirationYear.hashCode ^
      expirationMonth.hashCode ^
      cvv.hashCode;
}
