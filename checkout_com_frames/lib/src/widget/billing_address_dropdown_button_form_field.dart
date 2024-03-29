import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../l10n/l10n.dart';
import '../model/billing_address_form.dart';

typedef OnAddTapped = FutureOr<BillingFormValue?> Function();

typedef OnEditTapped = FutureOr<BillingFormValue?> Function(
    BillingFormValue value);

class BillingAddressDropdownButtonFormField extends StatefulWidget {
  const BillingAddressDropdownButtonFormField(
      {Key? key, required this.onAddTapped, required this.onEditTapped})
      : super(key: key);

  final OnAddTapped onAddTapped;

  final OnEditTapped onEditTapped;

  @override
  BillingAddressDropdownButtonFormFieldState createState() =>
      BillingAddressDropdownButtonFormFieldState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<OnAddTapped>('onAddTapped', onAddTapped));
    properties
        .add(DiagnosticsProperty<OnEditTapped>('onEditTapped', onEditTapped));
  }
}

class BillingAddressDropdownButtonFormFieldState
    extends State<BillingAddressDropdownButtonFormField> {
  BillingFormValue billing = const BillingFormValue.empty();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      itemBuilder: (context) => [
        if (billing.isEmpty) ...[
          PopupMenuItem(
            child: Text(
                CheckoutFramesLocalization.of(context).selectBillingDetails),
          ),
          PopupMenuItem(
            value: 'add',
            child:
                Text(CheckoutFramesLocalization.of(context).billingDetailsAdd),
          ),
        ] else ...[
          PopupMenuItem(
            child: Text(billing.formattedAddress),
          ),
          PopupMenuItem(
            value: 'edit',
            child:
                Text(CheckoutFramesLocalization.of(context).billingDetailsEdit),
          ),
        ],
      ],
      onSelected: (value) async {
        switch (value) {
          case 'add':
            final billing = await widget.onAddTapped();
            if (billing == null) {
              return;
            }

            setState(() {
              this.billing = billing;
            });
            break;

          case 'edit':
            final billing = await widget.onEditTapped(this.billing);
            if (billing == null) {
              return;
            }

            setState(() {
              this.billing = billing;
            });
            break;
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(
          label:
              Text(CheckoutFramesLocalization.of(context).labelBillingDetails),
          suffixIcon: const Icon(Icons.arrow_drop_down),
        ),
        child: Text(
          billing.isEmpty
              ? CheckoutFramesLocalization.of(context).selectBillingDetails
              : billing.formattedAddress,
        ),
      ),
    );
  }
}
