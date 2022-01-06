import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wedding_management/models/order_item.dart';
import 'package:wedding_management/providers/auth_provider.dart';
import 'package:wedding_management/services/order_service.dart';

import 'order_item.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userId = Provider.of<Auth>(context, listen: false).userId;
    return FutureBuilder<List<OrderItem>>(
      future: OrderService.getUserOrders(userId),
      builder: (context, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index)=>OrderItemCard(item: snapshot.data![index],),
            padding: EdgeInsets.symmetric(horizontal: 10),
          ),
    );
  }
}
