import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import '../../../size_config.dart';

class BanquetFormFields extends StatelessWidget {
  final formKey;
  final TextEditingController date,
      contactNo,
      invitations,
      otherDetails;
  BanquetFormFields({
    Key? key,
    required this.formKey,
    required this.date,
    required this.contactNo,
    required this.otherDetails,
    required this.invitations,
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
              TextFormField(
                controller: invitations,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(label: Text("Invitations"), hintText: "No of people"),
                    validator: (value){
                    if (value!.isEmpty ) {
                        return "Quantity is required";
                    } else if ( int.parse(value) > 400){
                       return "Minimum space is 400";
                    }
                },
              ),

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
                controller: otherDetails,
                decoration:
                    const InputDecoration(label: Text("Other Details"), hintText: "Email"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
