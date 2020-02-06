import 'package:flutter/material.dart';
import 'package:test1/screens/details.dart';
import 'package:test1/screens/home.dart';
import 'package:test1/screens/map.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'test metro1',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Raleway'),
      home: Home(),
      routes: {        
        '/map': (context) => map(),
        '/details': (context) => details(),
      },     
    );
  }
}
