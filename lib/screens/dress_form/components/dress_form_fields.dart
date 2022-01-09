import 'package:flutter/material.dart';

import '../../../size_config.dart';

class DressFormFields extends StatelessWidget {
  final formKey;
  final TextEditingController size,
      color,
      contactNo,
      address,
      otherDetails;
  const DressFormFields({
    Key? key,
    required this.formKey,
    required this.color,
    required this.size,
    required this.contactNo,
    required this.address,
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
              DropdownButtonFormField<String>(
                value: 'One',
                onChanged: (String? newValue) {
                  size.text = newValue!;
                },
                items: <String>['One', 'Two', 'Free', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              TextFormField(
                controller: contactNo,
                decoration:
                    const InputDecoration(label: Text("Contact No"), hintText: "Email"),
                validator: (value){
                  if (value!.isEmpty) {
                    return "Contact number is required";
                  }
                },
              ),
              TextFormField(
                controller: address,
                decoration:
                    const InputDecoration(label: Text("Address"), hintText: "Email"),
                validator: (value){
                  if (value!.length < 10) {
                    return "Invalid Address";
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
