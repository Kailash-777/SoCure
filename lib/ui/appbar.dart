import 'package:flutter/material.dart';
import 'package:homepage/home/home.dart';
import 'package:homepage/ui/search_bar.dart';

Widget appBar(
    BuildContext context, _selectedPage, _appBarColor, String _titleText) {
  return AppBar(
      backgroundColor: _appBarColor,
      title: Text(_titleText),
      centerTitle: true,
      automaticallyImplyLeading: true,
      leading: GestureDetector(
        child: Icon(Icons.arrow_back),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        setSearch(context, _selectedPage),
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: Icon(Icons.shopping_cart),
        ),
      ]);
}
