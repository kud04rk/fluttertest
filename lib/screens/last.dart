import 'package:flutter/material.dart';

class last extends StatefulWidget {
  @override
  _lastState createState() => _lastState();
}

class _lastState extends State<last> {
      List<String> names = ['Alpha', 'Beta', 'Cupcake', 'Donut', 'Eclair',
    'Froyo', 'Ginger bread', 'Honey comb', 'Ice cream sandwich', 'Jelly bean',
    'Kitkat', 'Lollipop', 'Marshmallow', 'Nougat', 'Oreo', 'Pie'
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[
                AppBar(
                  title: Text('first trains'),
                ),
                ListView.builder(
                itemCount: names.length,
                itemBuilder: (BuildContext context, int position) {
                  var name = names[position];
                  return ListTile(title: Text(name));
                }),
              ],
            ),
          ),
          SizedBox(height: 100),
          Card(
            child: Column(
              children: <Widget>[
                AppBar(
                  title: Text('last trains')
                ),
                ListView.builder(
                itemCount: names.length,
                itemBuilder: (BuildContext context, int position) {
                  var name = names[position];
                  return ListTile(title: Text(name));
                }),                
              ],
            ),
          )
        ],
      )
    );
  }
}