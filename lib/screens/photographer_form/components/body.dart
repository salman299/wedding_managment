import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedding_management/components/form_action_buttons.dart';
import 'package:wedding_management/providers/photographer_form_provider.dart';
import 'package:wedding_management/screens/photographer_form/components/select_photographer_card.dart';
import 'package:wedding_management/services/photographer_service.dart';
import './photographer_form_fields.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _activeStepIndex = 0;
  bool isLoading = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController photographerId = TextEditingController(text: '');
  TextEditingController noOfPhotographers = TextEditingController(text: '');
  TextEditingController contactNo = TextEditingController(text: '');
  TextEditingController hours = TextEditingController(text: '');
  TextEditingController otherDetails = TextEditingController(text: '');
  TextEditingController title = TextEditingController(text: '');
  TextEditingController image = TextEditingController(text: '');
  TextEditingController price = TextEditingController(text: '');

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
        'photographerId': photographerId.text,
        'noOfPhotographers': noOfPhotographers.text,
        'hours': hours.text,
        'contactNo': contactNo.text,
        'otherDetails': otherDetails.text,
        'title': title.text,
        'image': image.text,
        'price': price.text,
      };
      PhotographerService.setFormToLocalStorage(data);
      Navigator.of(context).pop();
    }
  }

  Future<void> getLocalData() async {
    Map<String, dynamic> data = await PhotographerService.getFormDataFromLocalData();
    photographerId.text = data['photographerId'] ?? '';
    noOfPhotographers.text = data['noOfPhotographers'] ?? '';
    hours.text= data['hours'] ?? '';
    contactNo.text = data['contactNo'] ?? '';
    otherDetails.text = data['otherDetails'] ?? '';
    title.text = data['title'] ?? '';
    image.text = data['image'] ?? '';
    price.text = data['price'] ?? '';
    Provider.of<PhotographerFormProvider>(context, listen: false)
        .setPhotographerId(photographerId.text);
  }

  List<Widget> stepList() => [
        SelectPhotographerGrid(photographerId: photographerId, image: image,price: price, title: title,),
        PhotographerFormFields(
          formKey: _formKey,
          hours: hours,
          noOfPhotographers: noOfPhotographers,
          contactNo: contactNo,
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
