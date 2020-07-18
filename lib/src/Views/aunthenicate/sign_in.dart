import 'package:aplearn_group14/src/Presenters/auth.dart';
import 'package:aplearn_group14/src/Views/aunthenicate/register.dart';
import 'package:aplearn_group14/src/Views/aunthenicate/sign_in_admin.dart';
import 'package:aplearn_group14/src/shared/loading.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
//            appBar: AppBar(
//              backgroundColor: Colors.brown[400],
//              elevation: 0.0,
//              title: Text('Sign in to Aplearn'),
//              actions: <Widget>[
//                FlatButton.icon(
//                    icon: Icon(Icons.person),
//                    label: Text('Register'),
//                    onPressed: () async {
//                      Navigator.push(context,
//                          MaterialPageRoute(builder: (context) => Register()));
//                    }),
//              ],
//            ),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background/bg1.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 50.0),
                      Image.asset("assets/images/icon/acaIcon.png",
                          width: 175, height: 175),
                      Text(
                        'APLEARN',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black87, fontSize: 22),
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Enter your email',
                          labelText: 'Email',
                        ),
                        validator: (val) =>
                            val.isEmpty ? 'Enter an email' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Enter your password',
                          labelText: 'Password',
                        ),
                        validator: (val) => val.length < 6
                            ? 'Enter a password 6+ chars long'
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      SizedBox(height: 5.0),
                      FlatButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "Forget Password?",
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return Scaffold(
//                                  backgroundColor: Colors.brown[100],
//                                  appBar: AppBar(
//                                    title: Text('Reset Password'),
//                                    backgroundColor: Colors.brown[400],
//                                    elevation: 0.0,
//                                  ),
                                  body: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/background/bg1.jpg"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 20.0, horizontal: 50.0),
                                    child: Form(
                                      child: Column(
                                        children: <Widget>[
                                          SizedBox(height: 5.0),
                                          IconButton(
                                            padding:
                                                EdgeInsets.only(right: 500),
                                            icon: Icon(Icons.arrow_back_ios),
                                            color: Colors.black87,
                                            iconSize: 25.0,
                                            onPressed: () async {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          SignIn()));
                                            },
                                          ),
                                          Image.asset(
                                              "assets/images/icon/acaIcon.png",
                                              width: 175,
                                              height: 175),
                                          Text(
                                            'Forget Password',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 22),
                                          ),
                                          SizedBox(height: 20.0),
                                          TextFormField(
                                              decoration: const InputDecoration(
                                                labelText: 'Enter Your Email',
                                              ),
                                              validator: (val) => val.isEmpty
                                                  ? 'Enter an email'
                                                  : null,
                                              onChanged: (val) {
                                                setState(() => email = val);
                                              }),
                                          SizedBox(height: 20.0),
                                          Container(
                                            height: 40,
                                            width: 275,
                                            child: RaisedButton(
                                              onPressed: () async {
                                                _auth.sendPasswordResetEmail(
                                                    email);
                                                if (email != null) {
                                                  Flushbar(
                                                    title: 'Reset Password',
                                                    message:
                                                        'We send the detail to $email successfully',
                                                    icon: Icon(
                                                      Icons.info_outline,
                                                      size: 28,
                                                      color:
                                                          Colors.blue.shade300,
                                                    ),
                                                    leftBarIndicatorColor:
                                                        Colors.blue.shade300,
                                                    duration:
                                                        Duration(seconds: 3),
                                                  ).show(context);
                                                }
                                              },
                                              padding: EdgeInsets.all(0.0),
                                              child: Ink(
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xff374ABE),
                                                      Color(0xff64B6FF)
                                                    ],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                  ),
                                                ),
                                                child: Container(
                                                  constraints: BoxConstraints(
                                                      maxWidth: 300.0,
                                                      minHeight: 50.0),
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "Submit",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            );
                          }),
                      Container(
                        height: 40,
                        width: 275,
                        child: RaisedButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() => loading = true);
                              dynamic result = await _auth
                                  .signInWithEmailAndPassword(email, password);
                              if (result == null) {
                                setState(() {
                                  loading = false;
                                  error =
                                      'Could not sign in with those credentials';
                                });
                              }
                            }
                          },
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF4FC3F7), Color(0xFF81D4FA)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 300.0, minHeight: 50.0),
                              alignment: Alignment.center,
                              child: Text(
                                "Sign In",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        height: 40,
                        width: 275,
                        child: RaisedButton(
                          onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()));
                          },
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                            ),
                            child: Container(
                              constraints: BoxConstraints(
                                  maxWidth: 300.0, minHeight: 50.0),
                              alignment: Alignment.center,
                              child: Text(
                                "Register",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      FlatButton(
                          child: Text(
                            'For admin login here',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInForAdmin()));
                          }),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
