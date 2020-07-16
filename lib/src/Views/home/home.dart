//import 'package:aplearn_group14/src/Presenters/auth.dart';
//import 'package:aplearn_group14/src/Views/aunthenicate/sign_in.dart';
//import 'package:aplearn_group14/src/Views/home/shared/page.dart';
//import 'package:flutter/material.dart';
//import 'package:aplearn_group14/src/Views/learn/academic/academic.dart';
//import 'package:aplearn_group14/src/Views/learn/alternative/alternative.dart';
//import 'package:aplearn_group14/src/Views/profile/profile.dart';
//
//class Home extends StatelessWidget {
//  static const String _title = 'Flutter Code Sample';
//
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: _title,
//      home: MyStatefulWidget(),
//    );
//  }
//}
//
//class MyStatefulWidget extends StatefulWidget {
//  MyStatefulWidget({Key key}) : super(key: key);
//
//  @override
//  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
//}
//
//class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//  final AuthService _auth = AuthService();
//  int _selectedIndex = 0;
//  static List<Widget> _widgetOptions = <Widget>[
//    HomePageTwo(),
//    Academic(),
//    Alternative(),
//    Profile(),
//  ];
//
//  void _onItemTapped(int index) {
//    setState(() {
//      _selectedIndex = index;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Center(
//        child: _widgetOptions.elementAt(_selectedIndex),
//      ),
//      bottomNavigationBar: BottomNavigationBar(
//        items: const <BottomNavigationBarItem>[
//          BottomNavigationBarItem(
//            icon: Icon(Icons.home),
//            title: Text('Home'),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.book),
//            title: Text('Academic'),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.dashboard),
//            title: Text('Alternative'),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.person),
//            title: Text('Profile'),
//          ),
//        ],
//        currentIndex: _selectedIndex,
//        selectedItemColor: Colors.red,
//        unselectedItemColor: Colors.black,
//        onTap: _onItemTapped,
//      ),
//    );
//  }
//}
