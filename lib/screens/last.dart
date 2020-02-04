import 'package:flutter/material.dart';

class last extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
                child: Card(
              child: Column(
                children: <Widget>[
                  AppBar(
                    title: Text('first trains'),
                  ),
                  Text('from miyapur'),
                  Text('from lb nagar'),
                  Text('from hitech city'),
                  Text('forom nagole')
                ],
              ),
            )),
            SizedBox(height: 100),
            Container(
                child: Card(
              child: Column(
                children: <Widget>[
                  AppBar(
                    title: Text('last trains'),
                  ),
                  Text('from miyapur'),
                  Text('from lb nagar'),
                  Text('from hitech city'),
                  Text('forom nagole')
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
