import 'package:flutter/material.dart';

class first extends StatefulWidget {
  @override
  _firstState createState() => _firstState();
}

class _firstState extends State<first> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Hyd Metro'),
      ),
      body: Column(children: <Widget>[
        Container(
          margin: const EdgeInsets.all(10.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "From",
              hintStyle:
                  TextStyle(fontWeight: FontWeight.w300, color: Colors.blue),
              enabledBorder: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.blue)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: "To",
              hintStyle:
                  TextStyle(fontWeight: FontWeight.w300, color: Colors.blue),
              enabledBorder: new OutlineInputBorder(
                  borderSide: new BorderSide(color: Colors.blue)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 9,
        ),
        RaisedButton(
          onPressed: () {
            debugPrint('I am Awesome');
          },
          textColor: Colors.white,
          color: Colors.blueAccent,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.white,
          highlightColor: Colors.orangeAccent,
          elevation: 4.0,
          child: Text('Search Trains'),
          shape: const StadiumBorder(),
          splashColor: Colors.blueAccent,
        ),
      ]),
    ));
  }
}
