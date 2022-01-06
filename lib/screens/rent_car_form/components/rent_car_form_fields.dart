import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../size_config.dart';

class RentCarFormFields extends StatelessWidget {
  final formKey;
  final TextEditingController days,
      date,
      address,
      city,
      contactNo,
      otherDetails;
  RentCarFormFields({
    Key? key,
    required this.formKey,
    required this.contactNo,
    required this.date,
    required this.days,
    required this.address,
    required this.city,
    required this.otherDetails,
  }) : super(key: key);

  final format = DateFormat("yyyy-MM-dd HH:mm");


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
              DateTimeField(
                format: format,
                controller: date,
                decoration: const InputDecoration(label: Text("Date"), hintText: "Date"),
                onShowPicker: (context, currentValue) async {
                  final date = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2100));
                  if (date != null) {
                    final time = await showTimePicker(
                      context: context,
                      initialTime:
                      TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                    );
                    return DateTimeField.combine(date, time);
                  } else {
                    return currentValue;
                  }
                },
              ),
              TextFormField(
                controller: days,
                keyboardType: TextInputType.number,
                decoration:
                const InputDecoration(label: Text("Days"), hintText: "Days"),
                validator: (value){
                  if (value!.isEmpty) {
                    return "Please enter number of days";
                  }
                },
              ),
              TextFormField(
                controller: address,
                decoration:
                const InputDecoration(label: Text("Address"), hintText: "Address"),
                validator: (value){
                  if (value!.isEmpty) {
                    return "Please enter your address";
                  }
                },
              ),
              TextFormField(
                controller: city,
                decoration:
                const InputDecoration(label: Text("City"), hintText: "City"),
                validator: (value){
                  if (value!.isEmpty) {
                    return "Please enter city";
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
              const SizedBox(
                height: 300,
              )
            ],
          ),
        ),
      ),
    );
  }
}
