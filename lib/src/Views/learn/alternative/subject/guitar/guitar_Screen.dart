import 'package:aplearn_group14/src/Presenters/review.dart';
import 'package:aplearn_group14/src/Views/learn/academic/academic.dart';
import 'package:aplearn_group14/src/Views/learn/alternative/subject/guitar/unit_widget/unitOne.dart';
import 'package:aplearn_group14/src/Views/learn/alternative/alternative.dart';
import 'package:aplearn_group14/src/Views/profile/profile.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:responsive_container/responsive_container.dart';
import 'package:aplearn_group14/src/customer_expansion_title.dart' as custom;

class guitarScreen extends StatefulWidget {
  @override
  _guitarScreenState createState() => _guitarScreenState();
}

class _guitarScreenState extends State<guitarScreen> {
  final maxLines = 5;
  String message = '';
  String helper = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance
            .collection('courses')
            .document('thai')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:

            default:
              return Scaffold(
                bottomNavigationBar: new BottomAppBar(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(width: 0.5),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.home),
                      ),
                      IconButton(
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Academic()));
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
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profile()));
                        },
                        icon: Icon(Icons.person),
                      ),
                      SizedBox(width: 0.5),
                    ],
                  ),
                ),
                backgroundColor: Color(0xffECF0F9),
                body: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 5.0),
                        IconButton(
                          padding: EdgeInsets.only(right: 500, top: 50),
                          icon: Icon(Icons.arrow_back_ios),
                          color: Colors.black87,
                          iconSize: 25.0,
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Alternative()),
                            );
                          },
                        ),
                        Container(
                          child: Row(children: <Widget>[
                            ResponsiveContainer(
                              padding: EdgeInsets.only(top: 25),
                              child: Image.asset(
                                "assets/images/title/guitarTitle.png",
                              ),
                              widthPercent: 50.0,
                              heightPercent: 25,
                            ),
                            ResponsiveContainer(
                              child: Image.asset(
                                "assets/images/icon/guitarIcon.png",
                              ),
                              widthPercent: 50.0,
                              heightPercent: 25,
                            ),
                          ]),
                        ),
                        Container(
                          child: Stack(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: <Widget>[
                                  Container(
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(height: 20.0),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 0.0, horizontal: 20.0),
                                          child: RichText(
                                            textAlign: TextAlign.justify,
                                            text: new TextSpan(
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: snapshot.data[
                                                          'courseInformation '] +
                                                      '\n\n',
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    color: Color(0xFF707070),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 30.0),
                                          child: Column(
                                            children: <Widget>[
                                              custom.ExpansionTile(
                                                headerBackgroundColor:
                                                    Colors.white,
                                                backgroundColor:
                                                    Color(0xFFF6F8FC),
                                                title: Text(
                                                  "Unit 1",
                                                  style: TextStyle(
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xFF707070)),
                                                ),
                                                children: <Widget>[
                                                  UnitOneWidget()
                                                ],
                                              ),
                                              custom.ExpansionTile(
                                                headerBackgroundColor:
                                                    Colors.white,
                                                backgroundColor:
                                                    Color(0xFFF6F8FC),
                                                title: Text(
                                                  "Unit 2",
                                                  style: TextStyle(
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color(0xFF707070)),
                                                ),
                                                children: <Widget>[
                                                  ListTile(
                                                    title: Text('data'),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 30.0),
                                              child: RichText(
                                                textAlign: TextAlign.justify,
                                                text: new TextSpan(
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                      text:
                                                          'Instructor' + '\n\n',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color:
                                                            Color(0xFF707070),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            SizedBox(width: 30),
                                            ClipOval(
                                              child: SizedBox(
                                                width: 65.0,
                                                height: 65.0,
                                                child: Image.network(
                                                  snapshot
                                                      .data['teacher_avatar'],
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20.0),
                                                child: RichText(
                                                  textAlign: TextAlign.justify,
                                                  text: new TextSpan(
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: snapshot.data[
                                                                'firstname'] +
                                                            '  ' +
                                                            snapshot.data[
                                                                'lastname'] +
                                                            '\n\n',
                                                        style: TextStyle(
                                                          fontSize: 18,
                                                          color:
                                                              Color(0xFF707070),
                                                        ),
                                                      ),
                                                      TextSpan(
                                                        text: snapshot.data[
                                                                'teacherInformation'] +
                                                            '\n',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          color:
                                                              Color(0xFF707070),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20),
                                        Row(
                                          children: <Widget>[
                                            SizedBox(width: 35),
                                            AutoSizeText(
                                              'Review this course',
                                              style: TextStyle(
                                                  color: Color(0xFF707070),
                                                  fontSize: 15),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 30, right: 30),
                                          height: maxLines * 24.0,
                                          child: TextField(
                                              maxLines: maxLines,
                                              decoration: const InputDecoration(
                                                labelText: 'Enter Your Message',
                                              ),
                                              onChanged: (val) {
                                                setState(() => message = val);
                                              }),
                                        ),
                                        SizedBox(height: 15.0),
                                        RaisedButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0)),
                                          onPressed: () async {
                                            setState(() => loading = true);
                                            dynamic result =
                                                await ReviewProvider()
                                                    .updateCommentData(message);
                                            if (result == null) {
                                              setState(() {
                                                loading = false;
                                                helper = 'Your message is sent';
                                              });
                                            }
                                          },
                                          color: Colors.white,
                                          textColor: Color(0xFF9FB3F2),
                                          child: new Text(
                                            'Submit',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                        SizedBox(height: 20.0),
                                        Text(
                                          helper,
                                          style: TextStyle(
                                              color: Colors.pink,
                                              fontSize: 14.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
          }
        });
  }
}
