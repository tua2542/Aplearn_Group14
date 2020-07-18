import 'package:aplearn_group14/src/Views/learn/academic/subject/biology/biology_Screen.dart';
import 'package:aplearn_group14/src/Views/learn/academic/subject/chemistry/chem_Screen.dart';
import 'package:aplearn_group14/src/Views/learn/academic/subject/mathHigh/mathHigh_Screen.dart';
import 'package:aplearn_group14/src/Views/learn/academic/subject/mathMiddle/mathMid_Screen.dart';
import 'package:aplearn_group14/src/Views/learn/academic/subject/physics/physics_Screen.dart';
import 'package:aplearn_group14/src/Views/learn/academic/subject/science/science_Screen.dart';
import 'package:aplearn_group14/src/Views/learn/alternative/alternative.dart';
import 'package:aplearn_group14/src/Views/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:aplearn_group14/src/Views/home/home.dart';
import 'package:responsive_container/responsive_container.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Academic extends StatefulWidget {
  @override
  _AcademicState createState() => _AcademicState();
}

class _AcademicState extends State<Academic> {
  @override
  Widget build(BuildContext context) {
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Academic()));
                },
                icon: Icon(Icons.book),
              ),
              IconButton(
                onPressed: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Alternative()));
                },
                icon: Icon(Icons.dashboard),
              ),
              IconButton(
                onPressed: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
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
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                ),
                Container(
                  child: Row(children: <Widget>[
                    ResponsiveContainer(
                      padding: EdgeInsets.only(top: 25),
                      child: Image.asset(
                        "assets/images/title/acaTitle.png",
                      ),
                      widthPercent: 50.0,
                      heightPercent: 25,
                    ),
                    ResponsiveContainer(
                      child: Image.asset(
                        "assets/images/icon/acaIcon.png",
                      ),
                      widthPercent: 50.0,
                      heightPercent: 25,
                    ),
                  ]),
                ),
                ResponsiveContainer(
                  widthPercent: 100,
                  heightPercent: 6,
                ),
                //column1
                Container(
                  child: Row(children: <Widget>[
                    ResponsiveContainer(
                      widthPercent: 3,
                      heightPercent: 19,
                    ),
                    ResponsiveContainer(
                        widthPercent: 45,
                        heightPercent: 19,
                        child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            color: Colors.white,
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  ResponsiveContainer(
                                    widthPercent: 100,
                                    heightPercent: 3,
                                  ),
                                  ResponsiveContainer(
                                    widthPercent: 100,
                                    heightPercent: 4,
                                    child: AutoSizeText(
                                      'Mathematics',
                                      maxLines: 1,
                                      minFontSize: 19,
                                      style:
                                          TextStyle(color: Color(0xff707070)),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  ResponsiveContainer(
                                    widthPercent: 100,
                                    heightPercent: 2,
                                    child: AutoSizeText(
                                      'Middle School',
                                      maxLines: 1,
                                      minFontSize: 12,
                                      style:
                                          TextStyle(color: Color(0xff707070)),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  ResponsiveContainer(
                                    widthPercent: 50,
                                    heightPercent: 9,
                                    alignment: Alignment.bottomRight,
                                    child: Image.asset(
                                      "assets/images/icon/math-midIcon.png",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onPressed: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MathMidScreen()));
                            })),
                    ResponsiveContainer(
                      widthPercent: 4,
                      heightPercent: 19,
                    ),
                    ResponsiveContainer(
                        widthPercent: 45,
                        heightPercent: 19,
                        child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            color: Color(0xffFFB6B7),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  ResponsiveContainer(
                                    widthPercent: 100,
                                    heightPercent: 3,
                                  ),
                                  ResponsiveContainer(
                                    widthPercent: 100,
                                    heightPercent: 4,
                                    child: AutoSizeText(
                                      'Mathematics',
                                      maxLines: 1,
                                      minFontSize: 19,
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  ResponsiveContainer(
                                    widthPercent: 100,
                                    heightPercent: 2,
                                    child: AutoSizeText(
                                      'High School',
                                      maxLines: 1,
                                      minFontSize: 12,
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  ResponsiveContainer(
                                    widthPercent: 50,
                                    heightPercent: 9,
                                    alignment: Alignment.bottomRight,
                                    child: Image.asset(
                                      "assets/images/icon/math-highIcon.png",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onPressed: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MathHighScreen()));
                            })),
                  ]),
                ),

                ResponsiveContainer(
                  heightPercent: 1,
                  widthPercent: 100,
                ),
                //column2
                Container(
                  child: Row(children: <Widget>[
                    ResponsiveContainer(
                      widthPercent: 3,
                      heightPercent: 23,
                    ),
                    ResponsiveContainer(
                        widthPercent: 45,
                        heightPercent: 19,
                        child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            color: Color(0xff67999D),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  ResponsiveContainer(
                                    widthPercent: 100,
                                    heightPercent: 3,
                                  ),
                                  ResponsiveContainer(
                                    widthPercent: 100,
                                    heightPercent: 4,
                                    child: AutoSizeText(
                                      'Science',
                                      maxLines: 1,
                                      minFontSize: 19,
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  ResponsiveContainer(
                                    widthPercent: 100,
                                    heightPercent: 2,
                                    child: AutoSizeText(
                                      'Middle School',
                                      maxLines: 1,
                                      minFontSize: 12,
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  ResponsiveContainer(
                                    widthPercent: 50,
                                    heightPercent: 9,
                                    alignment: Alignment.bottomRight,
                                    child: Image.asset(
                                      "assets/images/icon/sciIcon.png",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onPressed: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => scienceScreen()));
                            })),
                    ResponsiveContainer(
                      widthPercent: 3,
                      heightPercent: 20,
                    ),
                    ResponsiveContainer(
                        widthPercent: 45,
                        heightPercent: 19,
                        child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            color: Colors.white,
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  ResponsiveContainer(
                                    widthPercent: 100,
                                    heightPercent: 3,
                                  ),
                                  ResponsiveContainer(
                                    widthPercent: 100,
                                    heightPercent: 4,
                                    child: AutoSizeText(
                                      'Physics',
                                      maxLines: 1,
                                      minFontSize: 19,
                                      style:
                                          TextStyle(color: Color(0xff707070)),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  ResponsiveContainer(
                                    widthPercent: 100,
                                    heightPercent: 2,
                                    child: AutoSizeText(
                                      'High School',
                                      maxLines: 1,
                                      minFontSize: 12,
                                      style:
                                          TextStyle(color: Color(0xff707070)),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  ResponsiveContainer(
                                    widthPercent: 50,
                                    heightPercent: 9,
                                    alignment: Alignment.bottomRight,
                                    child: Image.asset(
                                      "assets/images/icon/phyIcon.png",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onPressed: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => physicsScreen()));
                            })),
                  ]),
                ),

                ResponsiveContainer(
                  heightPercent: 1,
                  widthPercent: 100,
                ),
                //column3
                Container(
                  child: Row(children: <Widget>[
                    ResponsiveContainer(
                      widthPercent: 3,
                      heightPercent: 19,
                    ),
                    ResponsiveContainer(
                        widthPercent: 45,
                        heightPercent: 19,
                        child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            color: Colors.white,
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  ResponsiveContainer(
                                    widthPercent: 100,
                                    heightPercent: 3,
                                  ),
                                  ResponsiveContainer(
                                    widthPercent: 100,
                                    heightPercent: 4,
                                    child: AutoSizeText(
                                      'Chemistry',
                                      maxLines: 1,
                                      minFontSize: 19,
                                      style:
                                          TextStyle(color: Color(0xff707070)),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  ResponsiveContainer(
                                    widthPercent: 100,
                                    heightPercent: 2,
                                    child: AutoSizeText(
                                      'High School',
                                      maxLines: 1,
                                      minFontSize: 12,
                                      style:
                                          TextStyle(color: Color(0xff707070)),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  ResponsiveContainer(
                                    widthPercent: 50,
                                    heightPercent: 9,
                                    alignment: Alignment.bottomRight,
                                    child: Image.asset(
                                      "assets/images/icon/chemIcon.png",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onPressed: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => chemScreen()));
                            })),
                    ResponsiveContainer(
                      widthPercent: 4,
                      heightPercent: 19,
                    ),
                    ResponsiveContainer(
                        widthPercent: 45,
                        heightPercent: 19,
                        child: MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            color: Color(0xffABCFCF),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  ResponsiveContainer(
                                    widthPercent: 100,
                                    heightPercent: 3,
                                  ),
                                  ResponsiveContainer(
                                    widthPercent: 100,
                                    heightPercent: 4,
                                    child: AutoSizeText(
                                      'Biology',
                                      maxLines: 1,
                                      minFontSize: 19,
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  ResponsiveContainer(
                                    widthPercent: 100,
                                    heightPercent: 2,
                                    child: AutoSizeText(
                                      'High School',
                                      maxLines: 1,
                                      minFontSize: 12,
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  ResponsiveContainer(
                                    widthPercent: 50,
                                    heightPercent: 9,
                                    alignment: Alignment.bottomRight,
                                    child: Image.asset(
                                      "assets/images/icon/bioIcon.png",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onPressed: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => bioScreen()));
                            })),
                  ]),
                ),
                ResponsiveContainer(
                  widthPercent: 100,
                  heightPercent: 3,
                ),
              ],
            ),
          ),
        ));
  }
}
