import 'package:aplearn_group14/src/Presenters/auth.dart';
import 'package:aplearn_group14/src/Views/aunthenicate/aunthenicate.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final AuthService _auth = AuthService();
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    BusinessPage(),
    SchoolPage(),
    Contact(),
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
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async {
              if (_auth.signOut() != null) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => BeforeAuth()),
                    (route) => false);
              }
            },
          ),
        ],
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

class BusinessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.business, size: 100);
  }
}

class SchoolPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.school, size: 100);
  }
}

class Contact extends StatelessWidget {
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
