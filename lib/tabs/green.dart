import 'package:flutter/material.dart';

class greenline extends StatefulWidget {
  @override
  _greenlineState createState() => _greenlineState();
}

class _greenlineState extends State<greenline> {
  // init the step to 0th position
  int current_step = 0;
  List<Step> my_steps = [
    Step(
        title: Text("Parade Grounds"),
        content: Text("Comming soon"),
        isActive: true),
    Step(
        title: Text("Secunderabad West"),
        content: Text("Comming soon"),
        isActive: true),
    Step(
        title: Text("Gandhi Hospital Musheerabad"),
        content: Text("Comming soon"),
        isActive: true),
    Step(
        title: Text("RTC Cross Roads"),
        content: Text("Comming soon"),
        isActive: true),
    Step(
        title: Text("Chikkadpally"),
        content: Text("Comming soon"),
        isActive: true),
    Step(
        title: Text("Narayanguda"),
        content: Text("Comming soon"),
        isActive: true),
    Step(
        title: Text("Sultan Bazar"),
        content: Text("Comming soon"),
        isActive: true),
    Step(
        title: Text("MG Bus Station"),
        content: Text("Comming soon"),
        isActive: true),
    Step(
        title: Text("Salarjung Museum"),
        content: Text("Comming soon"),
        isActive: true),
    Step(
        title: Text("Charminar"),
        content: Text("Comming soon"),
        isActive: true),
    Step(
        title: Text("Shalibanda"),
        content: Text("Comming soon"),
        isActive: true),
    Step(
        title: Text("Shamsher Gunj"),
        content: Text("Comming soon"),
        isActive: true),
    Step(
        title: Text("Jungametta"),
        content: Text("Comming soon"),
        isActive: true),
    Step(
        title: Text("Falaknuma"),
        content: Text("Comming soon"),
        isActive: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Body
      body: Theme(
        data: ThemeData(primaryColor: Colors.green),
        child: Container(
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
      ),
    );
  }
}
