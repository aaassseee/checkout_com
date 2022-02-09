import 'dart:convert';

class BillingAddress {
  BillingAddress(this.addressOne, this.addressTwo, this.zip, this.country,
      this.city, this.state);

  BillingAddress.fromJson(Map<String, dynamic> json)
      : this(json['address_line1'], json['address_line2'], json['zip'],
            json['country'], json['city'], json['state']);

  final String addressOne;

  final String? addressTwo;

  final String zip;

  final String country;

  final String city;

  final String? state;

  Map toJson() => {
        'address_line1': addressOne,
        'address_line2': addressTwo,
        'zip': zip,
        'country': country,
        'city': city,
        'state': state,
      };

  String toJsonString() => json.encode(toJson());

  @override
  String toString() {
    return 'BillingAddress{addressOne: $addressOne, addressTwo: $addressTwo, zip: $zip, country: $country, city: $city, state: $state}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BillingAddress &&
          runtimeType == other.runtimeType &&
          addressOne == other.addressOne &&
          addressTwo == other.addressTwo &&
          zip == other.zip &&
          country == other.country &&
          city == other.city &&
          state == other.state;

  @override
  int get hashCode =>
      addressOne.hashCode ^
      addressTwo.hashCode ^
      zip.hashCode ^
      country.hashCode ^
      city.hashCode ^
      state.hashCode;
}
