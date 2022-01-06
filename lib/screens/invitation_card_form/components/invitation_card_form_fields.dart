import 'package:flutter/material.dart';

import '../../../size_config.dart';

class InvitationCardFormFields extends StatelessWidget {
  final formKey;
  final TextEditingController groomName,
      brideName,
      invitations,
      contactNo,
      address,
      email,
      otherDetails;
  InvitationCardFormFields({
    Key? key,
    required this.formKey,
    required this.groomName,
    required this.brideName,
    required this.invitations,
    required this.contactNo,
    required this.address,
    required this.email,
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
                controller: groomName,
                decoration:
                    const InputDecoration(label: Text("Groom Name"), hintText: "Groom Name"),
                validator: (value){
                  if (value!.isEmpty) {
                    return "Groom Name is required";
                  }
                },
              ),
              TextFormField(
                controller: brideName,
                decoration:
                    const InputDecoration(label: Text("Bride Name"), hintText: "Bridal Name"),
                validator: (value){
                  if (value!.isEmpty) {
                    return "Bridal name is required";
                  }
                },
              ),
              TextFormField(
                controller: invitations,
                keyboardType: TextInputType.number,
                decoration:
                const InputDecoration(label: Text("Invitations"), hintText: "Invitations"),
                validator: (value){
                  if (value!.isEmpty) {
                    return "Please enter number of guest";
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
                controller: address,
                decoration:
                    const InputDecoration(label: Text("Address"), hintText: "Address"),
                validator: (value){
                  if (value!.length < 10) {
                    return "Invalid Address";
                  }
                },
              ),
              TextFormField(
                controller: email,
                decoration:
                    const InputDecoration(label: Text("Email"), hintText: "Email"),
                validator: (value){
                  if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!)) {
                    return "Email is non valid";
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
