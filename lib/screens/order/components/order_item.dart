import 'package:flutter/material.dart';
import 'package:wedding_management/models/order_item.dart';

class OrderItemCard extends StatefulWidget {
  OrderItem item;
  OrderItemCard({Key? key, required this.item}) : super(key: key);

  @override
  State<OrderItemCard> createState() => _OrderItemCardState();
}

class _OrderItemCardState extends State<OrderItemCard> {
  bool isExpended = false;
  double productTotal = 0;
  double packageTotal = 0;
  double total = 0;

  @override
  void initState() {
    // TODO: implement initState
    productTotal = widget.item.getTotalProduct();
    packageTotal = widget.item.getTotalPackage();
    total = productTotal + packageTotal;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            title: Text(total.toString(), style: TextStyle(fontWeight: FontWeight.w600),),
            subtitle: Text(widget.item.date!),
            trailing: IconButton(
              icon: isExpended ? Icon(Icons.expand_less) : Icon(Icons.expand_more),
              onPressed: (){
                setState(() {
                  isExpended = !isExpended;
                });
              },
            ),
          ),
        ),
        if( isExpended )
        Card(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    const Text('Packages', style: TextStyle(fontWeight: FontWeight.w600),),
                    Text(packageTotal.toString(), style: TextStyle(fontWeight: FontWeight.w600),),
                  ],
                ),
                if (widget.item.banquet != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('- Banquet'),
                    Text(widget.item.banquet!.calculatedPrice!.toString()),
                  ],
                ),
                if (widget.item.invitationCard != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('- Invitation Card'),
                    Text(widget.item.invitationCard!.calculatedPrice!.toString()),
                  ],
                ),
                if (widget.item.rentCar != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('- Rent A Car'),
                    Text(widget.item.rentCar!.calculatedPrice!.toString()),
                  ],
                ),
                if (widget.item.photographer != null)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('- Photographer'),
                    Text(widget.item.photographer!.calculatedPrice!.toString()),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Products', style: TextStyle(fontWeight: FontWeight.w600),),
                    Text(productTotal.toString(), style: TextStyle(fontWeight: FontWeight.w600),),
                  ],
                ),
                ...widget.item.products.map((e) =>
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('- ${e.title}'),
                        Text(e.price.toString(),),
                      ],
                    ),
                ).toList(),
              ],
            ),
          ),
        )

      ],
    );
  }
}
