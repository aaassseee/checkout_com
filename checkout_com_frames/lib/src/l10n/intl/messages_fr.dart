// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "billingDetailsAdd": MessageLookupByLibrary.simpleMessage(" + AJOUTER"),
        "billingDetailsEdit": MessageLookupByLibrary.simpleMessage("Modifier"),
        "buttonClear": MessageLookupByLibrary.simpleMessage("Effacer"),
        "buttonDone": MessageLookupByLibrary.simpleMessage("Confirmer"),
        "buttonPay": MessageLookupByLibrary.simpleMessage("Payer"),
        "errorAddressOne": MessageLookupByLibrary.simpleMessage(
            "La valeur doit être plus longue que 3 caractères"),
        "errorCardNumber": MessageLookupByLibrary.simpleMessage(
            "Le numéro de la carte n\'est pas valide"),
        "errorCity": MessageLookupByLibrary.simpleMessage(
            "La valeur doit être plus longue que 2 caractères"),
        "errorCountry": MessageLookupByLibrary.simpleMessage(
            "Veuillez sélectionner un pays / une région"),
        "errorCvv":
            MessageLookupByLibrary.simpleMessage("Entrez un Cvv valide"),
        "errorExpirationDate":
            MessageLookupByLibrary.simpleMessage("Entrez une date valide"),
        "errorName": MessageLookupByLibrary.simpleMessage(
            "La valeur doit être plus longue que 3 caractères"),
        "errorPhone": MessageLookupByLibrary.simpleMessage(
            "La valeur doit être plus longue que 3 caractères"),
        "errorPostcode": MessageLookupByLibrary.simpleMessage(
            "La valeur doit être plus longue que 3 caractères"),
        "errorState": MessageLookupByLibrary.simpleMessage(
            "La valeur doit être plus longue que 3 caractères"),
        "labelBillingDetails":
            MessageLookupByLibrary.simpleMessage("Détails de facturation"),
        "labelExpirationDate":
            MessageLookupByLibrary.simpleMessage("Date d\'expiration *"),
        "placeholderAddressOne":
            MessageLookupByLibrary.simpleMessage("Ligne d\'adresse 1 *"),
        "placeholderAddressTwo":
            MessageLookupByLibrary.simpleMessage("Ligne d\'adresse 2"),
        "placeholderCardNumber":
            MessageLookupByLibrary.simpleMessage("Numéro de carte *"),
        "placeholderCity":
            MessageLookupByLibrary.simpleMessage("Code postal *"),
        "placeholderCountry":
            MessageLookupByLibrary.simpleMessage(" CHOISIR PAYS / RÉGION"),
        "placeholderCvv": MessageLookupByLibrary.simpleMessage("Cvv *"),
        "placeholderName": MessageLookupByLibrary.simpleMessage(
            "Nom du titulaire de la carte *"),
        "placeholderPhone": MessageLookupByLibrary.simpleMessage("Téléphone *"),
        "placeholderPostcode":
            MessageLookupByLibrary.simpleMessage("Code postal *"),
        "placeholderState": MessageLookupByLibrary.simpleMessage("État"),
        "selectBillingDetails":
            MessageLookupByLibrary.simpleMessage("SÉLECTIONNER"),
        "titleBillingDetails":
            MessageLookupByLibrary.simpleMessage("Détails de facturation")
      };
}
