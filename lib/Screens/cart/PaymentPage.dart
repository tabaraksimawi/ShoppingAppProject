import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myshopping_app/Component/Constatns.dart';
import 'package:myshopping_app/Component/DefaultButton.dart';
import 'package:myshopping_app/Component/DefaultElements.dart';
import 'package:myshopping_app/Models/Cart.dart';
import 'package:myshopping_app/Screens/Home/HomeScreen.dart';

class PaymentPage extends StatelessWidget {
  static String routeName = "/payment";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: PaymentPageBody(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: BackButton(color: DefaultElements.kprimarycolor),
      elevation: 0.2,
      backgroundColor: DefaultElements.kdefaultbgcolor,
      title: Column(
        children: [
          Text(
            "Payment",
            style: GoogleFonts.lato(
              textStyle: TextStyle(
                  color: DefaultElements.kprimarycolor, letterSpacing: .5),
            ),
          ),
        ],
      ),
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

  @override
  void initState() {
    demoCarts.forEach((c) {
      total = total + (double.parse(c.product.price) * c.quantity);
    });
    super.initState();
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
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: [
          CreditCardWidget(
            cardBgColor: DefaultElements.kprimarycolor,
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
                themeColor: kPrimaryColor,
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
            onPressed: () {
              if (_formKey.currentState.validate()) {
                print('valid!');
                Navigator.of(context).pushNamed(OrderCompletion.routeName);
              } else {
                print('invalid!');
              }
            },
          )
        ],
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
            Navigator.of(context).pushNamed(HomeScreen.routeName);
          },
          text: 'Continue Shopping',
        ),
      ),
    );
  }
}
