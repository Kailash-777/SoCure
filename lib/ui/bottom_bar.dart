import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BubbleBarClass extends StatefulWidget {
  int _selectedPage;
  var _appBarColor;
  BubbleBarClass(this._selectedPage, this._appBarColor);
  @override
  _BubbleBarClassState createState() => _BubbleBarClassState();
}

class _BubbleBarClassState extends State<BubbleBarClass> {
  int _selectedPage;
  var _appBarColor;
  final List<Color> myColor = [Colors.green.shade500, Colors.green.shade600, Colors.green.shade700];
  @override
  Widget build(BuildContext context) {
    return BubbleBottomBar(
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
        ],
      );
  }
}