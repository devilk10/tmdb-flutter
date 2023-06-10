import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'features/home/ui/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blueAccent),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
