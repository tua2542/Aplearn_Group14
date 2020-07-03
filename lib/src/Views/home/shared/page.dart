import 'package:aplearn_group14/src/Presenters/paymentservice.dart';
import 'package:aplearn_group14/src/Views/learn/study.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:stripe_payment/stripe_payment.dart';



class HomePageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold(

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Column(
          children: <Widget>[
            //Sign In / Register
                RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Learn',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Study()));
                }),
          ],
        ),
      ),

      );
  }
}

class BusinessPageTwo extends StatefulWidget {
  @override
  _BusinessPageTwoState createState() => _BusinessPageTwoState();
}

class _BusinessPageTwoState extends State<BusinessPageTwo> {
  // String _error;
  // PaymentMethod _paymentMethod;
  // Token _paymentToken;
  

  final CreditCard testCard = CreditCard(
    number: '4000002760003184',
    expMonth: 12,
    expYear: 21,
  );

  // GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  initState() {
    super.initState();

    StripePayment.setOptions(
        StripeOptions(publishableKey: "pk_test_51GzJm8LlTCGQsQVIfc7l1x4Cf4QM4GX4jxKSxX3WdAZsiLJH5nRiskSMfombF1xgKquF8gPz5peMfpoBNaJ9psEP00i1rSNZtH", 
        merchantId: "Test", androidPayMode: 'test'));
  }

  // void setError(dynamic error) {
  //   _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(error.toString())));
  //   setState(() {
  //     error = error.toString();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Column(
          children: <Widget>[
            //Sign In / Register
                RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Donate 1 Dollar',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                StripePayment.paymentRequestWithCardForm(CardFormPaymentRequest()).then((token) {
                  PaymentService().addCard(token);
                });
                }),
          ],
        ),
      ),

      );
  }
}



class SchoolPageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.school, size: 100);
  }
}

class ContactPageTwo extends StatelessWidget {
  final Uri _emailLaunchUri = Uri(
  scheme: 'mailto',
  path: 'sakdipat3536@gmail.com',
  queryParameters: {
    'subject': 'Recruitment_with_Aplearn'
  }
);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Column(
          children: <Widget>[
            RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Work with us',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  launch(_emailLaunchUri.toString());
                }),
          ],
        ),
      ),
    );
  }
}