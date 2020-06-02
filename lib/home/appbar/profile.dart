import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:homepage/ui/appbar.dart';
import 'package:homepage/ui/drawer__class.dart';

// void main() => runApp(MaterialApp(
//   home: ProfileApp(),
// ));
class ProfilePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    int _selectedPage = 0;
     var _appBarColor = Colors.green.shade500;
    return Scaffold(
      appBar: appBar(context, _selectedPage, _appBarColor, "Profile"),
      drawer: drawerClass(context),
        body: SingleChildScrollView(
                  child: Column(
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.greenAccent,Colors.green],
                        )
                    ),
                    child: Container(
                        width: double.infinity,
                        height: 350.0,
                        child: Center(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        'https://picsum.photos/170/'
                                    ),
                                    radius: 150,

                                  ),
                                            ],
                                          )
                                      )
                                  )
                ),
                
                                    new ListTile(
                                    leading: const Icon(Icons.person),
                                     title: new TextField(
                                      decoration: new InputDecoration(
                                        hintText: "Name",
                                    ),
                             ),
                        ),
                                    new ListTile(
                                      leading: const Icon(Icons.add_location),
                                     title: new TextField(
                                          decoration: new InputDecoration(
                                                  hintText: "Address",
                                     ),
                                     ),),
                                     new ListTile(
                                     leading: const Icon(Icons.email),
                                        title: new TextField(
                                          decoration: new InputDecoration(
                                                hintText: "Email",
                                       ),
                            ),
                        )
                                ,Container(width: 150,
                                  child: RaisedButton(elevation: 4.0,
                                  
                      color: Colors.green.shade500,
                      textColor: Colors.black,shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      onPressed: () {  },
                      child: Center(child: Text("Save Changes", style: TextStyle(color: Colors.white),)),
                    ),
                                )])

                            )
        );
                      
    //               )
    //           )
    //         ]
    //     )
    // );
  }

}