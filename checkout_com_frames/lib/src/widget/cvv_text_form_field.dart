import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../l10n/l10n.dart';
import '../utility.dart';

class CvvTextFormField extends StatefulWidget {
  const CvvTextFormField(
      {Key? key, required this.fieldKey, required this.cardNumberFieldKey})
      : super(key: key);

  final GlobalKey<FormFieldState<String>> fieldKey;
  final GlobalKey<FormFieldState<String>> cardNumberFieldKey;

  @override
  _CvvTextFormFieldState createState() => _CvvTextFormFieldState();
}

class _CvvTextFormFieldState extends State<CvvTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      decoration: InputDecoration(
        label: Text(CheckoutFramesLocalization.of(context).placeholderCvv),
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        final cardNumber = widget.cardNumberFieldKey.currentState?.value;
        if (value == null ||
            cardNumber == null ||
            !CardUtility.isValidCvv(
                value, CardUtility.getCardType(cardNumber))) {
          return CheckoutFramesLocalization.of(context).errorCvv;
        }

        return null;
      },
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'\d')),
        LengthLimitingTextInputFormatter(4),
      ],
    );
  }
}
