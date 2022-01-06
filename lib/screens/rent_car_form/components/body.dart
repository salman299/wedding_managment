import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedding_management/components/form_action_buttons.dart';
import 'package:wedding_management/providers/cart_provider.dart';
import 'package:wedding_management/providers/rent_car_form_provider.dart';
import 'package:wedding_management/screens/rent_car_form/components/select_rent_car_grid.dart';
import 'package:wedding_management/services/rent_car_service.dart';
import './rent_car_form_fields.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _activeStepIndex = 0;
  bool isLoading = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController rentCarId = TextEditingController(text: '');
  TextEditingController days = TextEditingController(text: '');
  TextEditingController date = TextEditingController(text: '');
  TextEditingController address = TextEditingController(text: '');
  TextEditingController city = TextEditingController(text: '');
  TextEditingController contactNo = TextEditingController(text: '');
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
        'rentCarId': rentCarId.text,
        'days': days.text,
        'date': date.text,
        'address': address.text,
        'city': city.text,
        'contactNo': contactNo.text,
        'otherDetails': otherDetails.text,
        'title': title.text,
        'image': image.text,
        'price': price.text,
      };
      RentCarService.setFormToLocalStorage(data);
      Provider.of<CartProvider>(context, listen: false).addPackageCartItem(RentCarService.getCartItemFromData(data));
      Navigator.of(context).pop();
    }
  }

  Future<void> getLocalData() async {
    Map<String, dynamic> data = await RentCarService.getFormDataFromLocalData();
    rentCarId.text = data['rentCarId'] ?? '';
    days.text = data['days'] ?? '';
    date.text = data['date'] ?? '';
    address.text= data['address'] ?? '';
    city.text= data['city'] ?? '';
    contactNo.text= data['contactNo'] ?? '';
    otherDetails.text = data['otherDetails'] ?? '';
    title.text = data['title'] ?? '';
    image.text = data['image'] ?? '';
    price.text = data['price'] ?? '';
    Provider.of<RentCarFormProvider>(context, listen: false)
        .setRentCarId(rentCarId.text);
  }

  List<Widget> stepList() => [
        SelectRentCarGrid(rentCarId: rentCarId, image: image,price: price, title: title,),
        RentCarFormFields(
            formKey: _formKey, contactNo: contactNo, date: date, days: days, address: address, city: city, otherDetails: otherDetails)
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
