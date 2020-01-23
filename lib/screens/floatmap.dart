import 'package:flutter/material.dart';


class mapbutton extends StatelessWidget {
  mapbutton({@required this.onPressed});
  final GestureTapCallback onPressed;
   @override
  Widget build(BuildContext context) {
    return RaisedButton(          
          textColor: Colors.white,
          color: Colors.blue,
          disabledColor: Colors.grey,
          disabledTextColor: Colors.white,
          highlightColor: Colors.orangeAccent,
          elevation: 4.0,
          child: Row(
            children: <Widget>[
              Icon(Icons.map),
              Spacer(),
              Text('MAP')
            ],
          ),
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
          splashColor: Colors.blueAccent, onPressed: onPressed,
        );   
  }
}