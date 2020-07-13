import 'package:aplearn_group14/src/Views/learn/academic/academic.dart';
import 'package:aplearn_group14/src/Views/learn/alternative/alternative.dart';
import 'package:aplearn_group14/src/Views/learn/study.dart';
import 'package:aplearn_group14/src/Views/news/newsVote.dart';
import 'package:aplearn_group14/src/Views/payment/paymentscreen.dart';
import 'package:aplearn_group14/src/Views/profile/profile.dart';
import 'package:aplearn_group14/src/Views/vote/vote.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:responsive_container/responsive_container.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:aplearn_group14/src/Views/news/newsHire.dart';
import 'package:aplearn_group14/src/Views/news/newsSubject.dart';

int _currentIndex = 0;
List cardList = [Item1(), Item2(), Item3()];

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }
  return result;
}

class Item1 extends StatelessWidget {
  const Item1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FittedBox(
            child: RaisedButton(
              color: Colors.white,
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => newsHire()));
              },
              child: Container(
                width: MediaQuery.of(context).size.height,
                margin: EdgeInsets.symmetric(horizontal: 35.0),
                child: Image.asset('assets/images/news/homeNewsHire.png',
                    fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Item2 extends StatelessWidget {
  const Item2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFDF2F0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FittedBox(
              child: RaisedButton(
            color: Color(0xFFFDF2F0),
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => newsSubject()));
                },
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 35.0),
              child: Image.asset('assets/images/news/homeNewsSubject.png',
                  fit: BoxFit.cover),
            ),
          )),
        ],
      ),
    );
  }
}

class Item3 extends StatelessWidget {
  const Item3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FittedBox(
            child: RaisedButton(
              color: Colors.white,
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => newsVote()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 35.0),
                child: Image.asset('assets/images/news/homeNewsVote.jpg',
                    fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DrawCircle extends CustomPainter {
  Paint _paint;

  DrawCircle() {
    _paint = Paint()
      ..color = Color(0xff9FB3F2)
      ..strokeWidth = 10.0
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(0.0, 0.0), 180.0, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

// ignore: must_be_immutable
class HomePageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: new BoxDecoration(
          color: Color(0xffECF0F9),
        ),
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
        child: ResponsiveContainer(
          widthPercent: 100.0,
          heightPercent: 100.0,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.topRight,
                  child: CustomPaint(painter: DrawCircle()),
                ),
                SizedBox(height: 40),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    child: Text(
                      "NEWS",
                      style: TextStyle(color: Colors.white, fontSize: 30.0),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                CarouselSlider(
                  height: 250.0,
                  initialPage: 0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  reverse: false,
                  enableInfiniteScroll: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 2000),
                  pauseAutoPlayOnTouch: Duration(seconds: 10),
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  items: cardList.map((card) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Card(
                            color: Color(0xff435BFF),
                            child: card,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: map<Widget>(cardList, (index, url) {
                    return Container(
                      width: 10.0,
                      height: 10.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentIndex == index
                            ? Colors.black54
                            : Colors.grey[500],
                      ),
                    );
                  }),
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        color: Colors.indigoAccent,
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Academic()));
                        },
                        child: new Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: new Text(
                                  '''ACADEMIC
LEARNING''',
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                            new Image.asset(
                              'assets/images/picture/academicLearning.png',
                              fit: BoxFit.cover,
                              height: 100.0,
                              width: 100.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        color: Color(0xff00766A),
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Alternative()));
                        },
                        child: new Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Image.asset(
                              'assets/images/picture/alternativeLearning.jpg',
                              fit: BoxFit.cover,
                              height: 100.0,
                              width: 100.0,
                            ),
                            Padding(
                                padding: EdgeInsets.only(right: 0),
                                child: new Text(
                                  '''ALTERNATIVE
LEARNING''',
                                  style: TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        color: Color(0xff56AFBC),
                        onPressed: () {},
                        child: new Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(left: 0.0),
                                child: new Text(
                                  '''MAKE A
DONATE''',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                            new Image.asset(
                              'assets/images/picture/donate.jpg',
                              fit: BoxFit.cover,
                              height: 80.0,
                              width: 40.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Expanded(
                      child: RaisedButton(
                        color: Color(0xffFF5960),
                        onPressed: () {},
                        child: new Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Image.asset(
                              'assets/images/picture/vote.png',
                              fit: BoxFit.cover,
                              height: 80.0,
                              width: 40.0,
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 0.0),
                                child: new Text(
                                  '''GIVE ME
A VOTE''',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}

class BusinessPageTwo extends StatefulWidget {
  @override
  _BusinessPageTwoState createState() => _BusinessPageTwoState();
}

class _BusinessPageTwoState extends State<BusinessPageTwo> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  final Firestore _db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Column(
          children: <Widget>[
            //Sign In / Register
            RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Donate',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PaymentScreen(_auth, user, _db)));
                }),
            RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Vote',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => VoteApp()));
                }),
          ],
        ),
      ),
    );
  }
}

class SchoolPageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Icon(Icons.school, size: 100);
  }
}

class ContactPageTwo extends StatelessWidget {
  final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'sakdipat3536@gmail.com',
      queryParameters: {'subject': 'Recruitment_with_Aplearn'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Column(
          children: <Widget>[
            RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Work with us',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  launch(_emailLaunchUri.toString());
                }),
            RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Profile',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                }),
          ],
        ),
      ),
    );
  }
}
