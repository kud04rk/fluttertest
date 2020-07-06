import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';


class ArbitrarySuggestionType {
  //For the mock data type we will use review (perhaps this could represent a restaurant);
  num stars;
  String name, imgURL;
  int color;

  ArbitrarySuggestionType(this.stars, this.name, this.imgURL,this.color);
}

class SecondPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<ArbitrarySuggestionType> suggestions = [
    new ArbitrarySuggestionType(4.7, "Minamishima",
        "https://media-cdn.tripadvisor.com/media/photo-p/0f/25/de/0c/photo1jpg.jpg",0xFFB74093),
    
  ];

  GlobalKey key =
      new GlobalKey<AutoCompleteTextFieldState<ArbitrarySuggestionType>>();

  AutoCompleteTextField<ArbitrarySuggestionType> textField;

  ArbitrarySuggestionType selected;

  _SecondPageState() {
    textField = new AutoCompleteTextField<ArbitrarySuggestionType>(
      decoration: new InputDecoration(
          hintText: "Search Resturant:", suffixIcon: new Icon(Icons.search)),
      itemSubmitted: (item) => setState(() => selected = item),
      key: key,
      suggestions: suggestions,
      itemBuilder: (context, suggestion) => new Padding(
          child: new ListTile(
              title: new Text(suggestion.name,style: new TextStyle(
                                fontSize: 17.0,
                                color: Color(suggestion.color),
                              ),),
              trailing: new Text("Stars: ${suggestion.stars}")),
          padding: EdgeInsets.all(8.0)),
      itemSorter: (a, b) => a.stars == b.stars ? 0 : a.stars > b.stars ? -1 : 1,
      itemFilter: (suggestion, input) =>
          suggestion.name.toLowerCase().startsWith(input.toLowerCase()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        title: new Text('AutoComplete TextField Demo Complex'),
      ),
      body: new Column(children: [
        new Padding(
            child: new Container(child: textField),
            padding: EdgeInsets.all(16.0)),
        new Padding(
            padding: EdgeInsets.fromLTRB(0.0, 64.0, 0.0, 0.0),
            child: new Card(
                child: selected != null
                    ? new Column(children: [
                        new ListTile(
                            title: new Text(selected.name),
                            trailing: new Text("Rating: ${selected.stars}/5")),
                        new Container(
                            child: new Image(
                                image: new NetworkImage(selected.imgURL)),
                            width: 400.0,
                            height: 300.0)
                      ])
                    : new Icon(Icons.cancel))),
      ]),
    );
  }
}