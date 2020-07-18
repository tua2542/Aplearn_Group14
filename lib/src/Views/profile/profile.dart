import 'package:aplearn_group14/src/Views/aunthenicate/sign_in.dart';
import 'package:aplearn_group14/src/Views/home/shared/page.dart';
import 'package:aplearn_group14/src/Views/learn/academic/academic.dart';
import 'package:aplearn_group14/src/Views/learn/alternative/alternative.dart';
import 'package:aplearn_group14/src/Views/profile/profile_edit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;

  @override
  void initState() {
    super.initState();
    initUser();
  }

  initUser() async {
    user = await _auth.currentUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('users')
            .where("uid", isEqualTo: user.uid)
            .snapshots(),
        builder: (context, snapshot) {
          return Scaffold(
            bottomNavigationBar: new BottomAppBar(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(width: 0.5),
                  IconButton(
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePageTwo()));
                    },
                    icon: Icon(Icons.home),
                  ),
                  IconButton(
                    onPressed: () async {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Academic()));
                    },
                    icon: Icon(Icons.book),
                  ),
                  IconButton(
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Alternative()));
                    },
                    icon: Icon(Icons.dashboard),
                  ),
                  IconButton(
                    onPressed: () async {},
                    icon: Icon(Icons.person),
                  ),
                  SizedBox(width: 0.5),
                ],
              ),
            ),
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Color(0xFF9FB3F2),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.black87),
                onPressed: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePageTwo()));
                },
              ),
            ),
            body: new SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.asset('assets/images/news/profilePage.png'),
                  SizedBox(height: 20),
                  Container(
                      child: Column(
                    children: snapshot.data.documents
                        .map((DocumentSnapshot document) {
                      return ClipOval(
                        child: SizedBox(
                          width: 120.0,
                          height: 120.0,
                          child: Image.network(
                            document['avatar'],
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    }).toList(),
                  )),
                  SizedBox(height: 20.0),
                  Container(
                      child: Column(
                    children: snapshot.data.documents
                        .map((DocumentSnapshot document) {
                      return new AutoSizeText(
                          "Name: " +
                              document['firstname'] +
                              " " +
                              document['lastname'],
                          textScaleFactor: 1.2);
                    }).toList(),
                  )),
                  SizedBox(height: 20.0),
                  Container(
                      child: Column(
                    children: snapshot.data.documents
                        .map((DocumentSnapshot document) {
                      return new AutoSizeText("Email: " + document['email'],
                          textScaleFactor: 1.2);
                    }).toList(),
                  )),
                  SizedBox(height: 20.0),
                  Container(
                      child: Column(
                    children: snapshot.data.documents
                        .map((DocumentSnapshot document) {
                      return new AutoSizeText(
                          "Occupation: " + document['occupation'],
                          textScaleFactor: 1.2);
                    }).toList(),
                  )),
                  SizedBox(height: 20.0),
                  Container(
                      child: Column(
                    children: snapshot.data.documents
                        .map((DocumentSnapshot document) {
                      return new AutoSizeText(
                          "Birth Date: " + document['birthdate'],
                          textScaleFactor: 1.2);
                    }).toList(),
                  )),
                  SizedBox(height: 20.0),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileEdit()));
                    },
                    color: Colors.white,
                    textColor: Color(0xFF79AFBB),
                    child: new AutoSizeText(
                      'Edit Profile',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
                    color: Colors.white,
                    textColor: Color(0xFFFF5960),
                    child: new AutoSizeText(
                      '   Logout   ',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
          );
        });
  }
}
