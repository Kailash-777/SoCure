import 'package:flutter/material.dart';
import 'package:homepage/firstscreen/authentication/authenticate.dart';
import 'package:homepage/firstscreen/login.dart';
import 'package:homepage/home/home.dart';
import 'package:homepage/models/user.dart';
import 'package:homepage/retrieve.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);


    //return either authenticate or home
    if(user == null){
      return Authenticate();
    }
    else{
      MyHomePage.uid = user.uid;
      return Retrieve();
    }
  }
}
