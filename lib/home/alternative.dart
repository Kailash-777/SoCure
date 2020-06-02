import "package:flutter/material.dart";

class Alternative extends StatefulWidget {
  @override
  _AlternativeState createState() => _AlternativeState();
}

class _AlternativeState extends State<Alternative> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 75,
                ),
                Text(
                  "Alternative Medicines",
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 80,
                ),
                Text(
                  "Upload your medical prescription",
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 35,
                  width: 135,
                  child: RaisedButton(
                    color: Colors.green.shade700,
                    textColor: Colors.black,
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23)),
                    child: Text(
                      "Upload",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Type in the medicine to be changed",
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 45,
                  width: MediaQuery.of(context).size.width*0.8,
                  child: TextField(
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black
                    ),
                    decoration: InputDecoration(
                        labelText: "Type Here ...",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: Colors.grey.shade700
                            )
                        )                  ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 50,
                  width: 150,
                  child: RaisedButton(
                    textColor: Colors.black,
                    elevation: 4.0,
                    color: Colors.green.shade700,
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23)),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
