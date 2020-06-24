import 'package:aplearn_group14/src/Models/user.dart';
import 'package:aplearn_group14/src/Views/aunthenicate/aunthenicate.dart';
import 'package:aplearn_group14/src/Views/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    
    // return either the Home or Authenticate widget
    if (user == null){
      return Authenticate();
    } else {
        return Home();
    }  
  }
}