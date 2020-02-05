import 'package:flutter/material.dart';
import 'package:test1/tabs/blue.dart';
import 'package:test1/tabs/green.dart';
import 'package:test1/tabs/red.dart';

import 'floatmap.dart';

class map extends StatefulWidget {
  @override
  _mapState createState() => _mapState();
}

class _mapState extends State<map> with SingleTickerProviderStateMixin {
  TabController controller;

  opendifferent() {
    debugPrint('needs to got to map');
  }

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  TabBar getTabBar() {
    return TabBar(
      tabs: <Tab>[
        Tab(
          // set icon to the tab
          child:Column(children: <Widget>[
            Icon(Icons.train, color: Colors.red),Text('Red Line' , style: TextStyle(fontWeight: FontWeight.bold))
          ],)),        
        Tab(
          child: Column(children: <Widget>[
            Icon(Icons.train, color: Colors.white),Text('Blue Line' , style: TextStyle(fontWeight: FontWeight.bold)) 
          ],)),   
       
        Tab(
          child:Column(children: <Widget>[
            Icon(Icons.train, color: Colors.green),Text('Green Line' , style: TextStyle(fontWeight: FontWeight.bold))
          ],)),  
        
      ],
      // setup the controller
      controller: controller,
    );
  }

  TabBarView getTabBarView(var tabs) {
    return TabBarView(
      // Add tabs as widgets
      children: tabs,
      // set the controller
      controller: controller,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // Title
          title: Text("Stations and Maps"),
          // Set the background color of the App Bar
          backgroundColor: Colors.blue,
          // Set the bottom property of the Appbar to include a Tab Bar
          bottom: getTabBar()),
      // Set the TabBar view as the body of the Scaffold
      body: getTabBarView(<Widget>[redline(), blueline(), greenline()]),
    );
  }
}
