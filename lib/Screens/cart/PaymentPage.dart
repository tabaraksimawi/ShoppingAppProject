import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Providers/providers.dart';
import '../Core/core.dart';
import '../Home/HomeScreen.dart';

class PaymentPage extends StatelessWidget {
  static String routeName = "/payment";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment",
          style: DefaultElements.headingStyle,
        ),
      ),
      body: PaymentPageBody(),
    );
  }
}

class PaymentPageBody extends StatefulWidget {
  @override
  _PaymentPageBodyState createState() => _PaymentPageBodyState();
}

class _PaymentPageBodyState extends State<PaymentPageBody> {
  final _formKey = GlobalKey<FormState>();
  bool isSaveDetails = true;
  double total = 0;
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  CartProvider _cartProvider;
  ProductsProvider _productsProvider;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _cartProvider = Provider.of<CartProvider>(context);
    _productsProvider = Provider.of<ProductsProvider>(context, listen: false);

    _cartProvider.cartItems.forEach((c) {
      total = total + (c.product.price * c.quantity);
    });
    super.didChangeDependencies();
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: _cartProvider.controllerState == ControllerState.loading,
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            CreditCardWidget(
              cardBgColor: DefaultElements.kPrimaryColor,
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: CreditCardForm(
                  formKey: _formKey,
                  onCreditCardModelChange: onCreditCardModelChange,
                  obscureCvv: true,
                  obscureNumber: true,
                  cardNumberDecoration: const InputDecoration(
                    labelText: 'Number',
                    hintText: 'XXXX XXXX XXXX XXXX',
                  ),
                  expiryDateDecoration: const InputDecoration(
                    labelText: 'Expired Date',
                    hintText: 'XX/XX',
                  ),
                  cvvCodeDecoration: const InputDecoration(
                    labelText: 'CVV',
                    hintText: 'XXX',
                  ),
                  cardHolderDecoration: const InputDecoration(
                    labelText: 'Card Holder Name',
                  ),
                  cardHolderName: cardHolderName,
                  cardNumber: cardNumber,
                  cvvCode: cvvCode,
                  expiryDate: expiryDate,
                  themeColor: DefaultElements.kPrimaryColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Total: $total',
                style: GoogleFonts.lato(fontSize: 20),
              ),
            ),
            DefaultButton(
              text: 'Pay Now',
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  try {
                    for (var i in _cartProvider.cartItems) {
                      _productsProvider.updateProduct(i.product
                          .copyWith(quantity: i.product.quantity - i.quantity));
                    }
                    await _cartProvider.clearCart();
                    Navigator.of(context).pushNamed(OrderCompletion.routeName);
                  } catch (e) {
                    print(e);
                    showErrorMessage(e.toString());
                  }
                } else {}
              },
            )
          ],
        ),
      ),
    );
  }
}

class OrderCompletion extends StatelessWidget {
  static String routeName = "/orderCompletion";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Order Has Been Successfully Placed!',
              style: GoogleFonts.lato(fontSize: 28),
              textAlign: TextAlign.center,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Center(
                child: Image.asset(
                  "assets/images/splash_2.png",
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: DefaultButton(
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil(
                HomeScreen.routeName, (route) => false);
          },
          text: 'Continue Shopping',
        ),
      ),
    );
  }
}
