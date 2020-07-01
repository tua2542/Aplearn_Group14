import 'package:aplearn_group14/src/Presenters/paymentservice.dart';
import 'package:aplearn_group14/src/Views/aunthenicate/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:url_launcher/url_launcher.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
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
            //Sign In / Register
            RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Sign In / Register',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignIn()));
                }),

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

class BeforeAuth extends StatefulWidget {
  @override
  _BeforeAuthState createState() => _BeforeAuthState();
}

class _BeforeAuthState extends State<BeforeAuth> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    BusinessPage(),
    SchoolPage(),
    Authenticate(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplearn'),

      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('settings'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.home, size: 100);
  }
}

class BusinessPage extends StatefulWidget {
  @override
  _BusinessPageState createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
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

class SchoolPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.school, size: 100);
  }
}

