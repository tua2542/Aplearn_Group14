import 'package:aplearn_group14/src/Presenters/auth.dart';
import 'package:aplearn_group14/src/Views/aunthenicate/sign_in.dart';
import 'package:aplearn_group14/src/shared/constants.dart';
import 'package:aplearn_group14/src/shared/loading.dart';
import 'package:aplearn_group14/src/wrapper.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';
  String confirmPassword = '';
  String firstname = '';
  String lastname = '';
  String occupation = '';
  String role = 'student';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
//            backgroundColor: Colors.brown[100],
//            appBar: AppBar(
//              backgroundColor: Colors.brown[400],
//              elevation: 0.0,
//              title: Text('Sign up to Aplearn'),
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
                      SizedBox(height: 5.0),
                      IconButton(
                        padding: EdgeInsets.only(right: 500),
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.black87,
                        iconSize: 25.0,
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignIn()));
                        },
                      ),
                      Image.asset("assets/images/icon/acaIcon.png",
                          width: 175, height: 175),
                      Text(
                        'Register',
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
                        decoration: const InputDecoration(
                          hintText: 'Enter your password',
                          labelText: 'Password',
                        ),
                        obscureText: true,
                        validator: (val) => val.length < 6
                            ? 'Enter a password 6+ chars long'
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Enter your firstname',
                          labelText: 'Firstname',
                        ),
                        validator: (val) =>
                            val.isEmpty ? 'Enter an firstname' : null,
                        onChanged: (val) {
                          setState(() => firstname = val);
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Enter your lastname',
                          labelText: 'Lastname',
                        ),
                        validator: (val) =>
                            val.isEmpty ? 'Enter an lastname' : null,
                        onChanged: (val) {
                          setState(() => lastname = val);
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: 'Enter your occupation',
                          labelText: 'Occupation',
                        ),
                        validator: (val) =>
                            val.isEmpty ? 'Enter an occupation' : null,
                        onChanged: (val) {
                          setState(() => occupation = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      Container(
                        height: 40,
                        width: 275,
                        child: RaisedButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              setState(() => loading = true);
                              dynamic result =
                              await _auth.registerWithEmailAndPassword(
                                  email,
                                  password,
                                  firstname,
                                  lastname,
                                  occupation,
                                  role);
                              if (result == null) {
                                setState(() {
                                  loading = false;
                                  error = 'Please supply a valid email';
                                });
                              } else {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Wrapper()),
                                        (route) => false);
                              }
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
                                "Register",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
