import 'dart:developer';

import 'package:checkout_com_frames/checkout_com_frames.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Localizations Sample App',
      localizationsDelegates: [
        CheckoutFramesLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''),
        Locale('fr', ''),
        Locale('ro', ''),
      ],
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CardFormView(
            onAddTapped: () async =>
                await Navigator.of(context).push(CupertinoPageRoute(
              builder: (context) => const BillingAddressPage(),
            )),
            onEditTapped: (billing) async => await Navigator.of(context).push(
              CupertinoPageRoute(
                builder: (context) => BillingAddressPage(
                  initialValue: billing,
                ),
              ),
            ),
            onPayTapped: (cardFormValue, billingFormValue) {
              log(cardFormValue.toString());
              log(billingFormValue.toString());
            },
          ),
        ),
      ),
    );
  }
}

class BillingAddressPage extends StatelessWidget {
  const BillingAddressPage({Key? key, this.initialValue}) : super(key: key);

  final BillingFormValue? initialValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BillingFormView(
            initialValue: initialValue,
            onClearTapped: () =>
                Navigator.of(context).pop(const BillingFormValue.empty()),
            onDoneTapped: (value) => Navigator.of(context).pop(value),
          ),
        ),
      ),
    );
  }
}
