import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:homepage/ui/appbar.dart';
import 'package:homepage/ui/drawer__class.dart';

// void main() => runApp(MaterialApp(
//   home: ProfileApp(),
// ));
class ContactUs extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    int _selectedPage = 0;
     var _appBarColor = Colors.green.shade500;
    return Scaffold(
      appBar: appBar(context, _selectedPage, _appBarColor, "Contact Us"),
      drawer: drawerClass(context),
        body: SingleChildScrollView(
                  child: Column(
              children: <Widget>[                
                                    ListTile(
                                    leading: const Icon(Icons.person),
                                     title: Text("Team SoCure"),
                             ),
                        
                                    ListTile(
                                      leading: const Icon(Icons.add_location),
                                     title:  Text("Address to the SoCure Office"),
                                     ),
                                     ListTile(
                                     leading: const Icon(Icons.email),
                                        title: Text("socure2020@gmail.com"),
                            ),
                         ]))

                            );
        
                      
    //               )
    //           )
    //         ]
    //     )
    // );
  }

}