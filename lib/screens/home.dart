import 'package:flutter/material.dart';
import 'first.dart';
import 'floatmap.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController controller;

  
  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = TabController(length: 2, vsync: this);
  }

   @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  opendifferent() {
    debugPrint('needs to got to map');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        // Add tabs as widgets
        children: <Widget>[
          first(),
        ],
        // set the controller
        controller: controller,
      ),
      floatingActionButton: mapbutton(
        onPressed: opendifferent(),
      ),
      bottomNavigationBar: Material(
        // set the color of the bottom navigation bar
        color: Colors.blue,
        // set the tab bar as the child of bottom navigation bar
        child: TabBar(
          tabs: <Tab>[
            Tab(
              // set icon to the tab
              icon: Icon(Icons.favorite),
            ),
            Tab(
              icon: Icon(Icons.adb),
            ),
            Tab(
              icon: Icon(Icons.airport_shuttle),
            ),
          ],
          // setup the controller
          controller: controller,
        ),
      ),
    );
  }
}
