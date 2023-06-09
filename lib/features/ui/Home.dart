// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TMDB app"),
        actions: [],
      ),
      body: Text("this is body"),
    );
  }
}
