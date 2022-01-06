import 'package:flutter/material.dart';

import '../../../size_config.dart';

class PhotographerFormFields extends StatelessWidget {
  final formKey;
  final TextEditingController noOfPhotographers,
      hours,
      contactNo,
      otherDetails;
  PhotographerFormFields({
    Key? key,
    required this.formKey,
    required this.contactNo,
    required this.hours,
    required this.noOfPhotographers,
    required this.otherDetails,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20), vertical: getProportionateScreenHeight(10)),
          child: Wrap(
            runSpacing: 10,
            children: [
              TextFormField(
                controller: noOfPhotographers,
                keyboardType: TextInputType.number,
                decoration:
                const InputDecoration(label: Text("Photographers"), hintText: "Number of Photographers"),
                validator: (value){
                  if (value!.isEmpty) {
                    return "Please enter number of photographers";
                  }
                },
              ),
              TextFormField(
                controller: hours,
                keyboardType: TextInputType.number,
                decoration:
                const InputDecoration(label: Text("Hours"), hintText: "Number of Hours"),
                validator: (value){
                  if (value!.isEmpty) {
                    return "Please enter number of hours";
                  }
                },
              ),
              TextFormField(
                controller: contactNo,
                decoration:
                    const InputDecoration(label: Text("Contact No"), hintText: "Contact Number"),
                validator: (value){
                  if (value!.isEmpty) {
                    return "Contact number is required";
                  }
                },
              ),
              TextFormField(
                controller: otherDetails,
                decoration:
                    const InputDecoration(label: Text("Other Details"), hintText: "Other Details"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
