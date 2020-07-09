import 'package:aplearn_group14/src/Presenters/auth.dart';
import 'package:aplearn_group14/src/shared/constants.dart';
import 'package:aplearn_group14/src/shared/loading.dart';
import 'package:aplearn_group14/src/wrapper.dart';
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
  String avatar = 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: Text('Sign up to Aplearn'),
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'email'),
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() => email = val);
                      },
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'password'),
                      obscureText: true,
                      validator: (val) => val.length < 6
                          ? 'Enter a password 6+ chars long'
                          : null,
                      onChanged: (val) {
                        setState(() => password = val);
                      },
                    ),
                     SizedBox(height: 10.0),
                     TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'firstname'),
                      validator: (val) => val.isEmpty ? 'Enter an firstname' : null,
                      onChanged: (val) {
                        setState(() => firstname = val);
                      },
                    ),
                     SizedBox(height: 10.0),
                     TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'lastname'),
                      validator: (val) => val.isEmpty ? 'Enter an lastname' : null,
                      onChanged: (val) {
                        setState(() => lastname = val);
                      },
                    ),
                     SizedBox(height: 10.0),
                     TextFormField(
                      decoration:
                          textInputDecoration.copyWith(hintText: 'occupation'),
                      validator: (val) => val.isEmpty ? 'Enter an occupation' : null,
                      onChanged: (val) {
                        setState(() => occupation = val);
                      },
                    ),
                    SizedBox(height: 20.0),
                    RaisedButton(
                        color: Colors.pink[400],
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic result = await _auth
                                .registerWithEmailAndPassword(email,password,firstname,lastname,occupation,role,avatar);
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
                        }),
                    SizedBox(height: 12.0),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
