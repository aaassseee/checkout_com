import 'package:country/country.dart';

class BillingFormValue {
  const BillingFormValue(
      {this.name,
      this.addressOne,
      this.addressTwo,
      this.city,
      this.state,
      this.postcode,
      this.country,
      this.phone});

  const BillingFormValue.empty() : this();

  final String? name;

  final String? addressOne;

  final String? addressTwo;

  final String? city;

  final String? state;

  final String? postcode;

  final Country? country;

  final String? phone;

  bool get isEmpty =>
      name == null &&
      addressOne == null &&
      addressTwo == null &&
      city == null &&
      state == null &&
      postcode == null &&
      country == null &&
      phone == null;

  String get formattedAddress =>
      [addressOne, addressTwo, postcode, state].whereType<String>().join(', ');

  @override
  String toString() {
    return 'BillingFormValue{name: $name, addressOne: $addressOne, addressTwo: $addressTwo, city: $city, state: $state, postcode: $postcode, country: $country, phone: $phone}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BillingFormValue &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          addressOne == other.addressOne &&
          addressTwo == other.addressTwo &&
          city == other.city &&
          state == other.state &&
          postcode == other.postcode &&
          country == other.country &&
          phone == other.phone;

  @override
  int get hashCode =>
      name.hashCode ^
      addressOne.hashCode ^
      addressTwo.hashCode ^
      city.hashCode ^
      state.hashCode ^
      postcode.hashCode ^
      country.hashCode ^
      phone.hashCode;
}
