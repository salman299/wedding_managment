import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedding_management/components/form_like_buttons.dart';
import 'package:wedding_management/components/gradient_button.dart';
import 'package:wedding_management/components/outline_button.dart';
import 'package:wedding_management/providers/banquet_form_provider.dart';
import 'package:wedding_management/screens/banquet_form/components/select_banquet.dart';
import 'package:wedding_management/screens/banquet_form/components/select_package.dart';
import 'package:wedding_management/services/banquet_service.dart';
import './banquet_form_fields.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _activeStepIndex = 0;
  bool isLoading = true;
  final _formKey = GlobalKey<FormState>();

  TextEditingController banquetId = TextEditingController(text: '');
  TextEditingController packageId = TextEditingController(text: '');
  TextEditingController invitations = TextEditingController(text: '');
  TextEditingController date = TextEditingController(text: '');
  TextEditingController contactNo = TextEditingController(text: '');
  TextEditingController otherDetails = TextEditingController(text: '');
  TextEditingController banquetName = TextEditingController(text: '');
  TextEditingController packageName = TextEditingController(text: '');
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
        'banquetId': banquetId.text,
        'packageId': packageId.text,
        'invitations': invitations.text,
        'date': date.text,
        'contactNo': contactNo.text,
        'otherDetails': otherDetails.text,
        'banquetName': banquetName.text,
        'packageName': packageName.text,
        'image': image.text,
        'price': price.text,
      };
      BanquetService.setFormToLocalStorage(data);
      Navigator.of(context).pop();
    }
  }

  Future<void> getLocalData() async {
    Map<String, dynamic> data = await BanquetService.getFormDataFromLocalData();
    banquetId.text = data['banquetId'] ?? '';
    packageId.text = data['packageId'] ?? '';
    contactNo.text = data['contactNo'] ?? '';
    date.text = data['date'] ?? '';
    invitations.text = data['invitations'] ?? '';
    otherDetails.text = data['otherDetails'] ?? '';
    banquetName.text = data['banquetName'] ?? '';
    packageName.text = data['packageName'] ?? '';
    image.text = data['image'] ?? '';
    price.text = data['price'] ?? '';
    Provider.of<BanquetFormProvider>(context, listen: false)
        .setBanquetData(banquetId.text, packageId.text);
  }

  List<Widget> stepList() => [
        SelectBanquetGrid(selectedBanquet: banquetId, banquetName: banquetName, image: image,),
        SelectBanquetPackages(
          banquetId: banquetId.text,
          packageIdController: packageId,
          packageName: packageName,
          price: price,
        ),
        BanquetFormFields(
          formKey: _formKey,
          date: date,
          invitations: invitations,
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
        : Column(
            children: [
              // FormLikeActionButtons(onToggle: (){}),
              Expanded(
                child: IndexedStack(
                  index: _activeStepIndex,
                  children: stepList(),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    if (_activeStepIndex > 0)
                      Expanded(
                          child: CustomOutlineButton(
                              buttonText: 'Back', onPressed: _onStepCancel)),
                    if (_activeStepIndex > 0)
                      const SizedBox(
                        width: 10,
                      ),
                    Expanded(
                        child: GradientButton(
                            buttonText:
                                _activeStepIndex == stepList().length - 1
                                    ? 'Submit'
                                    : 'Next',
                            onPressed: _onStepContinue)),
                  ],
                ),
              ),
            ],
          );
  }
}
