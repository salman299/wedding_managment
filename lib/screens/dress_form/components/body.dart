import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedding_management/components/form_action_buttons.dart';
import 'package:wedding_management/providers/dress_form_provider.dart';
import 'package:wedding_management/screens/dress_form/components/select_dress_grid.dart';
import 'package:wedding_management/services/dress_service.dart';
import './dress_form_fields.dart';

class Body extends StatefulWidget {
  final bool isGroomDress;
  const Body({Key? key, required this.isGroomDress}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _activeStepIndex = 0;
  bool isLoading = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController dressId = TextEditingController(text: '');
  TextEditingController color = TextEditingController(text: '');
  TextEditingController size = TextEditingController(text: '');
  TextEditingController contactNo = TextEditingController(text: '');
  TextEditingController address = TextEditingController(text: '');
  TextEditingController otherDetails = TextEditingController(text: '');

  @override
  void initState() {
    // TODO: implement initState
    getLocalData().then((value) => setState(() {
          isLoading = false;
        }));
    super.initState();
  }

  void onSubmit() {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> data = {
        'dressId': dressId.text,
        'color': color.text,
        'size': size.text,
        'contactNo': contactNo.text,
        'address': address.text,
        'otherDetails': otherDetails.text,
      };
      DressService.setFormToLocalStorage(data, widget.isGroomDress);
      Navigator.of(context).pop();
    }
  }

  Future<void> getLocalData() async {
    Map<String, dynamic> data = await DressService.getFormDataFromLocalData(widget.isGroomDress);
    dressId.text = data['dressId'] ?? '';
    color.text = data['color'] ?? '';
    size.text = data['size'] ?? '';
    contactNo.text = data['contactNo'] ?? '';
    address.text = data['address'] ?? '';
    otherDetails.text = data['otherDetails'] ?? '';
    Provider.of<DressFormProvider>(context, listen: false)
        .setBridalDressId(dressId.text);
  }

  List<Widget> stepList() => [
        SelectDressGrid(dressId: dressId, isGroomDress: widget.isGroomDress,),
        DressFormFields(
          formKey: _formKey,
          color: color,
          size: size,
          contactNo: contactNo,
          address: address,
          otherDetails: otherDetails,
        ),
      ];

  void _onStepContinue() {
    if (_activeStepIndex == stepList().length - 1) {
      onSubmit();
    } else {
      setState(() {
        _activeStepIndex += 1;
      });
    }
  }

  void _onStepCancel() {
    setState(() {
      _activeStepIndex -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Stack(
            children: [
              IndexedStack(
                index: _activeStepIndex,
                children: stepList(),
              ),
              FormActionButtons(
                  onStepContinue: _onStepContinue,
                  onStepCancel: _onStepCancel,
                  activeIndex: _activeStepIndex,
                  totalItems: 2,
              )
            ],
    );
  }
}
