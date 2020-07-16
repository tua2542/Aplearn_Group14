import 'package:aplearn_group14/src/Presenters/comment.dart';
import 'package:aplearn_group14/src/Views/home/shared/page.dart';
import 'package:aplearn_group14/src/Views/learn/academic/academic.dart';
import 'package:aplearn_group14/src/Views/learn/alternative/alternative.dart';
import 'package:aplearn_group14/src/Views/vote/add_course.dart';
import 'package:aplearn_group14/src/Views/vote/vote_widget/vote_widget.dart';
import 'package:aplearn_group14/src/shared/loading.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class donation extends StatefulWidget {
  @override
  _donationState createState() => _donationState();
}

// _buildBody(context),
class _donationState extends State<donation> {
  final maxLines = 5;
  FirebaseUser user;
  String message = '';
  String helper = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFF79AFBB),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () async {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomePageTwo()));
          },
        ),
      ),
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
      body: new SingleChildScrollView(
        child: new Column(
        children: <Widget>[
          Image.asset('assets/images/news/donationPage.png'),
          SizedBox(height: 30),
          Image.asset('assets/images/picture/school.jpg', width: 275, height: 175),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0),
              child: AutoSizeText(
                "     Lorem ipsum dolor sit amet, usu eu laudem possim epicurei. Posse iudicabit appellantur sea ex, et tractatos deseruisse vis, per ut blandit invenire. Nemore habemus offendit te eum. Te vel case paulo volutpat, ad nullam nostrum consectetuer vis, nusquam fuisset principes pro no.",
                style: TextStyle(color: Color(0xFF707070), fontSize: 15),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0),
              child: AutoSizeText(
                '''Account Name: Aplearn
Bank Account Number: 123-4-56789-0
Bank Name: Bangkok Bank''',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF2B2B2B), fontSize: 17),
              ),
            ),
          ),
          SizedBox(height: 20),

        ],
      ),
      ),
    );
  }
}
