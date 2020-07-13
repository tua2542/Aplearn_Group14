//import 'package:aplearn_group14/src/Views/learn/academic/subject/thai.dart';
import 'package:flutter/material.dart';
import 'package:aplearn_group14/src/Views/home/home.dart';
import 'package:responsive_container/responsive_container.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Alternative extends StatefulWidget {
  @override
  _AlternativeState createState() => _AlternativeState();
}

class _AlternativeState extends State<Alternative> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//        appBar: AppBar(
        backgroundColor: Color(0xffECF0F9),
//          elevation: 0.0,
//          title: Text('Learn'),
//        ),
        body: Container(
//          padding: EdgeInsets.symmetric(vertical: 20.0),
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
                        "assets/images/title/alterTitle.png",
                      ),
                      widthPercent: 50.0,
                      heightPercent: 25,
                    ),
                    ResponsiveContainer(
                      child: Image.asset(
                        "assets/images/icon/alterIcon.png",
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
                                    heightPercent: 3,
                                    child: AutoSizeText(
                                      'Guitar',
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
                                      'Beginner',
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
                                      "assets/images/icon/guitarIcon.png",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onPressed: () async {
//                              Navigator.push(
//                                  context,
//                                  MaterialPageRoute(
//                                      builder: (context) => Thai()));
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
                                    heightPercent: 3,
                                    child: AutoSizeText(
                                      'Drawing',
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
                                      'Advance',
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
                                      "assets/images/icon/drawIcon.png",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onPressed: () async {
//                              Navigator.push(
//                                  context,
//                                  MaterialPageRoute(
//                                      builder: (context) => Thai()));
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

//        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
//        child: Column(
//          children: <Widget>[
//             RaisedButton(
//                color: Colors.pink[400],
//                child: Text(
//                  'Thai',
//                  style: TextStyle(color: Colors.white),
//                ),
//                onPressed: () async {
//                Navigator.push(context, MaterialPageRoute(builder: (context) => Thai()));
//
//                }),
//                RaisedButton(
//                color: Colors.pink[400],
//                child: Text(
//                  'Math',
//                  style: TextStyle(color: Colors.white),
//                ),
//                onPressed: () async {}),
//          ],
//        ),
        ));
  }
}
