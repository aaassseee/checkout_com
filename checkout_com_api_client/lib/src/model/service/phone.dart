import 'dart:convert';

class Phone {
  const Phone(this.countryCode, this.number);

  Phone.fromJson(Map<String, dynamic> json)
      : this(json['country_code'], json['number']);

  final String countryCode;

  final String number;

  Map toJson() => {
        'country_code': countryCode,
        'number': number,
      };

  String toJsonString() => json.encode(toJson());

  @override
  String toString() {
    return 'Phone{countryCode: $countryCode, number: $number}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Phone &&
          runtimeType == other.runtimeType &&
          countryCode == other.countryCode &&
          number == other.number;

  @override
  int get hashCode => countryCode.hashCode ^ number.hashCode;
}
