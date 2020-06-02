import 'dart:io';

import 'package:flutter/material.dart';

Widget FloatButton(BuildContext context, _selectedPage)  {
  // List<File> files = await FilePicker.getMultiFile(
  //         type: FileType.custom,
  //         allowedExtensions: ['jpg', 'pdf', 'png', 'jpeg'],
  //       );
  if (_selectedPage==0) {
    return FloatingActionButton(
        onPressed: (){
          showDialog(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return AlertDialog(
                                    title: Text("Add a Product"),
                                  content: Column(
                                 children: <Widget>[
                                   Text("Please fill out the Form to Add an Item."),
                                   Expanded(
                                       child: TextField(
                                         autofocus: true,
                                         autocorrect: true,
                                         decoration: InputDecoration(
                                             labelText: "Picture of the product*",

                                         ),
                                         

                                       )),
                                   Expanded(
                                       child: TextField(
                                         autofocus: true,
                                         autocorrect: true,
                                         decoration: InputDecoration(
                                             labelText: "Product Name*"
                                         ),
                                        //  controller: nameInputController,

                                       )),

                                   Expanded(
                                       child: TextField(
                                         autofocus: true,
                                         autocorrect: true,
                                         decoration: InputDecoration(
                                             labelText: "Product Price*"
                                         ),
                                        //  controller: titleInputController,

                                       )),

                                   Expanded(
                                       child: TextField(
                                         autofocus: true,
                                         autocorrect: true,
                                         decoration: InputDecoration(
                                             labelText: "Number of pieces Available*",

                                         ),
                                         

                                       )),


                                 ],
                              ),
                              actions: <Widget>[
                                FlatButton(onPressed: () {
                                  // nameInputController.clear();
                                  // titleInputController.clear();
                                  // descriptionInputController.clear();

                                  Navigator.pop(context);
                                } ,
                                    child: Text("Cancel")),

                                
                                  // if( titleInputController.text.isNotEmpty &&
                                  //     nameInputController.text.isNotEmpty &&
                                  //     descriptionInputController.text.isNotEmpty) {

                                  //   Firestore.instance.collection("board")
                                  //     .document(docId)
                                  //     .updateData({
                                  //     "name" : nameInputController.text,
                                  //     "title" : titleInputController.text,
                                  //     "description" : descriptionInputController.text,
                                  //     "timestamp" : new DateTime.now()
                                  //   }).then((response) {
                                  //      Navigator.pop(context);
                                  //   });

//                                    Firestore.instance.collection("board")
//                                        .add({
//                                      "name" : nameInputController.text,
//                                      "title" : titleInputController.text,
//                                      "description" : descriptionInputController.text,
//                                      "timestamp" : new DateTime.now()
//                                    }).then((response) {
//                                      print(response.documentID);
//                                      Navigator.pop(context);
//                                      nameInputController.clear();
//                                      titleInputController.clear();
//                                      descriptionInputController.clear();
//
//                                    }).catchError((error) => print(error));
FlatButton(onPressed: () {
                                  }
                                ,
                                    child: Text("Add"))
                              ]
                                );
                              },
                            );
                          },
                        );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      );

  }
}
