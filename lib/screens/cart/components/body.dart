import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedding_management/components/gradient_button.dart';
import 'package:wedding_management/components/outline_button.dart';
import 'package:wedding_management/constants.dart';
import 'package:wedding_management/models/cart_item.dart';
import 'package:wedding_management/providers/auth_provider.dart';
import 'package:wedding_management/providers/cart_provider.dart';
import 'package:wedding_management/screens/banquet_form/banquet_form.dart';
import 'package:wedding_management/screens/cart/components/cart_item.dart';
import 'package:wedding_management/screens/cart/components/package_item_tile.dart';
import 'package:wedding_management/services/banquet_service.dart';
import 'package:wedding_management/services/card_service.dart';
import 'package:wedding_management/services/order_service.dart';
import 'package:wedding_management/screens/register/register.dart';

class CartData{
  final CartPackageItem? banquet;
  final Map<String, CartItem> products;

  CartData({ this.banquet, required this.products});
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  Future<void> checkout(context) async {
    final userId = await Provider.of<Auth>(context, listen: false).getCurrentUser();
    if (userId == null){
      Navigator.of(context).pushNamed(Register.routeName);
    }
    final products = Provider.of<CartProvider>(context, listen: false).items;
    final banquetData = await BanquetService.getFormDataFromLocalData();
    final cardData = await InvitationCardService.getFormDataFromLocalData();

    OrderService.placeOrder(userId!, products, banquetData, cardData);
  }

  Future<CartData> getCartData(context) async {
    final Map<String, CartItem> products =
        Provider.of<CartProvider>(context, listen: false).items;
    final banquet = await BanquetService.getCartItemFromLocalData();
    return CartData(
        banquet: banquet,
        products: products
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CartData>(
      future: getCartData(context),
      builder: (context, snapshot) {
        return snapshot.connectionState==ConnectionState.waiting ? const Center(child: CircularProgressIndicator(),) : Stack(
          children: [
            ListView(
              children: [
                if (snapshot.data!.banquet != null)
                  PackageItemTile(cartItem: snapshot.data!.banquet!, route: BanquetForm.routeName),
                const Divider(color: kTextLightColor,),
                ...snapshot.data!.products.entries.map((e) => Column(
                  children: [
                    CartItemTile(cartItem: e.value, ),
                    const Divider(color: kTextLightColor,)
                  ],
                )).toList(),
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
                        onPressed: () {},
                        isCircular: true,
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      flex: 3,
                      child: GradientButton(
                        buttonText: 'CHECKOUT',
                        onPressed: ()=>checkout(context),
                        isCircular: true,
                      ))
                ],
              ),
            ),
          ],
        );
      }
    );
  }
}
