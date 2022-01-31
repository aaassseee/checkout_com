import 'dart:convert';

class BillingAddress {
  BillingAddress(this.addressLine1, this.addressLine2, this.zip, this.country,
      this.city, this.state);

  BillingAddress.fromJson(Map<String, dynamic> json)
      : this(json['address_line1'], json['address_line2'], json['zip'],
            json['country'], json['city'], json['state']);

  final String addressLine1;

  final String addressLine2;

  final String zip;

  final String country;

  final String city;

  final String state;

  Map toJson() => {
        'address_line1': addressLine1,
        'address_line2': addressLine2,
        'zip': zip,
        'country': country,
        'city': city,
        'state': state,
      };

  String toJsonString() => json.encode(toJson());

  @override
  String toString() {
    return 'BillingAddress{addressLine1: $addressLine1, addressLine2: $addressLine2, zip: $zip, country: $country, city: $city, state: $state}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BillingAddress &&
          runtimeType == other.runtimeType &&
          addressLine1 == other.addressLine1 &&
          addressLine2 == other.addressLine2 &&
          zip == other.zip &&
          country == other.country &&
          city == other.city &&
          state == other.state;

  @override
  int get hashCode =>
      addressLine1.hashCode ^
      addressLine2.hashCode ^
      zip.hashCode ^
      country.hashCode ^
      city.hashCode ^
      state.hashCode;
}
