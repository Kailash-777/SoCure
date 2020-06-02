import 'package:flutter/material.dart';

import '../search.dart';


  IconButton setSearch(BuildContext context, _selectedPage){
  final List<Color> myColor = [Colors.green.shade500, Colors.green.shade600, Colors.green.shade700];
    if(_selectedPage == 0){
      return (IconButton(icon: Icon(Icons.search), onPressed: () {
        showSearch(context: context, delegate: DataSearch(),);
      }));
    }
    else if(_selectedPage == 1 || _selectedPage == 2){
      return(IconButton(icon: Icon(Icons.search, color: myColor[_selectedPage]), onPressed: null,));
    }
  }
