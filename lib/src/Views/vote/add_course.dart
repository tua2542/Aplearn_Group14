import 'package:aplearn_group14/src/Presenters/comment.dart';
import 'package:aplearn_group14/src/Views/home/shared/page.dart';
import 'package:aplearn_group14/src/Views/learn/academic/academic.dart';
import 'package:aplearn_group14/src/Views/learn/alternative/alternative.dart';
import 'package:aplearn_group14/src/Views/vote/vote.dart';
import 'package:aplearn_group14/src/shared/loading.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class addCourse extends StatefulWidget {
  @override
  _addCourseState createState() => _addCourseState();
}

// _buildBody(context),
class _addCourseState extends State<addCourse> {
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
        backgroundColor: Color(0xFFFFB6B7),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () async {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VoteApp()));
          },
        ),
      ),
      bottomNavigationBar: new BottomAppBar(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(width: 0.5),
            IconButton(onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomePageTwo()));
            }, icon: Icon(Icons.home),),
            IconButton(onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Academic()));
            }, icon: Icon(Icons.book),),
            IconButton(onPressed: () async {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Alternative()));
            }, icon: Icon(Icons.dashboard),),
            IconButton(onPressed: () async {}, icon: Icon(Icons.person),),
            SizedBox(width: 0.5),
          ],
        ),
      ),
      body: new SingleChildScrollView(
        child: new Column(
        children: <Widget>[
          Image.asset('assets/images/news/addCourse.png'),
          SizedBox(height: 30.0),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0),
              child: AutoSizeText(
                '     This page is for adding couses that you want voting next time. You can comment the name of the course that you want in the field below.',
                style: TextStyle(color: Color(0xFF707070), fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Container(
            padding: EdgeInsets.only(left: 25.0, right: 25.0),
            margin: EdgeInsets.all(12),
            height: maxLines * 24.0,
            child: TextField(
                maxLines: maxLines,
                decoration: const InputDecoration(
                  labelText: 'Course Name',
                ),
                onChanged: (val) {
                  setState(() => message = val);
                }),
          ),
          SizedBox(height: 20.0),
          RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)
            ),
            onPressed: () async {
              setState(() => loading = true);
              dynamic result =
              await CommentProvider().updateCommentData(message);
              if (result == null) {
                setState(() {
                  loading = false;
                  helper = 'Your message is sent';
                });
              }
            },
            color: Colors.white,
            textColor: Color(0xFFFE5D7E),
            child: new Text(
              'Submit',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Text(
            helper,
            style: TextStyle(color: Colors.pink, fontSize: 14.0),
          ),
        ],
      ),
      ),
    );
  }
}
