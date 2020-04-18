import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'dart:convert';

class details extends StatefulWidget {
  final String from;
  final String to;
  const details(this.from, this.to);

  @override
  _detailsState createState() => _detailsState();
}

class _detailsState extends State<details> {
  int current_step = 0;
  String distance = "";
  String switches = "";
  String time = "";
  String fare = "";
  List<Troute> _redroutes = List<Troute>();
  List<Troute> _blueroutes = List<Troute>();

  List<Step> my_steps = [
    Step(
        // Title of the Step
        title: Text("Step 1"),
        // Content, it can be any widget here. Using basic Text for this example
        content: Text("Hello!"),
        isActive: true),
    Step(
        title: Text("Step 2"),
        content: Text("World!"),
        // You can change the style of the step icon i.e number, editing, etc.
        state: StepState.editing,
        isActive: true),
    Step(title: Text("Step 3"), content: Text("Hello World!"), isActive: true),
  ];

  Future<List<Troute>> redline() async {
    String data = await rootBundle.loadString('assets/redline.json');
    var jsonData = json.decode(data);

    var routes = List<Troute>();

    for (var r in jsonData) {
      Troute tr = Troute(
          r["station"], r["distance"], r["time"], r["fare"], r["location"]);
      routes.add(tr);
     // print(r["distance"]);
    }
    //print(routes);

    return (routes);
  }
  Future<List<Troute>> blueline() async {
    String data = await rootBundle.loadString('assets/blueline.json');
    var jsonData = json.decode(data);

    var blueroutes = List<Troute>();

    for (var r in jsonData) {
      Troute tr = Troute(
          r["station"], r["distance"], r["time"], r["fare"], r["location"]);
      blueroutes.add(tr);
      print(r["distance"]);
    }
    //print(routes);

    return (blueroutes);
  }


  Future<List<Troute>> makeroute(red,blue) async {
   
   
    return (finalroute);
  }



  @override
  void initState() {
    redline().then((routes) {
      setState(() {
        _redroutes.addAll(routes);        
      });
    });
    blueline().then((blueroutes) {
      setState(() {
        _blueroutes.addAll(blueroutes);        
      });
    });

    makeroute(_redroutes,_blueroutes) {
      setState(() {

      });
    }

    super.initState();
  }

