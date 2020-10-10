import 'package:flutter/material.dart';

class Contact extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ContactState();
  }

}

class ContactState extends State<Contact> {

  static final formKey = GlobalKey<FormState>();
  static TextEditingController controllerEmail = new TextEditingController();
  static TextEditingController controllerAddress = new TextEditingController();
  static TextEditingController controllerMobileNo = new TextEditingController();

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
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return "Email is Required";
                  }
                },
                controller: controllerEmail,
              ),
              SizedBox(height: 20),
              TextFormField(
                minLines: 5,
                maxLines: 7,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.home,
                    color: Colors.grey,
                  ),
                  hintText: 'Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                controller: controllerAddress,
              ),
              SizedBox(height: 20),
              TextFormField(
                maxLines: 1,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.phone,
                    color: Colors.grey,
                  ),
                  hintText: 'Mobile No',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return "Mobile No is Required";
                  }
                },
                controller: controllerMobileNo,
              ),
            ],
          ),
        )
    );
  }

}