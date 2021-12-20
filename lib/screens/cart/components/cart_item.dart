import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedding_management/constants.dart';
import 'package:wedding_management/models/cart_item.dart';
import 'package:wedding_management/providers/cart_provider.dart';
import 'package:wedding_management/screens/dress_datail/components/quantity_change_tile.dart';
import 'package:wedding_management/size_config.dart';

class CartItemTile extends StatefulWidget {
  final  CartItem cartItem;
  const CartItemTile({Key? key, required this.cartItem}) : super(key: key);

  @override
  State<CartItemTile> createState() => _CartItemTileState();
}

class _CartItemTileState extends State<CartItemTile> {
  double totalPrice=0;

  @override
  void initState() {
    totalPrice= widget.cartItem.price*widget.cartItem.quantity;
    // TODO: implement initState
    super.initState();
  }

  void onQuantityChange(value){
    Provider.of<CartProvider>(context, listen: false).updateQuantity(widget.cartItem.id, value);
    setState(() {
      totalPrice = widget.cartItem.price*value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10),vertical: getProportionateScreenHeight(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(23),
              child: Container(
                height: 120,
                color: Colors.black12,
                child: CachedNetworkImage(
                  imageUrl: widget.cartItem.image,
                  fit: BoxFit.contain,
                  placeholder: (context, url) => const Opacity(
                    child: Center(child: Icon(Icons.image)),
                    opacity: 0.5,
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.cartItem.title, style: TextStyle(fontSize: 18),),
                            Text('${widget.cartItem.size}', style: TextStyle(fontSize: 14, color: kTextLightColor),),
                            Text('${widget.cartItem.color}', style: TextStyle(fontSize: 14, color: kTextLightColor),),
                          ],
                        ),
                        Text('${totalPrice/1000}K', style: TextStyle(fontSize: 18),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        QuantityTile(onChange: onQuantityChange, initialValue: widget.cartItem.quantity,),
                        Container(
                          decoration: BoxDecoration(
                            color: kSecondaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            color: kPrimaryColor,
                              icon : Icon(Icons.delete_outline, color: Colors.black,), onPressed: (){  },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}
