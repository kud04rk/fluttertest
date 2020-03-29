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
  List<Troute> redroutes = [];

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
    String data = await rootBundle.loadString('assets/data/crossword.json');
    var jsonData = json.decode(data);

    for (var r in jsonData) {
      Troute tr = Troute(
          r["station"], r["distance"], r["time"], r["fare"], r["location"]);
      redroutes.add(tr);
    }
  }

  calculatedistance(String from, String to) {
    bool goin=false;
    int distance =0;
       for (var r in redroutes) { 
         if (r.station==from||goin){
           goin=true;
           distance=distance + r.distance;
           if(r.station == to){
             goin=false;
           }
         }
       }
   
  }

  calculatefare(String from, String to) {
     bool goin=false;
    int fare =0;
       for (var r in redroutes) { 
         if (r.station==from||goin){
           goin=true;
           fare=fare + r.fare;
           if(r.station == to){
             goin=false;
           }
         }
       }
  }

  noofswitches(String from, String to) {
     bool goin=false;
    int distance =0;
       for (var r in redroutes) { 
         if (r.station==from||goin){
           goin=true;
           distance=distance + r.distance;
           if(r.station == to){
             goin=false;
           }
         }
       }
  }

  calculatetime(String from, String to) {
     bool goin=false;
    int time =0;
       for (var r in redroutes) { 
         if (r.station==from||goin){
           goin=true;
           time=time + r.time;
           if(r.station == to){
             goin=false;
           }
         }
       }
  }

  noofstops(String from, String to) {

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
            child: Card(
              color: Colors.blue,
              child: Row(
                children: <Widget>[
                  Container(
                    child: calculatedistance(widget.from, widget.to),
                  ),
                  Container(
                    child: calculatetime(widget.from, widget.to),
                  ),
                  Container(
                    child: noofstops(widget.from, widget.to),
                    ),
                  Container(
                    child: noofswitches(widget.from, widget.to),
                  )
                ],
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
  final int distance;
  final int time;
  final int fare;
  final String location;

  Troute(this.station, this.distance, this.time, this.fare, this.location);
}
