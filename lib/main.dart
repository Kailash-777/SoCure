import 'package:flutter/material.dart';
import 'package:homepage/firstscreen/forgot.dart';
import 'package:homepage/firstscreen/login.dart';
import 'package:homepage/firstscreen/wrapper.dart';
import 'package:homepage/home/Appts/start.dart';
import 'package:homepage/home/home.dart';
import 'package:homepage/home/home_pharma.dart';
import 'package:homepage/retrieve.dart';
import 'package:homepage/services/auth.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        //home: Forgot(),
        home: Wrapper(),
        //home: Retrieve1(),
      ),
    );
  }
}
