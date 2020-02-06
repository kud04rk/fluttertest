import 'package:flutter/material.dart';
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:localstorage/localstorage.dart';

class first extends StatefulWidget {
  @override
  _firstState createState() => _firstState();
}

class Route {
  String from;
  String to;

  Route({this.from, this.to});

  toJSONEncodable() {
    Map<String, dynamic> m = new Map();

    m['from'] = from;
    m['to'] = to;

    return m;
  }
}

class RouteList {
  List<Route> routes;

  RouteList() {
    routes = new List();
  }
  length() {
    return routes.length;
  }

  toJSONEncodable() {
    return routes.map((route) {
      return route.toJSONEncodable();
    }).toList();
  }
}

class _firstState extends State<first> {
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<String>> key2 = new GlobalKey();
  final LocalStorage storage = new LocalStorage('hydmetro');
  final RouteList list = new RouteList();
  String from = "";
  String to = "";
  String currentText = "";
  List<String> suggestions = [
    "Miyapur",
    "JNTU",
    "KPHB",
    "Kukatpally",
    "Balanagar",
    "Moosapet",
    "Bharath Nagar",
    "Erragadda",
    "ESI",
    "S R Nagar",
    "Ameerpet",
    "Panjagutta",
    "Irrumanzil",
    "Khairatabad",
    "Lakdikapul",
    "Assembly",
    "Nampally",
    "Gandhi Bhavan",
    "Osmania Medical College",
    "M G Bus station",
    "Malakpet",
    "New Market",
    "Mussarambagh",
    "Dilshuknagar",
    "Chaitanyapuri",
    "Victoria Memorial",
    "L B Nagar",
    "Nagole",
    "Uppal",
    "Stadium",
    "NGRI",
    "Habsiguda",
    "Tarnaka",
    "Mettuguda",
    "Secunderabad ( E )",
    "Parade Grounds",
    "Paradise",
    "Rasoolpura",
    "Prakash Nagar",
    "Begumpet",
    "Ameerpet",
    "Madhura Nagar",
    "Yusufguda",
    "Road No 5 Jubilee Hills",
    "Jubilee Hills Check Post",
    "Pedamma Temple",
    "Madhapur",
    "Durgam Cheruvu",
    "HiTech City",
    "Raidurg"
  ];

  @override
  void initState() {
    super.initState();

    var routes = storage.getItem('hydmetro');

    if (routes != null) {
      list.routes = List<Route>.from(
        (routes as List).map(
          (item) => Route(
            from: item['from'],
            to: item['to'],
          ),
        ),
      );
    }
  }

  _saveToStorage() {
    storage.setItem('hydmetro', list.toJSONEncodable());
  }

  _addItem(String start, String destination) {
    setState(() {
      final route = new Route(from: start, to: destination);
      list.routes.add(route);
      _saveToStorage();
    });
  }

  _clearStorage() async {
    await storage.clear();

    setState(() {
      list.routes = storage.getItem('hydmetro') ?? [];
    });
  }

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
          child: SimpleAutoCompleteTextField(
            key: key,
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
            controller: TextEditingController(text: ""),
            suggestions: suggestions,
            textChanged: (text) => currentText = text,
            clearOnSubmit: false,
            textSubmitted: (text) => setState(() {
              if (text != "") {
                from = text;
              }
            }),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: SimpleAutoCompleteTextField(
            key: key2,
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
            controller: TextEditingController(text: ""),
            suggestions: suggestions,
            textChanged: (text) => currentText = text,
            clearOnSubmit: false,
            textSubmitted: (text) => setState(() {
              if (text != "") {
                to = text;
              }
            }),
          ),
        ),
        SizedBox(
          height: 9,
        ),
        RaisedButton(
          onPressed: () {
            _addItem(from, to);
            Navigator.pushNamed(context, '/details');
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
        ListView.builder(
            itemCount: list.length(),
            itemBuilder: (BuildContext context, int position) {
              var item = list.routes[position];
              return Card(
                  margin: EdgeInsets.fromLTRB(8, 4, 8, 4),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.train),
                      Text(item.from),
                      SizedBox(
                        width: 9,
                      ),
                      Icon(Icons.arrow_forward),
                      SizedBox(
                        width: 9,
                      ),
                      Icon(Icons.train),
                      Text(item.to),
                    ],
                  ));
            })
      ]),
    ));
  }
}
