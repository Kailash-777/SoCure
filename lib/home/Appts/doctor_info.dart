import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:homepage/services/auth.dart';
import 'package:homepage/home/shop.dart';
import 'package:homepage/home/alternative.dart';
import 'package:homepage/home/Appts/start.dart';
import 'package:homepage/search.dart';
class DoctorsInfo extends StatefulWidget {
  @override
  _DoctorsInfoState createState() => _DoctorsInfoState();
}

class _DoctorsInfoState extends State<DoctorsInfo> {
  @override
  int _selectedPage = 0;
  final AuthService _auth = AuthService();
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
              accountName: Text("Mr. Profesorson"),
              accountEmail: Text("Professorso@greendale.com"),
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
              title: Text(
                "Help",
                style: TextStyle(fontSize: 14),
              ),
              leading: Icon(Icons.help, color: Colors.black),
            ),
            Divider(),
            ListTile(
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
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
            color: Colors.black87
        ),
      ),

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




      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _pageOptions[_selectedPage],
              Row(
                children: <Widget>[
                  Image.asset("assets/doctor_pic2.png", height: 220),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 222,
                    height: 220,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Dr. Rahul Bose",
                          style: TextStyle(fontSize: 32),
                        ),
                        Text(
                          "Heart Specialist",
                          style: TextStyle(fontSize: 19, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: <Widget>[
                            IconTile(
                              backColor: Color(0xffFFECDD),
                              imgAssetPath: "assets/email.png",
                            ),
                            IconTile(
                              backColor: Color(0xffFEF2F0),
                              imgAssetPath: "assets/call.png",
                            ),
                            IconTile(
                              backColor: Color(0xffEBECEF),
                              imgAssetPath: "assets/video_call.png",
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 26,
              ),
              Text(
                "About",
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Dr. Rahul Bose is a cardiologist in Delhi & affiliated with multiple hospitals in the area.He received his medical degree from Duke University School of Medicine and has been in practice for more than 20 years. ",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Image.asset("assets/mappin.png"),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Address",
                                style: TextStyle(
                                    color: Colors.black87.withOpacity(0.7),
                                    fontSize: 20),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width - 268,
                                  child: Text(
                                    "House #2, Road #5, Green Road, Saket, Delhi, India.",
                                    style: TextStyle(color: Colors.grey),
                                  ))
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          Image.asset("assets/clock.png"),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Daily Practitioner",
                                style: TextStyle(
                                    color: Colors.black87.withOpacity(0.7),
                                    fontSize: 20),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width - 268,
                                  child: Text(
                                    '''Monday - Friday
Open till 7 Pm''',
                                    style: TextStyle(color: Colors.grey),
                                  ))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Image.asset(
                    "assets/map.png",
                    width: 180,
                  )
                ],
              ),
              Text(
                "Activity",
                style: TextStyle(
                    color: Color(0xff242424),
                    fontSize: 28,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 22,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 24,horizontal: 16),
                      decoration: BoxDecoration(
                          color: Color(0xffFBB97C),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Color(0xffFCCA9B),
                                  borderRadius: BorderRadius.circular(16)
                              ),
                              child: Image.asset("assets/list.png")),
                          SizedBox(
                            width: 16,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/2 - 130,
                            child: Text(
                              "List Of Schedule",
                              style: TextStyle(color: Colors.white,
                                  fontSize: 17),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 24,horizontal: 16),
                      decoration: BoxDecoration(
                          color: Color(0xffA5A5A5),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Color(0xffBBBBBB),
                                  borderRadius: BorderRadius.circular(16)
                              ),
                              child: Image.asset("assets/list.png")),
                          SizedBox(
                            width: 16,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width/2 - 130,
                            child: Text(
                              "Doctor's Daily Post",
                              style: TextStyle(color: Colors.white,
                                  fontSize: 17),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class IconTile extends StatelessWidget {
  final String imgAssetPath;
  final Color backColor;

  IconTile({this.imgAssetPath, this.backColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: backColor, borderRadius: BorderRadius.circular(15)),
        child: Image.asset(
          imgAssetPath,
          width: 20,
        ),
      ),
    );
  }
}