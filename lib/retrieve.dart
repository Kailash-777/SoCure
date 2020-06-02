import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homepage/firstscreen/login.dart';
import 'package:homepage/home/appbar/contact_us.dart';
import 'package:homepage/home/doc/home_doc.dart';
import 'package:homepage/home/home.dart';
import 'package:homepage/home/home_pharma.dart';
import 'package:homepage/services/auth.dart';

class Retrieve extends StatelessWidget {
  static String id;
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Firestore.instance.collection('user_details').document('${MyHomePage.uid}').snapshots(),
        // ignore: missing_return
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return Text("Loading");
          }
          List selection = [HomePage(),HomePharma(),Doctor()];
          int select  = 0;
          var userDocument = snapshot.data;
          HomePage.name = userDocument['name'];
          HomePage.email = userDocument['email'];
          HomePage.add = userDocument['add'];
          HomePage.choice = userDocument['choice'];

          if(HomePage.choice == 'Customer'){
            select = 0;
          }
          else if(HomePage.choice == 'Pharmacy'){
            select = 1;
          }
          else if(HomePage.choice == 'Doctor'){
            select = 2;
          }
          return selection[select];
        },
      ),
    );
  }
}



