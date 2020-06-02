import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:homepage/home/Appts/start.dart';
import 'package:homepage/services/auth.dart';
import 'package:homepage/ui/appbar.dart';
import 'package:homepage/ui/drawer__class.dart';
import 'package:homepage/ui/float_button.dart';
import 'package:homepage/ui/search_bar.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:homepage/home/shop.dart';
import "package:homepage/home/alternative.dart";
import 'package:homepage/home/home.dart';

import 'appbar/contact_us.dart';
import 'appbar/faq.dart';
import 'appbar/profile.dart';



class HomePharma extends StatefulWidget {
  @override
  _HomePharmaState createState() => _HomePharmaState();
}

class _HomePharmaState extends State<HomePharma> {
  final AuthService _auth = AuthService();

  int _selectedPage = 0;
  final List<Widget> _pageOptions = [Shop(), Start(), Alternative()];
  final List<Color> myColor = [Colors.green.shade500, Colors.green.shade600, Colors.green.shade700];
  var _appBarColor = Colors.green.shade500;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatButton(context, _selectedPage),
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
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
              onTap: () {
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
      appBar: AppBar(
          backgroundColor: _appBarColor,
          title: Text("SoCure"),
          centerTitle: true,
          automaticallyImplyLeading: true,
          actions: <Widget>[
            setSearch(context, _selectedPage),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Icon(Icons.shopping_cart),
            ),
          ]),
      body: _pageOptions[_selectedPage],
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
        hasNotch: true,
        // fabLocation: BubbleBottomBarFabLocation.center,//new
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
        ],
      ),

    );
  }
}
