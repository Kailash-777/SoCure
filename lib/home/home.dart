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

class HomePage extends StatefulWidget {
  static String  name = '';
  static String email = '';
  static String add = '';
  static String choice = '';
  static String uid;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //var firestoreDb = Firestore.instance.collection("user_details").snapshots();
  String name = HomePage.name;
  String uid;
  String email = HomePage.email;
  int _selectedPage = 0;
  final AuthService _auth = AuthService();
  final FirebaseAuth _authenticate = FirebaseAuth.instance;
  getCurrentUser() async {
    final FirebaseUser user = await _authenticate.currentUser();
    uid = user.uid;
    return(uid);
  }

  final List<Widget> _pageOptions = [Shop(), Start(), Alternative()];
  final List<Color> myColor = [Colors.green.shade500, Colors.green.shade600, Colors.green.shade700];
  var _appBarColor = Colors.green.shade500;
  IconButton setSearch(_selectedPage){
    if(_selectedPage == 0){
      return (IconButton(icon: Icon(Icons.search), onPressed: () {
        showSearch(context: context, delegate: DataSearch(),);
      }));
    }
    else if(_selectedPage == 1 || _selectedPage == 2){
      return(IconButton(icon: Icon(Icons.search, color: myColor[_selectedPage])));
    }
  }
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
      appBar: new AppBar(
        backgroundColor: _appBarColor,
        title: Text("SoCure"),
        centerTitle: true,
        actions: <Widget>[
          setSearch(_selectedPage),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: _pageOptions[_selectedPage],
      // _pageOptions[_selectedPage] //_pageOptions[_selectedPage],
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        currentIndex: _selectedPage,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
            _appBarColor = myColor[_selectedPage];
          });
        },
        //fabLocation: BubbleBottomBarFabLocation.end, //new
        hasNotch: false, //new
        hasInk: true, //new, gives a cute ink effect
        inkColor: Colors.black12, //optional, uses theme color if not specified
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.green.shade500,
              icon: Icon(
                Icons.shop,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.shop,
                color: Colors.green.shade500,
              ),
              title: Text("Shop")),
          BubbleBottomBarItem(
              backgroundColor: Colors.green.shade600,
              icon: Icon(
                Icons.note_add,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.note_add,
                color: Colors.green.shade600,
              ),
              title: Text("Appointment")),
          BubbleBottomBarItem(
              backgroundColor: Colors.green.shade700,
              icon: Icon(
                MdiIcons.pill,
                color: Colors.black,
              ),
              activeIcon: Icon(
                MdiIcons.pill,
                color: Colors.green.shade700,
              ),
              title: Text("Alternative")),
          //BubbleBottomBarItem(backgroundColor: Colors.green, icon: Icon(Icons.menu, color: Colors.black,), activeIcon: Icon(Icons.menu, color: Colors.green,), title: Text("Menu"))
        ],
      ),

    );
  }
}

