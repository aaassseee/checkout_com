class CardType {
  const CardType._(
    this.name,
    this.imagePath,
    this.pattern,
    this.regex,
    this.cardLengthList,
    this.maxCardLength,
    this.maxCvvLength,
    this.gapPositionList,
    this.luhn,
  );

  final String name;

  final String? imagePath;

  final String pattern;

  final String regex;

  final List<int> cardLengthList;

  final int maxCardLength;

  final int maxCvvLength;

  final List<int> gapPositionList;

  final bool luhn;

  static const visa = CardType._(
    'visa',
    'asset/visa.png',
    r'^4\d*$',
    r'^4[0-9]{12}(?:[0-9]{3})?$',
    [13, 16],
    19,
    3,
    [4, 9, 14],
    true,
  );

  static const amex = CardType._(
    'amex',
    'asset/amex.png',
    r'^3[47]\d*$',
    r'/(\d{1,4})(\d{1,6})?(\d{1,5})?/',
    [15],
    18,
    4,
    [4, 11],
    true,
  );

  static const discover = CardType._(
    'discover',
    'asset/discover.png',
    r'^(6011|65|64[4-9])\d*$',
    r'^6(?:011|5[0-9]{2})[0-9]{12}$',
    [16],
    23,
    3,
    [4, 9, 14],
    true,
  );

  static const unionpay = CardType._(
    'unionpay',
    'asset/unionpay.png',
    r'^(((620|(621(?!83|88|98|99))|622(?!06|018)|62[3-6]|627[02,06,07]|628(?!0|1)|629[1,2]))\d*|622018\d{12})$',
    r'^6(?:011|5[0-9]{2})[0-9]{12}$',
    [16, 17, 18, 19],
    23,
    3,
    [4, 11, 26],
    false,
  );

  static const jcb = CardType._(
    'jcb',
    'asset/jcb.png',
    r'^(2131|1800|35)\d*$',
    r'^(?:2131|1800|35[0-9]{3})[0-9]{11}$',
    [16],
    23,
    3,
    [4, 9, 14],
    true,
  );

  static const dinersclub = CardType._(
    'dinersclub',
    'asset/dinersclub.png',
    r'^3(0[0-5]|[689])\d*$',
    r'^3(?:0[0-5]|[68][0-9])?[0-9]{11}$',
    [14],
    23,
    3,
    [4, 11],
    true,
  );

  static const mastercard = CardType._(
    'mastercard',
    'asset/mastercard.png',
    r'^(5[1-5]|222[1-9]|22[3-9]|2[3-6]|27[0-1]|2720)\d*$',
    r'^5[1-5][0-9]{14}$',
    [16, 17],
    19,
    3,
    [4, 9, 14],
    true,
  );

  static const maestro = CardType._(
    'maestro',
    'asset/maestro.png',
    r'^(?:5[06789]\d\d|(?!6011[0234])(?!60117[4789])(?!60118[6789])(?!60119)(?!64[456789])(?!65)6\d{3})\d{8,15}$',
    r'^(5[06-9]|6[37])[0-9]{10,17}$',
    [12, 13, 14, 15, 16, 17, 18, 19],
    23,
    3,
    [4, 9, 14],
    true,
  );

  static const fallback = CardType._(
    'fallback',
    null,
    '',
    '',
    [16],
    19,
    3,
    [4, 9, 14],
    false,
  );

  static Set<CardType> get values => {
        visa,
        amex,
        discover,
        unionpay,
        jcb,
        dinersclub,
        mastercard,
        maestro,
        fallback,
      };

  @override
  String toString() {
    return 'CardType{name: $name, imagePath: $imagePath, pattern: $pattern, regex: $regex, cardLengthList: $cardLengthList, maxCardLength: $maxCardLength, maxCvvLength: $maxCvvLength, gapPositionList: $gapPositionList, luhn: $luhn}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CardType &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          imagePath == other.imagePath &&
          pattern == other.pattern &&
          regex == other.regex &&
          cardLengthList == other.cardLengthList &&
          maxCardLength == other.maxCardLength &&
          maxCvvLength == other.maxCvvLength &&
          gapPositionList == other.gapPositionList &&
          luhn == other.luhn;

  @override
  int get hashCode =>
      name.hashCode ^
      imagePath.hashCode ^
      pattern.hashCode ^
      regex.hashCode ^
      cardLengthList.hashCode ^
      maxCardLength.hashCode ^
      maxCvvLength.hashCode ^
      gapPositionList.hashCode ^
      luhn.hashCode;
}
