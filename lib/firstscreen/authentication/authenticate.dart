import 'package:flutter/material.dart';
import 'package:homepage/firstscreen/login.dart';
import 'package:homepage/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:homepage/models/user.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MyApp(),
    );
  }
}
