import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_country/flutter_country.dart';

import '../l10n/l10n.dart';
import '../model/billing.dart';

typedef OnDoneTapped = void Function(BillingFormValue value);

class BillingFormView extends StatefulWidget {
  const BillingFormView(
      {Key? key,
      this.initialValue,
      this.autovalidateMode,
      required this.onClearTapped,
      required this.onDoneTapped})
      : super(key: key);

  final BillingFormValue? initialValue;

  final AutovalidateMode? autovalidateMode;

  final VoidCallback onClearTapped;

  final OnDoneTapped onDoneTapped;

  @override
  State<BillingFormView> createState() => _BillingFormViewState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty<BillingFormValue>('initialValue', initialValue));
    properties.add(DiagnosticsProperty<AutovalidateMode>(
        'autovalidateMode', autovalidateMode));
    properties
        .add(DiagnosticsProperty<VoidCallback>('onClearTapped', onClearTapped));
    properties
        .add(DiagnosticsProperty<OnDoneTapped>('onDoneTapped', onDoneTapped));
  }
}

class _BillingFormViewState extends State<BillingFormView> {
  final nameFieldKey = GlobalKey<FormFieldState<String>>();

  final addressOneFieldKey = GlobalKey<FormFieldState<String>>();

  final addressTwoFieldKey = GlobalKey<FormFieldState<String>>();

  final cityFieldKey = GlobalKey<FormFieldState<String>>();

  final stateFieldKey = GlobalKey<FormFieldState<String>>();

  final postcodeFieldKey = GlobalKey<FormFieldState<String>>();

  final countryFieldKey = GlobalKey<FormFieldState<Country>>();

  final phoneFieldKey = GlobalKey<FormFieldState<String>>();

  Country? country;

  @override
  void initState() {
    super.initState();
    country = widget.initialValue?.country;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: widget.autovalidateMode,
      child: Column(
        children: [
          TextFormField(
            key: nameFieldKey,
            initialValue: widget.initialValue?.name,
            decoration: InputDecoration(
              label:
                  Text(CheckoutFramesLocalization.of(context).placeholderName),
            ),
            validator: (value) {
              if (value == null || value.length < 3) {
                return CheckoutFramesLocalization.of(context).errorName;
              }
              return null;
            },
          ),
          TextFormField(
            key: addressOneFieldKey,
            initialValue: widget.initialValue?.addressOne,
            decoration: InputDecoration(
              label: Text(
                  CheckoutFramesLocalization.of(context).placeholderAddressOne),
            ),
            validator: (value) {
              if (value == null || value.length < 3) {
                return CheckoutFramesLocalization.of(context).errorAddressOne;
              }
              return null;
            },
          ),
          TextFormField(
            key: addressTwoFieldKey,
            initialValue: widget.initialValue?.addressTwo,
            decoration: InputDecoration(
              label: Text(
                  CheckoutFramesLocalization.of(context).placeholderAddressTwo),
            ),
          ),
          TextFormField(
            key: cityFieldKey,
            initialValue: widget.initialValue?.city,
            decoration: InputDecoration(
              label:
                  Text(CheckoutFramesLocalization.of(context).placeholderCity),
            ),
            validator: (value) {
              if (value == null || value.length < 2) {
                return CheckoutFramesLocalization.of(context).errorCity;
              }
              return null;
            },
          ),
          TextFormField(
            key: stateFieldKey,
            initialValue: widget.initialValue?.state,
            decoration: InputDecoration(
              label:
                  Text(CheckoutFramesLocalization.of(context).placeholderState),
            ),
            validator: (value) {
              if (value == null || value.length < 3) {
                return CheckoutFramesLocalization.of(context).errorState;
              }
              return null;
            },
          ),
          TextFormField(
            key: postcodeFieldKey,
            initialValue: widget.initialValue?.postcode,
            decoration: InputDecoration(
              label: Text(
                  CheckoutFramesLocalization.of(context).placeholderPostcode),
            ),
            validator: (value) {
              if (value == null || value.length < 3) {
                return CheckoutFramesLocalization.of(context).errorPostcode;
              }
              return null;
            },
          ),
          DropdownButtonFormField<Country>(
            key: countryFieldKey,
            value: country,
            items: [
              for (final country in Countries.values)
                DropdownMenuItem(
                  child: Text(country
                      .getIsoShortNameByLocale(const Locale('zh', 'HK'))),
                  value: country,
                )
            ],
            decoration: InputDecoration(
              label: Text(
                  CheckoutFramesLocalization.of(context).placeholderCountry),
            ),
            onChanged: (value) {
              setState(() {
                country = value;
              });
            },
          ),
          TextFormField(
            key: phoneFieldKey,
            initialValue: widget.initialValue?.phone,
            decoration: InputDecoration(
              label:
                  Text(CheckoutFramesLocalization.of(context).placeholderPhone),
              prefixText: '+' + (country?.countryCode ?? ''),
            ),
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.length < 3) {
                return CheckoutFramesLocalization.of(context).errorPhone;
              }
              return null;
            },
          ),
          Builder(
            builder: (context) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: widget.onClearTapped,
                    child: Text(
                        CheckoutFramesLocalization.of(context).buttonClear),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (Form.of(context)?.validate() != true) {
                        return;
                      }

                      final name = nameFieldKey.currentState?.value;
                      final addressOne = addressOneFieldKey.currentState?.value;
                      final addressTwo = addressTwoFieldKey.currentState?.value;
                      final postcode = postcodeFieldKey.currentState?.value;
                      final country = countryFieldKey.currentState?.value;
                      final city = cityFieldKey.currentState?.value;
                      final state = stateFieldKey.currentState?.value;
                      final phone = phoneFieldKey.currentState?.value;

                      if (name == null ||
                          addressOne == null ||
                          addressTwo == null ||
                          postcode == null ||
                          country == null ||
                          city == null ||
                          state == null ||
                          phone == null) {
                        return;
                      }

                      widget.onDoneTapped(BillingFormValue(
                          name: name,
                          addressOne: addressOne,
                          addressTwo: addressTwo,
                          city: city,
                          state: state,
                          postcode: postcode,
                          country: country,
                          phone: phone));
                    },
                    child:
                        Text(CheckoutFramesLocalization.of(context).buttonDone),
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
