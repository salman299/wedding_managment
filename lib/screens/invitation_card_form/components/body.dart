import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedding_management/components/form_action_buttons.dart';
import 'package:wedding_management/components/gradient_button.dart';
import 'package:wedding_management/components/outline_button.dart';
import 'package:wedding_management/providers/banquet_form_provider.dart';
import 'package:wedding_management/providers/invitation_card_form_provider.dart';
import 'package:wedding_management/screens/banquet_form/components/select_banquet.dart';
import 'package:wedding_management/screens/banquet_form/components/select_package.dart';
import 'package:wedding_management/screens/invitation_card_form/components/select_invitation_card.dart';
import 'package:wedding_management/services/banquet_service.dart';
import 'package:wedding_management/services/card_service.dart';
import './invitation_card_form_fields.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _activeStepIndex = 0;
  bool isLoading = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController invitationCardId = TextEditingController(text: '');
  TextEditingController groomName = TextEditingController(text: '');
  TextEditingController brideName = TextEditingController(text: '');
  TextEditingController invitations = TextEditingController(text: '');
  TextEditingController contactNo = TextEditingController(text: '');
  TextEditingController address = TextEditingController(text: '');
  TextEditingController email = TextEditingController(text: '');
  TextEditingController otherDetails = TextEditingController(text: '');
  TextEditingController cardTitle = TextEditingController(text: '');
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
        'invitationCardId': invitationCardId.text,
        'groomName': groomName.text,
        'brideName': brideName.text,
        'invitations': invitations.text,
        'contactNo': contactNo.text,
        'address': address.text,
        'email': email.text,
        'otherDetails': otherDetails.text,
        'cardTitle': cardTitle.text,
        'image': image.text,
        'price': price.text,
      };
      InvitationCardService.setFormToLocalStorage(data);
      Navigator.of(context).pop();
    }
  }

  Future<void> getLocalData() async {
    Map<String, dynamic> data = await InvitationCardService.getFormDataFromLocalData();
    invitationCardId.text = data['invitationCardId'] ?? '';
    groomName.text = data['groomName'] ?? '';
    brideName.text = data['brideName'] ?? '';
    invitations.text = data['invitations'] ?? '';
    contactNo.text = data['contactNo'] ?? '';
    address.text = data['address'] ?? '';
    email.text = data['email'] ?? '';
    otherDetails.text = data['otherDetails'] ?? '';
    image.text = data['image'] ?? '';
    price.text = data['price'] ?? '';
    cardTitle.text = data['cardTitle'] ?? '';
    Provider.of<InvitationCardFormProvider>(context, listen: false)
        .setInvitationCardId(invitationCardId.text);
  }

  List<Widget> stepList() => [
        SelectInvitationCardGrid(invitationCardId: invitationCardId, image: image,price: price,cardTitle: cardTitle,),
        InvitationCardFormFields(
          formKey: _formKey,
          groomName: groomName,
          brideName: brideName,
          invitations: invitations,
          contactNo: contactNo,
          address: address,
          email: email,
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
