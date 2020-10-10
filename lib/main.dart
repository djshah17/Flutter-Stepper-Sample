import 'dart:collection';
import 'package:flutter/material.dart';
import 'contact.dart';
import 'personal.dart';
import 'upload.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FlutterStepperPage(title: 'Flutter Stepper Sample'),
    );
  }
}

class FlutterStepperPage extends StatefulWidget {
  FlutterStepperPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FlutterStepperPageState createState() => _FlutterStepperPageState();
}

class _FlutterStepperPageState extends State<FlutterStepperPage> {
  var currentStep = 0;

  @override
  Widget build(BuildContext context) {

    var mapData = HashMap<String, String>();
    mapData["first_name"] = PersonalState.controllerFirstName.text;
    mapData["last_name"] = PersonalState.controllerLastName.text;
    mapData["date_of_birth"] = PersonalState.controllerDateOfBirth.text;
    mapData["gender"] = PersonalState.controllerGender.text;
    mapData["email"] = ContactState.controllerEmail.text;
    mapData["address"] = ContactState.controllerAddress.text;
    mapData["mobile_no"] = ContactState.controllerMobileNo.text;

    List<Step> steps = [
      Step(
        title: Text('Personal'),
        content: Personal(),
        state: currentStep == 0 ? StepState.editing : StepState.indexed,
        isActive: true,
      ),
      Step(
        title: Text('Contact'),
        content: Contact(),
        state: currentStep == 1 ? StepState.editing : StepState.indexed,
        isActive: true,
      ),
      Step(
        title: Text('Upload'),
        content: Upload(mapData),
        state: StepState.complete,
        isActive: true,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Stepper(
          currentStep: this.currentStep,
          steps: steps,
          type: StepperType.horizontal,
          onStepTapped: (step) {
            setState(() {
              currentStep = step;
            });
          },
          onStepContinue: () {
            setState(() {
              if (currentStep < steps.length - 1) {
                if (currentStep == 0 &&
                    PersonalState.formKey.currentState.validate()) {
                  currentStep = currentStep + 1;
                } else if (currentStep == 1 &&
                    ContactState.formKey.currentState.validate()) {
                  currentStep = currentStep + 1;
                }
              } else {
                currentStep = 0;
              }
            });
          },
          onStepCancel: () {
            setState(() {
              if (currentStep > 0) {
                currentStep = currentStep - 1;
              } else {
                currentStep = 0;
              }
            });
          },
        ),
      ),
    );
  }
}
