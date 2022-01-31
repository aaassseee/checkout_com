import 'package:checkout_com_frames/src/extension.dart';
import 'package:checkout_com_frames/src/utility.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../l10n/l10n.dart';
import '../model/card_type.dart';

class CardNumberTextFormField extends StatefulWidget {
  const CardNumberTextFormField({Key? key, required this.fieldKey})
      : super(key: key);

  final GlobalKey<FormFieldState<String>> fieldKey;

  @override
  State<CardNumberTextFormField> createState() =>
      CardNumberTextFormFieldState();
}

class CardNumberTextFormFieldState extends State<CardNumberTextFormField> {
  late final TextEditingController _textEditingController;

  String? number;
  CardType? type;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _textEditingController.addListener(() {
      number = _textEditingController.text;
      setState(() {
        type = CardUtility.getCardType(_textEditingController.text);
      });
    });
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      controller: _textEditingController,
      decoration: InputDecoration(
        label:
            Text(CheckoutFramesLocalization.of(context).placeholderCardNumber),
        suffixIcon: type == null || type!.imagePath == null
            ? null
            : Image.asset(
                type!.imagePath!,
                package: 'checkout_com_frames',
                fit: BoxFit.contain,
              ),
        suffixIconConstraints: const BoxConstraints.tightFor(height: 20),
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || !CardUtility.isValidCard(value)) {
          return CheckoutFramesLocalization.of(context).errorCardNumber;
        }

        return null;
      },
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'\d')),
        if (type != null)
          LengthLimitingTextInputFormatter(
              type!.maxCardLength - type!.gapPositionList.length),
        CardNumberInputFormatter(),
      ],
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final selection = newValue.selection;
    final selectionFormattedCardNumber =
        CardUtility.getFormattedCardNumber(selection.textBefore(newValue.text));
    final spaceCount = selectionFormattedCardNumber.length -
        selectionFormattedCardNumber.removeAllSpace.length;
    TextSelection newSelection = selection;
    if (spaceCount > 0) {
      newSelection = selection.copyWith(
          baseOffset: selection.baseOffset + spaceCount,
          extentOffset: selection.extentOffset + spaceCount);
    }
    return newValue.copyWith(
        text: CardUtility.getFormattedCardNumber(newValue.text),
        selection: newSelection);
  }
}
