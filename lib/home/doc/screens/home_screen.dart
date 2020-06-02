import 'package:flutter/material.dart';
import 'package:homepage/home/doc/widgets/category_selector.dart';
import 'package:homepage/home/doc//widgets/favorite_contacts.dart';
import 'package:homepage/home/doc/widgets/recent_chats.dart';
import 'package:homepage/services/auth.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:homepage/home/Appts/start.dart';
import 'package:homepage/home/appbar/contact_us.dart';
import 'package:homepage/home/appbar/faq.dart';
import 'package:homepage/home/appbar/profile.dart';
import 'package:homepage/loading.dart';
import 'package:homepage/services/auth.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:homepage/home/shop.dart';
import "package:homepage/home/alternative.dart";
import 'package:homepage/search.dart';
import 'package:homepage/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homepage/home/home.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: new ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('${HomePage.name}'),
              accountEmail: Text('${HomePage.email}'),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/bg.png"), fit: BoxFit.fill)),
              currentAccountPicture: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  backgroundImage: AssetImage("images/morty.png"),
                ),
              ),
            ),
            ListTile(
              onTap: () async {
                FirebaseUser user = await FirebaseAuth.instance.currentUser();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfilePage(
                        )));
              },
              title: Text(
                "Profile",
                style: TextStyle(fontSize: 14),
              ),
              leading: new Icon(
                MdiIcons.face,
                color: Colors.black,
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                "Appointments",
                style: TextStyle(fontSize: 14),
              ),
              leading: Icon(Icons.notifications, color: Colors.black),
            ),
            Divider(),
            ListTile(
              title: Text(
                "Your Orders",
                style: TextStyle(fontSize: 14),
              ),
              leading: new Icon(MdiIcons.truckDelivery, color: Colors.black),
            ),
            Divider(),
            ListTile(

              title: Text(
                "Settings",
                style: TextStyle(fontSize: 14),
              ),
              leading: Icon(Icons.settings, color: Colors.black),
            ),
            Divider(),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Faqs(
                        )));
              },
              title: Text(
                "Help",
                style: TextStyle(fontSize: 14),
              ),
              leading: Icon(Icons.help, color: Colors.black),
            ),
            Divider(),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ContactUs(
                        )));
              },
              title: Text(
                "Contact Us",
                style: TextStyle(fontSize: 14),
              ),
              leading: new Icon(
                MdiIcons.faceAgent,
                color: Colors.black,
              ),
            ),
            Divider(),
            ListTile(
              onTap: () async {
                await _auth.signOut();
              },
              title: Text(
                "Sign Out",
                style: TextStyle(fontSize: 14),
              ),
              leading: new Icon(
                MdiIcons.logout,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          'Chats',
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 30.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          CategorySelector(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  FavoriteContacts(),
                  RecentChats(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
