import 'package:aplearn_group14/src/Views/learn/academic/academic.dart';
import 'package:aplearn_group14/src/Views/learn/academic/subject/thai/unit_widget/unitOne.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:responsive_container/responsive_container.dart';

class ThaiScreen extends StatefulWidget {
  @override
  _ThaiScreenState createState() => _ThaiScreenState();
}

class _ThaiScreenState extends State<ThaiScreen> {
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
                backgroundColor: Color(0xffECF0F9),
//                appBar: AppBar(
//                  backgroundColor: Colors.brown[400],
//                  elevation: 0.0,
//                  title: Text('THAI (Middle school)'),
//                ),
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
                                  builder: (context) => Academic()),
                            );
                          },
                        ),
                        Container(
                          child: Row(children: <Widget>[
                            ResponsiveContainer(
                              padding: EdgeInsets.only(top: 25),
                              child: Image.asset(
                                "assets/images/title/math-midTitle.png",
                              ),
                              widthPercent: 50.0,
                              heightPercent: 25,
                            ),
                            ResponsiveContainer(
                              child: Image.asset(
                                "assets/images/icon/math-midIcon.png",
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
                                              ExpansionTile(
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
                                              ExpansionTile(
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
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                           horizontal: 20.0),
                                          child: RichText(
                                            text: new TextSpan(
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: 'Instructor' + '\n\n',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Color(0xFF707070),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        ClipOval(
                                          child: SizedBox(
                                            width: 60.0,
                                            height: 60.0,
                                            child: Image.network(
                                              snapshot.data['teacher_avatar'],
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: RichText(
                                            text: new TextSpan(
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: snapshot
                                                          .data['firstname'] +
                                                      ' ' +
                                                      snapshot
                                                          .data['lastname'] +
                                                      '\n\n',
                                                  style: TextStyle(
                                                    fontSize: 23,
                                                    color: Color(0xFF707070),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: RichText(
                                            text: new TextSpan(
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: snapshot.data[
                                                          'teacherInformation'] +
                                                      '\n\n',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Color(0xFF707070),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
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
