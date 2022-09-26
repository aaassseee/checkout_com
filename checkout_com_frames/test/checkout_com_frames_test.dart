import 'package:checkout_com_frames/src/extension.dart';
import 'package:checkout_com_frames/src/model/card_type.dart';
import 'package:checkout_com_frames/src/utility.dart';
import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('model test', () {
    test('model equatable', () {
      expect(CardType.visa == CardType.visa, true);
      expect(CardType.visa == CardType.mastercard, false);
      expect(CardType.visa.hashCode == CardType.visa.hashCode, true);
      expect(CardType.visa.hashCode == CardType.mastercard.hashCode, false);
    });

    test('model toString', () {
      expect(
          CardType.visa.toString(),
          stringContainsInOrder([
            'CardType',
            'name',
            'imagePath',
            'pattern',
            'regex',
            'cardLengthList',
            'maxCardLength',
            'maxCvvLength',
            'gapPositionList',
            'luhn',
          ]));
    });
  });

  group('string extension test', () {
    test('removeAllSpace', () {
      expect('44444444'.removeAllSpace, '44444444');
      expect('4444 4444'.removeAllSpace, '44444444');
    });

    test('isNumeric', () {
      expect('1'.isNumeric, true);
      expect('a'.isNumeric, false);
      expect('A'.isNumeric, false);
      expect('*'.isNumeric, false);
      expect(' '.isNumeric, false);
      expect('44444444'.isNumeric, true);
      expect(' 44444444'.isNumeric, true);
      expect('441A2'.isNumeric, false);
      expect('441A2/*'.isNumeric, false);
    });
  });

  group('utility', () {
    group('get card type', () {
      test('visa card type', () {
        expect(CardUtility.getCardType('4'), CardType.visa);
        expect(CardUtility.getCardType('4242424242424242'), CardType.visa);
        expect(CardUtility.getCardType('4242 4242 4242 4242'), CardType.visa);
      });

      test('mastercard card type', () {
        expect(CardUtility.getCardType('5436'), CardType.mastercard);
        expect(
            CardUtility.getCardType('5436031030606378'), CardType.mastercard);
        expect(CardUtility.getCardType('5436 0310 3060 6378'),
            CardType.mastercard);
      });

      test('amex card type', () {
        expect(CardUtility.getCardType('3456'), CardType.amex);
        expect(CardUtility.getCardType('345678901234564'), CardType.amex);
        expect(CardUtility.getCardType('3456 789012 34564'), CardType.amex);
      });

      test('diners club card type', () {
        expect(CardUtility.getCardType('301234'), CardType.dinersclub);
        expect(CardUtility.getCardType('30123456789019'), CardType.dinersclub);
        expect(
            CardUtility.getCardType('3012 345678 9019'), CardType.dinersclub);
      });

      test('discover card type', () {
        expect(CardUtility.getCardType('60111111'), CardType.discover);
        expect(CardUtility.getCardType('6011111111111117'), CardType.discover);
        expect(
            CardUtility.getCardType('6011 1111 1111 1117'), CardType.discover);
      });

      test('jcb card type', () {
        expect(CardUtility.getCardType('35301113'), CardType.jcb);
        expect(CardUtility.getCardType('3530111333300000'), CardType.jcb);
        expect(CardUtility.getCardType('3530 1113 3330 0000'), CardType.jcb);
      });

      test('unionpay card type', () {
        expect(CardUtility.getCardType('621234'), CardType.unionpay);
        expect(CardUtility.getCardType('6212345678901265'), CardType.unionpay);
        expect(
            CardUtility.getCardType('6212 345678 901265'), CardType.unionpay);
      });

      test('maestro card type', () {
        expect(CardUtility.getCardType('6759649826438'), CardType.maestro);
        expect(
            CardUtility.getCardType('6759 6498 2643 8453'), CardType.maestro);
      });

      test('fallback card type', () {
        expect(CardUtility.getCardType('1111'), CardType.fallback);
        expect(CardUtility.getCardType('111111111111111'), CardType.fallback);
        expect(
            CardUtility.getCardType('1111 1111 1111 111'), CardType.fallback);
      });
    });

    group('Luhn valication', () {
      test('Luhn valication success', () {
        expect(CardUtility.isValidLuhn('4242424242424242'), true);
        expect(CardUtility.isValidLuhn('4242 4242 4242 4242'), true);
      });
      test('Luhn valication failed', () {
        expect(CardUtility.isValidLuhn('4242424242424241'), false);
        expect(CardUtility.isValidLuhn('4242 4242 4242 4241'), false);
      });
    });

    group('card validation', () {
      test('visa card valication', () {
        expect(CardUtility.isValidCard('42'), false);
        expect(CardUtility.isValidCard('4242424242424242'), true);
        expect(CardUtility.isValidCard('4242 4242 4242 4242'), true);
      });

      test('mastercard valication', () {
        expect(CardUtility.isValidCard('5436'), false);
        expect(CardUtility.isValidCard('5436031030606378'), true);
        expect(CardUtility.isValidCard('5436 0310 3060 6378'), true);
      });

      test('amex card valication', () {
        expect(CardUtility.isValidCard('3456'), false);
        expect(CardUtility.isValidCard('345678901234564'), true);
        expect(CardUtility.isValidCard('3456 789012 34564'), true);
      });

      test('diners card valication', () {
        expect(CardUtility.isValidCard('301234'), false);
        expect(CardUtility.isValidCard('30123456789019'), true);
        expect(CardUtility.isValidCard('3012 345678 9019'), true);
      });

      test('discover card valication', () {
        expect(CardUtility.isValidCard('60111111'), false);
        expect(CardUtility.isValidCard('6011111111111117'), true);
        expect(CardUtility.isValidCard('6011 1111 1111 1117'), true);
      });

      test('jcb card valication', () {
        expect(CardUtility.isValidCard('35301113'), false);
        expect(CardUtility.isValidCard('3530111333300000'), true);
        expect(CardUtility.isValidCard('3530 1113 3330 0000'), true);
      });

      test('unionpay card valication', () {
        expect(CardUtility.isValidCard('621234'), false);
        expect(CardUtility.isValidCard('6222988812340000'), true);
        expect(CardUtility.isValidCard('6222 988812 340000'), true);
      });

      test('maestro card valication', () {
        expect(CardUtility.isValidCard('6759649'), false);
        expect(CardUtility.isValidCard('6759649826438453'), true);
        expect(CardUtility.isValidCard('6759 6498 2643 8453'), true);
      });
    });

    group('formatted card number', () {
      test('formatted visa card number', () {
        expect(CardUtility.getFormattedCardNumber('4242'), '4242');
        expect(CardUtility.getFormattedCardNumber('42424242'), '4242 4242');
        expect(CardUtility.getFormattedCardNumber('424242424242'),
            '4242 4242 4242');
        expect(CardUtility.getFormattedCardNumber('4242424242424242'),
            '4242 4242 4242 4242');
      });

      test('formatted mastercard number', () {
        expect(CardUtility.getFormattedCardNumber('5436'), '5436');
        expect(CardUtility.getFormattedCardNumber('54360310'), '5436 0310');
        expect(CardUtility.getFormattedCardNumber('543603103060'),
            '5436 0310 3060');
        expect(CardUtility.getFormattedCardNumber('5436031030606378'),
            '5436 0310 3060 6378');
      });

      test('formatted amex card number', () {
        expect(CardUtility.getFormattedCardNumber('3782'), '3782');
        expect(CardUtility.getFormattedCardNumber('3782822463'), '3782 822463');
        expect(CardUtility.getFormattedCardNumber('378282246310005'),
            '3782 822463 10005');
      });

      test('formatted diners club card number', () {
        expect(CardUtility.getFormattedCardNumber('3012'), '3012');
        expect(CardUtility.getFormattedCardNumber('3012345678'), '3012 345678');
        expect(CardUtility.getFormattedCardNumber('30123456789019'),
            '3012 345678 9019');
      });

      test('formatted discover card number', () {
        expect(CardUtility.getFormattedCardNumber('6011'), '6011');
        expect(CardUtility.getFormattedCardNumber('60111111'), '6011 1111');
        expect(CardUtility.getFormattedCardNumber('601111111111'),
            '6011 1111 1111');
        expect(CardUtility.getFormattedCardNumber('6011111111111117'),
            '6011 1111 1111 1117');
      });

      test('formatted jcb card number', () {
        expect(CardUtility.getFormattedCardNumber('3530'), '3530');
        expect(CardUtility.getFormattedCardNumber('35301113'), '3530 1113');
        expect(CardUtility.getFormattedCardNumber('353011133330'),
            '3530 1113 3330');
        expect(CardUtility.getFormattedCardNumber('3530111333300000'),
            '3530 1113 3330 0000');
      });

      test('formatted unionpay card number', () {
        expect(CardUtility.getFormattedCardNumber('6212'), '6212');
        expect(CardUtility.getFormattedCardNumber('6212345678'), '6212 345678');
        expect(CardUtility.getFormattedCardNumber('6212345678901265'),
            '6212 345678 901265');
      });

      test('formatted maestro card number', () {
        expect(CardUtility.getFormattedCardNumber('6759'), '6759');
        expect(CardUtility.getFormattedCardNumber('67596498'), '6759 6498');
        expect(CardUtility.getFormattedCardNumber('675964982643'),
            '6759 6498 2643');
        expect(CardUtility.getFormattedCardNumber('6759649826438453'),
            '6759 6498 2643 8453');
      });
    });

    group('expiration date validation', () {
      withClock(Clock.fixed(DateTime(2022, 1, 1)), () {
        test('expiration date validation success', () {
          expect(CardUtility.isValidExpirationDate(2022, 4), true);
          expect(CardUtility.isValidExpirationDate(2023, 2), true);
          expect(CardUtility.isValidExpirationDate(2022, 1), true);
        });

        test('expiration date validation failed', () {
          expect(CardUtility.isValidExpirationDate(2021, 4), false);
          expect(CardUtility.isValidExpirationDate(2021, 12), false);
          expect(CardUtility.isValidExpirationDate(1900, 1), false);
        });
      });
    });

    group('cvv validation', () {
      test('cvv validation success', () {
        expect(CardUtility.isValidCvv('111', CardType.visa), true);
        expect(CardUtility.isValidCvv('1111', CardType.amex), true);
        expect(CardUtility.isValidCvv('111', CardType.discover), true);
        expect(CardUtility.isValidCvv('111', CardType.unionpay), true);
        expect(CardUtility.isValidCvv('111', CardType.jcb), true);
        expect(CardUtility.isValidCvv('111', CardType.dinersclub), true);
        expect(CardUtility.isValidCvv('111', CardType.mastercard), true);
        expect(CardUtility.isValidCvv('111', CardType.maestro), true);
        expect(CardUtility.isValidCvv('111', CardType.fallback), true);
      });

      test('cvv validation failed', () {
        expect(CardUtility.isValidCvv('11', CardType.visa), false);
        expect(CardUtility.isValidCvv('111', CardType.amex), false);
        expect(CardUtility.isValidCvv('11', CardType.discover), false);
        expect(CardUtility.isValidCvv('11', CardType.unionpay), false);
        expect(CardUtility.isValidCvv('11', CardType.jcb), false);
        expect(CardUtility.isValidCvv('11', CardType.dinersclub), false);
        expect(CardUtility.isValidCvv('11', CardType.mastercard), false);
        expect(CardUtility.isValidCvv('11', CardType.maestro), false);
        expect(CardUtility.isValidCvv('11', CardType.fallback), false);
        expect(CardUtility.isValidCvv('a', CardType.fallback), false);
        expect(CardUtility.isValidCvv('*', CardType.fallback), false);
      });
    });
  });
}
