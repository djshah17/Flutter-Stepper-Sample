import 'package:flutter/material.dart';

class Personal extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PersonalState();
  }
}

class PersonalState extends State<Personal> {
  static final formKey = GlobalKey<FormState>();
  static TextEditingController controllerFirstName = new TextEditingController();
  static TextEditingController controllerLastName = new TextEditingController();
  static TextEditingController controllerDateOfBirth = new TextEditingController();
  static TextEditingController controllerGender = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Form(
      key: formKey,
      autovalidate: false,
      child: Column(
        children: <Widget>[
          TextFormField(
            maxLines: 1,
            controller: controllerFirstName,
            decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.person,
                color: Colors.grey,
              ),
              hintText: 'First Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
            validator: (value) {
              if (value.trim().isEmpty) {
                return "First Name is Required";
              }
            },
          ),
          SizedBox(height: 20),
          TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                hintText: 'Last Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              validator: (value) {
                if (value.trim().isEmpty) {
                  return "Last Name is Required";
                }
              },
              controller: controllerLastName),
          SizedBox(height: 20),
          TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.calendar_today,
                  color: Colors.grey,
                ),
                hintText: 'Date of Birth',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              controller: controllerDateOfBirth),
          SizedBox(height: 20),
          TextFormField(
              maxLines: 1,
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                hintText: 'Gender',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
              ),
              controller: controllerGender),
        ],
      ),
    ));
  }

}
