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
                    title: Text('First Trains'),
                  ),
                  Text('From Miyapur: 6:30 AM'),
                  Text('From LB nagar: 6:30AM'),
                  Text('From Raidurgam: 6:30AM'),
                  Text('From Nagole: 6:30AM')
                ],
              ),
            )),
            SizedBox(height: 100),
            Container(
                child: Card(
              child: Column(
                children: <Widget>[
                  AppBar(
                    title: Text('Last Trains'),
                  ),
                  Text('From Miyapur: 10:42 PM'),
                  Text('From LB nagar: 10:30 PM'),
                  Text('From Raidurgam: '),
                  Text('From Nagole: 10:30 PM'),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
