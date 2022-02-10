import 'dart:convert';
import 'dart:developer';

import 'package:checkout_com_frames/checkout_com_frames.dart' hide Card;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pay/pay.dart';

const sandboxApiKey = 'pk_test_6e40a700-d563-43cd-89d0-f9bb17d35e73';
final apiClient =
    CheckoutComApiClient(sandboxApiKey, environment: Environment.sandbox);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Localizations Sample App',
      localizationsDelegates: const [
        CheckoutFramesLocalization.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('fr', ''),
        Locale('ro', ''),
      ],
      home: const HomePage(),
      onGenerateRoute: (settings) {
        late final Widget page;
        switch (settings.name) {
          case HomePage.routeName:
            page = const HomePage();
            break;

          case CardFormPage.routeName:
            page = const CardFormPage();
            break;

          case BillingAddressFormPage.routeName:
            final BillingFormValue? initialValue =
                settings.arguments as BillingFormValue?;
            page = BillingAddressFormPage(initialValue: initialValue);
            break;

          case GooglePayPage.routeName:
            page = const GooglePayPage();
            break;

          case ApplePayPage.routeName:
            page = const ApplePayPage();
            break;

          default:
            throw UnimplementedError('page name not found');
        }

        return MaterialPageRoute(
          builder: (context) => page,
          settings: settings,
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  static const routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout.com Frames example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(CardFormPage.routeName),
              child: const Text('Card tokenization'),
            ),
            if (defaultTargetPlatform == TargetPlatform.android)
              ElevatedButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(GooglePayPage.routeName),
                child: const Text('Google pay'),
              ),
            if (defaultTargetPlatform == TargetPlatform.iOS)
              ElevatedButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed(ApplePayPage.routeName),
                child: const Text('Apple pay'),
              ),
          ],
        ),
      ),
    );
  }
}

class CardFormPage extends StatelessWidget {
  static const routeName = '/cardForm';

  const CardFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Card form')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CardFormView(
            onAddTapped: () async => await Navigator.of(context)
                    .pushNamed(BillingAddressFormPage.routeName)
                as BillingFormValue?,
            onEditTapped: (billing) async => await Navigator.of(context)
                .pushNamed(BillingAddressFormPage.routeName,
                    arguments: billing) as BillingFormValue?,
            onPayTapped: (cardFormValue, billingFormValue) async {
              try {
                final tokenizationResult = await apiClient.generateCardToken(
                    CardTokenizationRequest(cardFormValue.getCard(),
                        name: billingFormValue?.name,
                        billing: billingFormValue?.getBillingAddress(),
                        phone: billingFormValue?.getPhone()));
                print(tokenizationResult);
              } catch (e) {
                print(e);
              }
            },
          ),
        ),
      ),
    );
  }
}

class BillingAddressFormPage extends StatelessWidget {
  static const routeName = '/billingAddressForm';

  const BillingAddressFormPage({Key? key, this.initialValue}) : super(key: key);

  final BillingFormValue? initialValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Billing address form'),
      ),
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

class GooglePayPage extends StatelessWidget {
  static const routeName = '/googlePay';

  const GooglePayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google pay'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GooglePayButton(
            paymentConfigurationAsset: 'google_pay.json',
            paymentItems: const [
              PaymentItem(
                amount: '1',
                status: PaymentItemStatus.final_price,
              ),
            ],
            onPaymentResult: (Map<String, dynamic> result) async {
              log(json.encode(result));

              final token = result['paymentMethodData']?['tokenizationData']
                  ?['token'] as String?;
              if (token == null) {
                return;
              }

              final request = GooglePayTokenizationRequest(token);
              print(request);
              // apiClient.generateGooglePayToken(GooglePayTokenizationRequest(result.))
            },
          ),
        ],
      ),
    );
  }
}

class ApplePayPage extends StatelessWidget {
  static const routeName = '/applePay';

  const ApplePayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apple pay'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ApplePayButton(
            paymentConfigurationAsset: 'apple_pay.json',
            paymentItems: const [
              PaymentItem(
                amount: '1',
                label: 'nullable?',
                status: PaymentItemStatus.final_price,
              ),
            ],
            onPaymentResult: (Map<String, dynamic> result) async {
              log(json.encode(result));

              final token = result['token'] as String?;
              if (token == null) {
                return;
              }

              final request = ApplePayTokenizationRequest(token);
              print(request);
              // apiClient.generateGooglePayToken(GooglePayTokenizationRequest(result.))
            },
          ),
        ],
      ),
    );
  }
}