  calculatedistance(String from, String to) {
    bool goin = false;
    double distance = 0.00;
    //print(_redroutes);
    //print(_blueroutes);

    for (var r in _redroutes) {
     // print(r.station);
     // print(from);
     // print(goin);
     // print(to);
      if (r.station == from || goin) {
        goin = true;
        distance = distance + r.distance;
        //print(distance);
        if (r.station == to) {
          goin = false;
        }
      }
    }
    return (Text(
      distance.floor().toString() + 'Km',
      style: new TextStyle(
          fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
    ));
  }

  calculatefare(String from, String to) {
    bool goin = false;
    int fare = 0;
    for (var r in _redroutes) {
      if (r.station == from || goin) {
        goin = true;
        fare = fare + r.fare;
        if (r.station == to) {
          goin = false;
        }
      }
    }
    return (Text(
      fare.floor().toString() + '₹',
      style: new TextStyle(
          fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
    ));
  }

  noofswitches(String from, String to) {
    bool goin = false;
    int distance = 0;
    for (var r in _redroutes) {
      if (r.station == from || goin) {
        goin = true;
        //distance=distance + r.distance;
        if (r.station == to) {
          goin = false;
        }
      }
    }
  }

  calculatetime(String from, String to) {
    bool goin = false;
    int time = 0;
    for (var r in _redroutes) {
      if (r.station == from || goin) {
        goin = true;
        time = time + r.time;
        if (r.station == to) {
          goin = false;
        }
      }
    }
    return (Text(
      time.floor().toString() + 'mins',
      style: new TextStyle(
          fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
    ));
  }

  noofstops(String from, String to) {
    bool goin = false;
    int stops = 0;
    for (var r in _redroutes) {
      if (r.station == from || goin) {
        goin = true;
        stops = stops + 1;
        if (r.station == to) {
          goin = false;
        }
      }
    }
    return (Text(
      stops.floor().toString(),
      style: new TextStyle(
          fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
    ));
  }

  test(int a, int b) {
    int c = a + b;

    return (Text(c.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details of the trip'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0.00, 16.0, 0.00, 10.00),
              child: Card(
                color: Colors.blue,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                          child: Padding(
                        padding: EdgeInsets.fromLTRB(6.00, 0.0, 5.00, 0.00),
                        child: Column(
                          children: <Widget>[
                            Container(
                                child:
                                    calculatedistance(widget.from, widget.to)),
                            Container(
                                child: Text(
                              "Distance",
                              style: new TextStyle(
                                fontSize: 17.0,
                                color: Colors.white70,
                              ),
                            ))
                          ],
                        ),
                      )),
                      Container(
                          child: Padding(
                        padding: EdgeInsets.fromLTRB(6.00, 0.0, 5.00, 0.00),
                        child: Column(
                          children: <Widget>[
                            Container(
                                child: calculatetime(widget.from, widget.to)),
                            Container(
                                child: Text(
                              "Time",
                              style: new TextStyle(
                                fontSize: 17.0,
                                color: Colors.white70,
                              ),
                            ))
                          ],
                        ),
                      )),
                      Container(
                          child: Padding(
                        padding: EdgeInsets.fromLTRB(6.00, 0.0, 5.00, 0.00),
                        child: Column(
                          children: <Widget>[
                            Container(child: noofstops(widget.from, widget.to)),
                            Container(
                                child: Text(
                              "Stops",
                              style: new TextStyle(
                                fontSize: 17.0,
                                color: Colors.white70,
                              ),
                            ))
                          ],
                        ),
                      )),
                      Container(
                          child: Padding(
                        padding: EdgeInsets.fromLTRB(6.00, 0.0, 5.00, 0.00),
                        child: Column(
                          children: <Widget>[
                            Container(
                                child: noofswitches(widget.from, widget.to)),
                            Container(
                                child: Text(
                              "Switches",
                              style: new TextStyle(
                                fontSize: 17.0,
                                color: Colors.white70,
                              ),
                            ))
                          ],
                        ),
                      )),
                      Container(
                          child: Padding(
                        padding: EdgeInsets.fromLTRB(6.00, 0.0, 5.00, 0.00),
                        child: Column(
                          children: <Widget>[
                            Container(
                                child: calculatefare(widget.from, widget.to)),
                            Container(
                                child: Text(
                              "Fare",
                              style: new TextStyle(
                                fontSize: 17.0,
                                color: Colors.white70,
                              ),
                            ))
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Stepper(
            // Using a variable here for handling the currentStep
            currentStep: this.current_step,
            // List the steps you would like to have
            steps: my_steps,
            // Define the type of Stepper style
            // StepperType.horizontal :  Horizontal Style
            // StepperType.vertical   :  Vertical Style
            type: StepperType.vertical,
            // Know the step that is tapped
            onStepTapped: (step) {
              // On hitting step itself, change the state and jump to that step
              setState(() {
                // update the variable handling the current step value
                // jump to the tapped step
                current_step = step;
              });
              // Log function call
              print("onStepTapped : " + step.toString());
            },
            onStepCancel: () {
              // On hitting cancel button, change the state
              setState(() {
                // update the variable handling the current step value
                // going back one step i.e subtracting 1, until its 0
                if (current_step > 0) {
                  current_step = current_step - 1;
                } else {
                  current_step = 0;
                }
              });
              // Log function call
              print("onStepCancel : " + current_step.toString());
            },
            // On hitting continue button, change the state
            onStepContinue: () {
              setState(() {
                // update the variable handling the current step value
                // going back one step i.e adding 1, until its the length of the step
                if (current_step < my_steps.length - 1) {
                  current_step = current_step + 1;
                } else {
                  current_step = 0;
                }
              });
              // Log function call
              print("onStepContinue : " + current_step.toString());
            },
          ),
        ],
      ),
    );
  }
}

class Troute {
  final String station;
  final double distance;
  final int time;
  final int fare;
  final String location;

  Troute(this.station, this.distance, this.time, this.fare, this.location);
}
