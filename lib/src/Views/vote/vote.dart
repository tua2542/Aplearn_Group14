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

class VoteApp extends StatefulWidget {
  @override
  @override
  _VoteAppState createState() => _VoteAppState();
}

// _buildBody(context),
class _VoteAppState extends State<VoteApp> {
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
            body: Column(
              children: <Widget>[
                Image.asset('assets/images/news/votePage.png'),
                SizedBox(height: 20.0),
                StreamBuilder<DocumentSnapshot>(
                    stream: Firestore.instance
                        .collection('voteCourseTitle')
                        .document('title')
                        .snapshots(),
                    builder: (context, snapshot) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 10.0),
                        child: Center(
                          child: RichText(
                            text: new TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: snapshot.data['question'] + '\n',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                Flexible(
                  child: VoteWidget(),
                ),
                AutoSizeText(
                  'if you need want something else?',
                  style: TextStyle(fontSize: 12, color: Color(0xFF707070)),
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)
                  ),
                  onPressed: () async {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => addCourse()));
                  },
                  color: Colors.white,
                  textColor: Color(0xFFFE5D7E),
                  child: new Text(
                    'Click Here',
                    style: TextStyle(fontSize: 18),
                  ),
                ),

//          Container(
//            margin: EdgeInsets.all(12),
//            height: maxLines * 24.0,
//            child: TextField(
//                maxLines: maxLines,
//                decoration: InputDecoration(
//                  hintText: "Enter a message",
//                  fillColor: Colors.grey[300],
//                  filled: true,
//                ),
//                onChanged: (val) {
//                  setState(() => message = val);
//                }),
//          ),
//          SizedBox(height: 20.0),
//          RaisedButton(
//              color: Colors.pink[400],
//              child: Text(
//                'Submit',
//                style: TextStyle(color: Colors.white),
//              ),
//              onPressed: () async {
//                setState(() => loading = true);
//                dynamic result =
//                await CommentProvider().updateCommentData(message);
//                if (result == null) {
//                  setState(() {
//                    loading = false;
//                    helper = 'Your message is sent';
//                  });
//                }
//              }
//          ),
//          Text(
//            helper,
//            style: TextStyle(color: Colors.pink, fontSize: 14.0),
//          ),
              ],
            ),
          );
  }
}
