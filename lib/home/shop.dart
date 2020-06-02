import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/shape/gf_avatar_shape.dart';
import 'package:homepage/itempage/item_page.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:getflutter/getflutter.dart';

class Shop extends StatefulWidget {
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  int _qty_counter=1;
  List movies = [
    "The Avengers",
    "Shawshank Redemption",
    "Lord of the Rings",
    "Forrest Gump",
    "Batman Trilogy",
    "Spiderman",
    "John Wick",
    "Star Wars",
    "Iroman",
    "The Incredible Hulk"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

//        body: ListView.builder(
//            itemCount: movies.length,
//            itemBuilder: (BuildContext context, int index) {
//              return Container(
//                height: 100,
//                width: 100,
//                child: Card(
//                  elevation: 4.5,
//                  color: Colors.white,
//                  child: ListTile(
//                    leading: GFAvatar(
//                      backgroundImage: NetworkImage('https://images.app.goo.gl/4L754EXwppGk6jJ56'),
//                      shape: GFAvatarShape.standard,
//                    ),
//                    title: Text(
//                      movies[index],
//                      style: TextStyle(color: Colors.black),
//                    ),
//                    subtitle: Text("This is a movie"),
//                    onTap: () {
//                      debugPrint("${movies[index]}");
//                    },
//                  ),
//                ),
//              );
//            })

      body: GridView.builder(
        itemCount: movies.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.8),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ItemPage(
                      )));
            },
            child: Container(
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.black26)]),
              height: 50,
              width: 50,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
                      height: 120,
                      width: 170,
                      child: Image.asset(
                        'images/pill.png',
                        fit: BoxFit.cover,
                      ),
                      color: Colors.white),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Paracetamol',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Rs. 300',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 35,
                    width: 120,
                    child: RaisedButton(
                      elevation: 4.0,
                      color: Colors.green.shade500,
                      textColor: Colors.black,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return AlertDialog(
                                  title: Text("Paracetamol"),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
                                        height: 120,
                                        width: 170,
                                        child: Image.asset(
                                          'images/pill.png',
                                          fit: BoxFit.cover,
                                        ),
                                        color: Colors.white,
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
                                              width: 40,
                                              height: 30,
                                              margin: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(7),
                                                  color: Colors.green.shade900
                                                      .withOpacity(0.1)
                                              ),
                                              child: Center(
                                                  child: Text(
                                                    "-",
                                                    style: TextStyle(
                                                        color: Colors.green.shade700,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 18),
                                                  )),
                                            ),
                                          ),
                                          Text(
                                            "$_qty_counter",
                                            style: TextStyle(
                                              // color: Colors.green.shade700,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
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
                                              width: 40,
                                              height: 30,
                                              margin: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  color: Colors.green.shade900
                                                      .withOpacity(0.1),
                                                  borderRadius: BorderRadius.circular(7)),
                                              child: Center(
                                                  child: Text(
                                                    "+",
                                                    style: TextStyle(
                                                        color: Colors.green.shade700,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 18),
                                                  )),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(children: [
                                        Text("Final Price: ${_qty_counter*300}", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),)
                                      ],)
                                    ],
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: InkWell(
                                        child: Container(
                                          // width: 70,
                                          // height: 30,
                                          margin: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: Colors.green.shade900
                                                  .withOpacity(0.1),
                                              borderRadius: BorderRadius.circular(7)),
                                          child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Cancel",
                                                  style: TextStyle(
                                                    color: Colors.green.shade700,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              )),
                                        ),
                                      ),
                                    ),FlatButton(
                                      onPressed: (){},
                                      child: Container(
                                        // width: 100,
                                        // height: 30,
                                        margin: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.green.shade900
                                                .withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(7)),
                                        child: Center(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                "Add to Cart",
                                                style: TextStyle(
                                                  color: Colors.green.shade700,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )),
                                      ),
                                    ),
                                  ],

                                );
                              },
                            );
                          },
                        );

                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      child: Center(child: Text("Add to Cart", style: TextStyle(color: Colors.white),)),
                    ),
                  )
//                  Row(
//                    children: <Widget>[
//                      Text("Na")
//                    ],
//                  )
                ],
              ),
            ),
          );
//          return Card(
//            elevation: 2.0,
//            margin: EdgeInsets.all(8.0),
//            color: Colors.blue,
//            child: Container(
//              color: Colors.blue,
//              child: ListTile(
//                leading: GFAvatar(
//                  backgroundImage: AssetImage('images/pill.jpg',),
//                ),
//                onTap: () {
//                  debugPrint("Hello");
//                },
//              ),
//            ),
//          );
        },
      ),
    );
  }
}
