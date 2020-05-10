import 'package:flutter/material.dart';

AppBar appbar = AppBar(
  title: Text('The-Chef'),
  backgroundColor: Colors.amberAccent,
  leading: Icon(Icons.menu),
  actions: <Widget>[
    Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          onTap: () {},
          child: Icon(
            Icons.search,
            size: 26.0,
          ),
        )),
    Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          onTap: () {},
          child: Icon(Icons.more_vert),
        )),
  ],
);