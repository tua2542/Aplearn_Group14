import 'package:aplearn_group14/src/Models/user.dart';
import 'package:aplearn_group14/src/Presenters/auth.dart';
import 'package:aplearn_group14/src/wrapper.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(new MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 5,
      navigateAfterSeconds: AfterSplash(),
      title: Text('Welcome To Aplearn',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black87, fontSize: 22),
      ),
      image: Image.asset('assets/images/icon/acaIcon.png', width: 175, height: 175),
      imageBackground: AssetImage("assets/images/background/bg2.jpg"),
      styleTextUnderTheLoader: TextStyle(),
      photoSize: 50.0,
      loaderColor: Colors.blue,
    );
  }
}

class AfterSplash extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
