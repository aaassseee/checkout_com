import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../l10n/l10n.dart';
import '../model/billing_address_form.dart';
import '../model/card_form.dart';
import '../widget/widget.dart';

typedef OnPayTapped = Function(
    CardFormValue cardFormValue, BillingFormValue? billingFormValue);

class CardFormView extends StatefulWidget {
  const CardFormView({
    Key? key,
    this.initialValue,
    this.autovalidateMode,
    required this.onAddTapped,
    required this.onEditTapped,
    required this.onPayTapped,
  }) : super(key: key);

  final CardFormValue? initialValue;

  final AutovalidateMode? autovalidateMode;

  final OnAddTapped onAddTapped;

  final OnEditTapped onEditTapped;

  final OnPayTapped onPayTapped;

  @override
  State<CardFormView> createState() => _CardFormViewState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<CardFormValue>('initialValue', initialValue));
    properties.add(DiagnosticsProperty<AutovalidateMode>(
        'autovalidateMode', autovalidateMode));
  }
}

class _CardFormViewState extends State<CardFormView> {
  final cardNumberFieldStateKey = GlobalKey<FormFieldState<String>>();

  final monthFieldStateKey = GlobalKey<FormFieldState<int>>();

  final yearFieldStateKey = GlobalKey<FormFieldState<int>>();

  final cvvFieldStateKey = GlobalKey<FormFieldState<String>>();

  final billingAddressFieldStateKey =
      GlobalKey<BillingAddressDropdownButtonFormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: widget.autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CardNumberTextFormField(
            fieldKey: cardNumberFieldStateKey,
          ),
          ExpirationDateDropdownButtonFormField(
            monthFieldKey: monthFieldStateKey,
            yearFieldKey: yearFieldStateKey,
          ),
          CvvTextFormField(
            fieldKey: cvvFieldStateKey,
            cardNumberFieldKey: cardNumberFieldStateKey,
          ),
          BillingAddressDropdownButtonFormField(
            key: billingAddressFieldStateKey,
            onAddTapped: widget.onAddTapped,
            onEditTapped: widget.onEditTapped,
          ),
          Builder(
            builder: (context) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (!(Form.of(context)?.validate() ?? false)) {
                        return;
                      }

                      widget.onPayTapped(
                          CardFormValue(
                              number:
                                  cardNumberFieldStateKey.currentState?.value,
                              expirationMonth:
                                  monthFieldStateKey.currentState?.value,
                              expirationYear:
                                  yearFieldStateKey.currentState?.value,
                              cvv: cvvFieldStateKey.currentState?.value),
                          billingAddressFieldStateKey.currentState?.billing);
                    },
                    child:
                        Text(CheckoutFramesLocalization.of(context).buttonPay),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
