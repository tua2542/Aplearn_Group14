import 'package:aplearn_group14/src/Views/home/shared/page.dart';
import 'package:aplearn_group14/src/Views/learn/academic/academic.dart';
import 'package:aplearn_group14/src/Views/learn/alternative/alternative.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Donate extends StatefulWidget {
  @override
  _DonateState createState() => _DonateState();
}

class _DonateState extends State<Donate> {
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
    return StreamBuilder<DocumentSnapshot>(
        stream:
        Firestore.instance.collection('donations').document('camp').snapshots(),
        builder: (context, snapshot) {
          final List<String> imgList = [
            snapshot.data['campImage1'],
            snapshot.data['campImage2'],
            snapshot.data['campImage3'],

          ];
          final List<Widget> imageSliders = imgList
              .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item,
                          fit: BoxFit.cover, width: 1000.0),
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),

                        ),
                      ),
                    ],
                  )),
            ),
          ))
              .toList();
          return Scaffold(
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.asset('assets/images/news/donationPage.png'),
                  SizedBox(height: 20.0),
                  Container(
                      child: Column(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              CarouselSlider(
                                options: CarouselOptions(
                                  autoPlay: true,
                                  aspectRatio: 2.0,
                                  enlargeCenterPage: true,
                                ),
                                items: imageSliders,
                              ),
                            ],
                          ),
                          SizedBox(height: 20.0),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Center(
                              child: RichText(
                                textAlign: TextAlign.justify,
                                text: new TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text:
                                      '     Lorem ipsum dolor sit amet, usu eu laudem possim epicurei. Posse iudicabit appellantur sea ex, et tractatos deseruisse vis, per ut blandit invenire. Nemore habemus offendit te eum. Te vel case paulo volutpat, ad nullam nostrum consectetuer vis, nusquam fuisset principes pro no.' +
                                          '\n',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Color(0xFF707070),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Center(
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: new TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Account Name: ' + snapshot.data['AccountName'] + '\n',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Color(0xFF2B2B2B),
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Bank Account Number: ' + snapshot.data['BankAccountNumber'] + '\n',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Color(0xFF2B2B2B),
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Bank Name: ' + snapshot.data['BankName'] + '\n',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Color(0xFF2B2B2B),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(height: 40.0),
                ],
              ),
            ),
          );
        });
  }
}
