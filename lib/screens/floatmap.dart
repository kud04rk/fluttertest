import 'package:flutter/material.dart';


class mapbutton extends StatelessWidget {
  mapbutton({@required this.onPressed});
  final GestureTapCallback onPressed;
   @override
  Widget build(BuildContext context) {
    return RawMaterialButton(         
          fillColor: Colors.blue,
          elevation: 4.0,
          splashColor: Colors.blueAccent,
          onPressed: onPressed,
          child: Row(
            mainAxisSize: MainAxisSize.min,            
            children: <Widget>[
              Icon(Icons.map),             
              Text('MAP')
            ],
          ),
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),         
        );   
  }
}