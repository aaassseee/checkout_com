// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "billingDetailsAdd": MessageLookupByLibrary.simpleMessage(" + ADD"),
        "billingDetailsEdit": MessageLookupByLibrary.simpleMessage("Edit"),
        "buttonClear": MessageLookupByLibrary.simpleMessage("Clear"),
        "buttonDone": MessageLookupByLibrary.simpleMessage("Done"),
        "buttonPay": MessageLookupByLibrary.simpleMessage("Pay"),
        "errorAddressOne": MessageLookupByLibrary.simpleMessage(
            "Value must be longer then 3 characters"),
        "errorCardNumber":
            MessageLookupByLibrary.simpleMessage("The card number is invalid"),
        "errorCity": MessageLookupByLibrary.simpleMessage(
            "Value must be longer then 2 characters"),
        "errorCountry": MessageLookupByLibrary.simpleMessage(
            "Please select a country/region"),
        "errorCvv": MessageLookupByLibrary.simpleMessage("Enter a valid Cvv"),
        "errorExpirationDate":
            MessageLookupByLibrary.simpleMessage("Enter a valid date"),
        "errorName": MessageLookupByLibrary.simpleMessage(
            "Value must be longer then 3 characters"),
        "errorPhone": MessageLookupByLibrary.simpleMessage(
            "Value must be longer then 3 characters"),
        "errorPostcode": MessageLookupByLibrary.simpleMessage(
            "Value must be longer then 3 characters"),
        "errorState": MessageLookupByLibrary.simpleMessage(
            "Value must be longer then 3 characters"),
        "labelAcceptedCards":
            MessageLookupByLibrary.simpleMessage("Accepted Cards"),
        "labelBillingDetails":
            MessageLookupByLibrary.simpleMessage("Billing Details"),
        "labelExpirationDate":
            MessageLookupByLibrary.simpleMessage("Expiration date*"),
        "placeholderAddressOne":
            MessageLookupByLibrary.simpleMessage("Address line 1*"),
        "placeholderAddressTwo":
            MessageLookupByLibrary.simpleMessage("Address line 2"),
        "placeholderCardNumber":
            MessageLookupByLibrary.simpleMessage("Card number*"),
        "placeholderCity": MessageLookupByLibrary.simpleMessage("Postal Town*"),
        "placeholderCountry":
            MessageLookupByLibrary.simpleMessage(" SELECT COUNTRY/REGION"),
        "placeholderCvv": MessageLookupByLibrary.simpleMessage("Cvv*"),
        "placeholderName":
            MessageLookupByLibrary.simpleMessage("Cardholder\'s name*"),
        "placeholderPhone": MessageLookupByLibrary.simpleMessage("Phone*"),
        "placeholderPostcode":
            MessageLookupByLibrary.simpleMessage("Postcode*"),
        "placeholderState": MessageLookupByLibrary.simpleMessage("State"),
        "selectBillingDetails": MessageLookupByLibrary.simpleMessage("SELECT"),
        "titleBillingDetails":
            MessageLookupByLibrary.simpleMessage("Billing Details"),
        "titleCardDetails": MessageLookupByLibrary.simpleMessage("Card Details")
      };
}
