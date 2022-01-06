import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedding_management/components/confirmation_card.dart';
import 'package:wedding_management/components/gradient_button.dart';
import 'package:wedding_management/components/outline_button.dart';
import 'package:wedding_management/constants.dart';
import 'package:wedding_management/models/cart_item.dart';
import 'package:wedding_management/models/order_item.dart';
import 'package:wedding_management/providers/auth_provider.dart';
import 'package:wedding_management/providers/cart_provider.dart';
import 'package:wedding_management/screens/banquet_form/banquet_form.dart';
import 'package:wedding_management/screens/cart/components/cart_item.dart';
import 'package:wedding_management/screens/cart/components/package_item_tile.dart';
import 'package:wedding_management/screens/invitation_card_form/invitation_card_form.dart';
import 'package:wedding_management/screens/photographer_form/invitation_card_form.dart';
import 'package:wedding_management/screens/rent_car_form/rent_car_form.dart';
import 'package:wedding_management/services/banquet_service.dart';
import 'package:wedding_management/services/card_service.dart';
import 'package:wedding_management/services/order_service.dart';
import 'package:wedding_management/screens/register/register.dart';
import 'package:wedding_management/services/photographer_service.dart';
import 'package:wedding_management/services/rent_car_service.dart';

class CartData {
  final CartPackageItem? banquet;
  final CartPackageItem? invitationCard;
  final CartPackageItem? photographer;
  final CartPackageItem? rentCar;
  final Map<String, CartItem> products;

  CartData(
      {this.banquet,
      required this.products,
      required this.invitationCard,
      required this.photographer,
      required this.rentCar});
}

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  final Map<String, List> packageField = {
    'banquet': [BanquetForm.routeName, 'banquet_data'],
    'invitation_card': [InvitationCardForm.routeName, 'invitation_card_data'],
    'photographer': [PhotographerForm.routeName, 'photographer_data'],
    'car': [RentCarForm.routeName, 'car_data'],
  };

  Future<void> checkout(context) async {
    final userId =
        await Provider.of<Auth>(context, listen: false).getCurrentUser();
    if (userId == null) {
      Navigator.of(context).pushNamed(Register.routeName);
    }
    final products = Provider.of<CartProvider>(context, listen: false).items;
    final banquetData = await BanquetService.getFormDataFromLocalData();
    final cardData = await InvitationCardService.getFormDataFromLocalData();
    final photographerData =
        await PhotographerService.getFormDataFromLocalData();
    final rentCarData = await RentCarService.getFormDataFromLocalData();

    final banquetJson = banquetData.isNotEmpty
        ? BanquetOrderItem.fromMap(banquetData, 'banquet').toJson()
        : {};
    final cardJson = cardData.isNotEmpty
        ? InvitationCardOrderItem.fromMap(cardData, 'card').toJson()
        : {};
    final photographerJson = photographerData.isNotEmpty
        ? PhotographerOrderItem.fromMap(photographerData, 'photographer')
            .toJson()
        : {};
    final carJson = rentCarData.isNotEmpty
        ? RentCarOrderItem.fromMap(rentCarData, 'rentCar').toJson()
        : {};

    OrderService.placeOrder(
        userId!, products, banquetJson, cardJson, photographerJson, carJson);
    showDialog(
        context: context,
        builder: (context) => ConfirmationCart(
              title: "CONGRATULATIONS",
              description: "Your Order has been Placed Successfully",
              buttonText: "Done",
            ));
  }

  void onPackageDelete(context, key, dataKey) {
    Provider.of<CartProvider>(context, listen: false).removePackageCartItem(key, dataKey);
  }

  void onProductDelete(context, key) {
    Provider.of<CartProvider>(context, listen: false).removeItem(key);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cartData, ch) {
      return Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(bottom: 200),
            children: [
              ...cartData.packageItems.entries
                  .map((e) => Column(
                        children: [
                          PackageItemTile(
                            cartItem: e.value,
                            route: packageField[e.value.id]![0],
                            onDelete: () => onPackageDelete(
                                context,
                                e.value.id,
                                packageField[e.value.id]![1]
                            ),
                          ),
                          const Divider(
                            color: kTextLightColor,
                          )
                        ],
                      ))
                  .toList(),
              ...cartData.items.entries
                  .map((e) => Column(
                        children: [
                          CartItemTile(
                            cartItem: e.value,
                            onDelete: ()=>onProductDelete(context,e.value.id),
                          ),
                          const Divider(
                            color: kTextLightColor,
                          )
                        ],
                      ))
                  .toList(),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: CustomOutlineButton(
                      buttonText: 'CLEAR',
                      onPressed: ()=> cartData.clear(),
                      isCircular: true,
                    )),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    flex: 3,
                    child: GradientButton(
                      buttonText: 'CHECKOUT',
                      onPressed: () => cartData.isPackageValid() ? checkout(context): {},
                      isCircular: true,
                    ))
              ],
            ),
          ),
        ],
      );
    });
  }
}
