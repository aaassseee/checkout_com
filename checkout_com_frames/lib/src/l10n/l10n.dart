// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class CheckoutFramesLocalization {
  CheckoutFramesLocalization();

  static CheckoutFramesLocalization? _current;

  static CheckoutFramesLocalization get current {
    assert(_current != null,
        'No instance of CheckoutFramesLocalization was loaded. Try to initialize the CheckoutFramesLocalization delegate before accessing CheckoutFramesLocalization.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<CheckoutFramesLocalization> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = CheckoutFramesLocalization();
      CheckoutFramesLocalization._current = instance;

      return instance;
    });
  }

  static CheckoutFramesLocalization of(BuildContext context) {
    final instance = CheckoutFramesLocalization.maybeOf(context);
    assert(instance != null,
        'No instance of CheckoutFramesLocalization present in the widget tree. Did you add CheckoutFramesLocalization.delegate in localizationsDelegates?');
    return instance!;
  }

  static CheckoutFramesLocalization? maybeOf(BuildContext context) {
    return Localizations.of<CheckoutFramesLocalization>(
        context, CheckoutFramesLocalization);
  }

  /// `Card Details`
  String get titleCardDetails {
    return Intl.message(
      'Card Details',
      name: 'titleCardDetails',
      desc: '',
      args: [],
    );
  }

  /// `Accepted Cards`
  String get labelAcceptedCards {
    return Intl.message(
      'Accepted Cards',
      name: 'labelAcceptedCards',
      desc: '',
      args: [],
    );
  }

  /// `Card number*`
  String get placeholderCardNumber {
    return Intl.message(
      'Card number*',
      name: 'placeholderCardNumber',
      desc: '',
      args: [],
    );
  }

  /// `The card number is invalid`
  String get errorCardNumber {
    return Intl.message(
      'The card number is invalid',
      name: 'errorCardNumber',
      desc: '',
      args: [],
    );
  }

  /// `Expiration date*`
  String get labelExpirationDate {
    return Intl.message(
      'Expiration date*',
      name: 'labelExpirationDate',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid date`
  String get errorExpirationDate {
    return Intl.message(
      'Enter a valid date',
      name: 'errorExpirationDate',
      desc: '',
      args: [],
    );
  }

  /// `Cvv*`
  String get placeholderCvv {
    return Intl.message(
      'Cvv*',
      name: 'placeholderCvv',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid Cvv`
  String get errorCvv {
    return Intl.message(
      'Enter a valid Cvv',
      name: 'errorCvv',
      desc: '',
      args: [],
    );
  }

  /// `Billing Details`
  String get labelBillingDetails {
    return Intl.message(
      'Billing Details',
      name: 'labelBillingDetails',
      desc: '',
      args: [],
    );
  }

  /// `SELECT`
  String get selectBillingDetails {
    return Intl.message(
      'SELECT',
      name: 'selectBillingDetails',
      desc: '',
      args: [],
    );
  }

  /// ` + ADD`
  String get billingDetailsAdd {
    return Intl.message(
      ' + ADD',
      name: 'billingDetailsAdd',
      desc: '',
      args: [],
    );
  }

  /// `Pay`
  String get buttonPay {
    return Intl.message(
      'Pay',
      name: 'buttonPay',
      desc: '',
      args: [],
    );
  }

  /// `Billing Details`
  String get titleBillingDetails {
    return Intl.message(
      'Billing Details',
      name: 'titleBillingDetails',
      desc: '',
      args: [],
    );
  }

  /// `Cardholder's name*`
  String get placeholderName {
    return Intl.message(
      'Cardholder\'s name*',
      name: 'placeholderName',
      desc: '',
      args: [],
    );
  }

  /// `Value must be longer then 3 characters`
  String get errorName {
    return Intl.message(
      'Value must be longer then 3 characters',
      name: 'errorName',
      desc: '',
      args: [],
    );
  }

  /// ` SELECT COUNTRY/REGION`
  String get placeholderCountry {
    return Intl.message(
      ' SELECT COUNTRY/REGION',
      name: 'placeholderCountry',
      desc: '',
      args: [],
    );
  }

  /// `Please select a country/region`
  String get errorCountry {
    return Intl.message(
      'Please select a country/region',
      name: 'errorCountry',
      desc: '',
      args: [],
    );
  }

  /// `Address line 1*`
  String get placeholderAddressOne {
    return Intl.message(
      'Address line 1*',
      name: 'placeholderAddressOne',
      desc: '',
      args: [],
    );
  }

  /// `Value must be longer then 3 characters`
  String get errorAddressOne {
    return Intl.message(
      'Value must be longer then 3 characters',
      name: 'errorAddressOne',
      desc: '',
      args: [],
    );
  }

  /// `Address line 2`
  String get placeholderAddressTwo {
    return Intl.message(
      'Address line 2',
      name: 'placeholderAddressTwo',
      desc: '',
      args: [],
    );
  }

  /// `Postal Town*`
  String get placeholderCity {
    return Intl.message(
      'Postal Town*',
      name: 'placeholderCity',
      desc: '',
      args: [],
    );
  }

  /// `Value must be longer then 2 characters`
  String get errorCity {
    return Intl.message(
      'Value must be longer then 2 characters',
      name: 'errorCity',
      desc: '',
      args: [],
    );
  }

  /// `State`
  String get placeholderState {
    return Intl.message(
      'State',
      name: 'placeholderState',
      desc: '',
      args: [],
    );
  }

  /// `Value must be longer then 3 characters`
  String get errorState {
    return Intl.message(
      'Value must be longer then 3 characters',
      name: 'errorState',
      desc: '',
      args: [],
    );
  }

  /// `Postcode*`
  String get placeholderPostcode {
    return Intl.message(
      'Postcode*',
      name: 'placeholderPostcode',
      desc: '',
      args: [],
    );
  }

  /// `Value must be longer then 3 characters`
  String get errorPostcode {
    return Intl.message(
      'Value must be longer then 3 characters',
      name: 'errorPostcode',
      desc: '',
      args: [],
    );
  }

  /// `Phone*`
  String get placeholderPhone {
    return Intl.message(
      'Phone*',
      name: 'placeholderPhone',
      desc: '',
      args: [],
    );
  }

  /// `Value must be longer then 3 characters`
  String get errorPhone {
    return Intl.message(
      'Value must be longer then 3 characters',
      name: 'errorPhone',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get buttonClear {
    return Intl.message(
      'Clear',
      name: 'buttonClear',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get buttonDone {
    return Intl.message(
      'Done',
      name: 'buttonDone',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get billingDetailsEdit {
    return Intl.message(
      'Edit',
      name: 'billingDetailsEdit',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate
    extends LocalizationsDelegate<CheckoutFramesLocalization> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'ro'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<CheckoutFramesLocalization> load(Locale locale) =>
      CheckoutFramesLocalization.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
