import 'package:flutter/material.dart';

class blueline extends StatefulWidget {
  @override
  _bluelineState createState() => _bluelineState();
}

class _bluelineState extends State<blueline> {
  // init the step to 0th position
  int current_step = 0;
  List<Step> my_steps = [
    Step(
        title: Text("Nagole"),
        content: Text("Distance: 1.03km  Time: 2mins"),
        isActive: true),
    Step(
        title: Text("Uppal"),
        content: Text("Distance: 1.08km  Time: 2mins"),
        isActive: true),
    Step(
        title: Text("Stadium"),
        content: Text("Distance: 1.18km  Time: 2mins"),
        isActive: true),
    Step(
        title: Text("NGRI"),
        content: Text("Distance: 0.86km  Time: 2mins"),
        isActive: true),
    Step(
        title: Text("Habsiguda"),
        content: Text("Distance: 1.6km  Time: 3mins"),
        isActive: true),
    Step(
        title: Text("Tarnaka"),
        content: Text("Distance: 1.25km  Time: 2mins"),
        isActive: true),
    Step(
        title: Text("Mettuguda"),
        content: Text("Distance: 1.86km  Time: 4mins"),
        isActive: true),
    Step(
        title: Text("Secunderabad ( E )"),
        content: Text("Distance: 1.58km  Time: 3mins"),
        isActive: true),
    Step(
        title: Text("Parade Grounds"),
        content: Text("Distance: 1.19km  Time: 2mins"),
        isActive: true),
    Step(
        title: Text("Paradise"),
        content: Text("Distance: 1.05km  Time: 1mins"),
        isActive: true),
    Step(
        title: Text("Rasoolpura"),
        content: Text("Distance: 1.14km  Time: 2mins"),
        isActive: true),
    Step(
        title: Text("Prakash Nagar"),
        content: Text("Distance: 1.42km  Time: 2mins"),
        isActive: true),
    Step(
        title: Text("Begumpet"),
        content: Text("Distance: 1.57km  Time: 4mins"),
        isActive: true),
    Step(
        title: Text("Ameerpet"),
        content: Text("Distance: 0.71km  Time: 2mins"),
        isActive: true),
    Step(
        title: Text("Madhura Nagar"),
        content: Text("Distance: 1.39km  Time: 3mins"),
        isActive: true),
    Step(
        title: Text("Yusufguda"),
        content: Text("Distance: 0.85km  Time: 2mins"),
        isActive: true),
    Step(
        title: Text("Road No 5 Jubilee Hills"),
        content: Text("Distance: 1.4km  Time: 3mins"),
        isActive: true),
    Step(
        title: Text("Jubilee Hills Check Post"),
        content: Text("Distance: 0.97km  Time: 2mins"),
        isActive: true),
    Step(
        title: Text("Pedamma Temple"),
        content: Text("Distance: 1.47km  Time: 3mins"),
        isActive: true),
    Step(
        title: Text("Madhapur"),
        content: Text("Distance: 1.7km  Time: 3mins"),
        isActive: true),
    Step(
        title: Text("Durgam Cheruvu"),
        content: Text("Distance: 0.83km  Time: 2mins"),
        isActive: true),
    Step(
        title: Text("HiTech City"),
        content: Text("Distance: 1.49km  Time: 2mins"),
        isActive: true),
    Step(title: Text("Raidurg"), content: Text("Last stop"), isActive: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Body
      body: Container(
          child: Stepper(
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
      )),
    );
  }
}
