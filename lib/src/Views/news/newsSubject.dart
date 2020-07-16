import 'package:aplearn_group14/src/Views/home/home.dart';
import 'package:aplearn_group14/src/Views/home/shared/page.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_container/responsive_container.dart';

class newsSubject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFFFDF2F0),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () async {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePageTwo()));
          },
        ),
      ),
      body: Container(
        decoration: new BoxDecoration(
          color: Color(0xffECF0F9),
        ),
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
        child: ResponsiveContainer(
          widthPercent: 100.0,
          heightPercent: 100.0,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.asset("assets/images/news/newsSubject.png", fit: BoxFit.cover),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                AutoSizeText(
                  'New Subject July 2020',
                  style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2B2B2B)),
                ),
                SizedBox(
                  height: 15,
                ),
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
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
