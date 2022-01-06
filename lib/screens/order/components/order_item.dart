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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: ListTile(
            title: Text('30,000 RS', style: TextStyle(fontWeight: FontWeight.w600),),
            subtitle: Text('12/11/2021'),
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
                  children: const [
                    Text('Packages', style: TextStyle(fontWeight: FontWeight.w600),),
                    Text('5000', style: TextStyle(fontWeight: FontWeight.w600),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('- Banquet'),
                    Text(widget.item.banquet!.price.toString()),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('- Invitation Card'),
                    Text(widget.item.invitationCard!.price.toString()),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('- Rent A Car'),
                    Text(widget.item.rentCar!.price.toString()),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('- Photographer'),
                    Text(widget.item.photographer!.price.toString()),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Products', style: TextStyle(fontWeight: FontWeight.w600),),
                    Text('1000', style: TextStyle(fontWeight: FontWeight.w600),),
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
