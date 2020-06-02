import 'package:flutter/material.dart';
import 'package:homepage/home/Appts/start.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nice_button/nice_button.dart';

import '../home/alternative.dart';
import '../home/shop.dart';
import '../search.dart';

class ItemPage extends StatefulWidget {
  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  int _selectedPage = 0;
  int _qty_counter = 1;
  final List<Widget> _pageOptions = [Shop(), Start(), Alternative()];
  final List<Color> myColor = [
    Colors.green.shade500,
    Colors.green.shade600,
    Colors.green.shade700
  ];
  var _appBarColor = Colors.green.shade500;

  IconButton setSearch(BuildContext context, _selectedPage) {
    if (_selectedPage == 0) {
      return (IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(
              context: context,
              delegate: DataSearch(),
            );
          }));
    } else if (_selectedPage == 1 || _selectedPage == 2) {
      return (IconButton(
          icon: Icon(Icons.search, color: myColor[_selectedPage])));
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
              )
            ],
          ),
        ),
        appBar: new AppBar(
          backgroundColor: _appBarColor,
          title: Text("SoCure"),
          centerTitle: true,
          actions: <Widget>[
            setSearch(context, _selectedPage),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Icon(Icons.shopping_cart),
            ),
          ],
        ),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: Colors.white,
            ),
            ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18),
                    child: Text("Item Name", style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10, left: 40.0, right: 40, bottom: 0),
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: NetworkImage("https://picsum.photos/200"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("MRP: ", style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                            ),),
                            Text("\u20B9 400", style: TextStyle(
                                color: Colors.grey, fontSize: 16, decoration: TextDecoration.lineThrough)),
                                Text("  \u20B9 300", style: TextStyle(
                                color: Colors.red.shade700, fontSize: 16))
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text("Qty:", style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                            )),
                            Text("", style: TextStyle(
                                color: Colors.black54,

                                fontSize: 18
                            )),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (_qty_counter > 1) {
                                    _qty_counter--;
                                  }
                                });
                              },
                              child: Container(
                                width: 60,
                                height: 40,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.green.shade900
                                        .withOpacity(0.1)
                                ),
                                child: Center(
                                  child: Icon(Icons.remove, color: Colors.green.shade700),
                                    // child: Text(
                                    //   "-",
                                    //   style: TextStyle(
                                    //       color: Colors.green.shade700,
                                    //       fontWeight: FontWeight.bold,
                                    //       fontSize: 30),
                                    // )
                                    ),
                              ),
                            ),
                            Text(
                              "$_qty_counter",
                              style: TextStyle(
                                  color: Colors.green.shade700,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (_qty_counter < 10) {
                                    _qty_counter++;
                                  }
                                });
                              },
                              child: Container(
                                width: 60,
                                height: 40,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.green.shade900
                                        .withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(7)),
                                child: Center(
                                  child: Icon(Icons.add, color: Colors.green.shade700)
                                    // child: Text(
                                    //   "+",
                                    //   style: TextStyle(
                                    //       color: Colors.green.shade700,
                                    //       fontWeight: FontWeight.bold,
                                    //       fontSize: 18),
                                    // )
                                    ),
                              ),
                            ),
                          ],
                        ),
                        Text("Final Price: ${_qty_counter*300}", style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600))
                      ],
                    ),
                  ),
                  Column(

                    children: [


                      NiceButton(onPressed: () {},
                        text: "Add to cart",
                        background: Colors.green.shade600,
                        width: 150,
                        elevation: 8.0,
                        radius: 52.0,),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: NiceButton(onPressed: () {},
                          text: "Buy Now!",
                          background: Colors.green.shade600,
                          width: 255,
                          elevation: 8.0,
                          radius: 52.0,),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      children: [
                        Text("Supplied by ", style: TextStyle(fontSize: 18),),
                        Text("ABC Pharma",
                            style: TextStyle(color: Colors.blue, fontSize: 18))
                      ],
                    ),
                  ),

                  Divider(thickness: 3),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("Constituents", style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600
                        ),),
                        Text.rich(TextSpan(
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w300),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "Lorem ipsum dolor sit amet, consectetur"
                                      " adipiscing elit, sed do eiusmod tempor incididunt ut l"
                                      "abore et dolore magna aliqua. Ut enim ad minim veniam, qui"
                                      "s nostrud exercitation ullamco laboris nisi ut aliquip ex "
                                      "ea commodo consequat. Duis aute irure dolor in reprehen"
                                      "derit in voluptate velit esse cillum dolore eu fugiat nu"
                                      "lla pariatur. Excepteur sint occaecat cupidatat non proi"
                                      "dent, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                  style: TextStyle(
                                      color: Colors.grey.shade600
                                  )
                              ),
                              TextSpan(
                                  text: "More...",
                                  style: TextStyle(color: Colors.indigoAccent))
                            ])),
                        RaisedButton(elevation: 3,
                            onPressed: () {Navigator.pop(context);},
                            child: Text(
                              "Go Back", style: TextStyle(color: Colors.white),),
                            color: Colors.green.shade600,
                        )
                      ],
                    ),
                  )

                ])
          ],
        )

    );
  }
}
