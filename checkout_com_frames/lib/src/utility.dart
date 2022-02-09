import 'package:clock/clock.dart';

import 'extension.dart';
import 'model/card_type.dart';

class CardUtility {
  const CardUtility._();

  static CardType getCardType(String? number) {
    if (number == null) {
      return CardType.fallback;
    }

    final processedNumber = number.removeAllSpace;

    if (processedNumber.isEmpty) {
      return CardType.fallback;
    }

    for (final type in CardType.values) {
      if (RegExp(type.pattern).hasMatch(processedNumber)) {
        return type;
      }
    }

    return CardType.fallback;
  }

  static bool isValidCard(String number) {
    if (number.isEmpty) {
      return false;
    }

    final processedNumber = number.removeAllSpace;
    final type = getCardType(processedNumber);
    if (type == CardType.fallback) {
      return false;
    }

    if (!type.cardLengthList
        .any((cardLength) => cardLength == processedNumber.length)) {
      return false;
    }

    if (type.luhn) {
      return isValidLuhn(processedNumber);
    }

    return true;
  }

  static bool isValidLuhn(String number) {
    final reversedNumber = number.removeAllSpace.codeUnits.reversed;
    final length = reversedNumber.length;
    int oddSum = 0;
    int evenSum = 0;
    for (int i = 0; i < length; i++) {
      final digit = int.parse(String.fromCharCode(reversedNumber.elementAt(i)),
          radix: 10);
      if (i.isEven) {
        oddSum += digit;
      } else {
        evenSum += (digit / 5).floor() + (2 * digit) % 10;
      }
    }

    return (oddSum + evenSum) % 10 == 0;
  }

  static String getFormattedCardNumber(String number) {
    final processedNumber = number.removeAllSpace;
    final type = getCardType(processedNumber);
    List<int> codeUnitList = processedNumber.codeUnits.toList();
    for (final gapPosition in type.gapPositionList) {
      if (codeUnitList.length < gapPosition + 1) {
        break;
      }
      codeUnitList.insert(gapPosition, 32);
    }

    return String.fromCharCodes(codeUnitList);
  }

  static bool isValidExpirationDate(int year, int month) {
    if (year.isNegative || month < 1 || month > 12) {
      return false;
    }

    final now = clock.now();
    final yearNow = now.year;
    if (year < yearNow) {
      return false;
    }

    final monthNow = now.month;
    if (year == yearNow && month < monthNow) {
      return false;
    }

    return true;
  }

  static bool isValidCvv(String cvv, CardType cardType) {
    if (cvv.isEmpty) {
      return false;
    }

    final processedCvv = cvv.removeAllSpace;
    if (!processedCvv.isNumeric) {
      return false;
    }

    if (cardType.maxCvvLength != processedCvv.length) {
      return false;
    }

    return true;
  }
}
