import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/order.dart';
import 'package:flutter_complete_guide/widgets/drawer.dart';
import '/providers/cart.dart';
import '../widgets/cart_item.dart' as ci;
import 'package:provider/provider.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key key}) : super(key: key);
  static const routeName = '/card';
  @override
  Widget build(BuildContext context) {
    //  Here we getting the data from cart providerClass
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: Text('Your card screen')),
      body: Column(children: [
        Card(
          margin: EdgeInsets.all(15),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      // Here we calling the fn who return the totalAmount of the items that have selected for add to cart...
                      '\$${cart.totalAmount.floorToDouble()}',
                      style: TextStyle(color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  TextButton(
                      onPressed: () {
                        // Here we passing the value to orderprovider class method
                        Provider.of<Orders>(context, listen: false).addOrders(
                            cart.items.values.toList(), cart.totalAmount);
                        //  This fn will clear all the item from cartItem provider class....
                        cart.clearAllProduct();
                      },
                      child: Text(
                        'ORDER NOW',
                        style: TextStyle(color: Colors.black),
                      ))
                ]),
          ),
        ),
        // ! List view did not work under the column so we have to use any otherwidget....
        Expanded(
            child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context, index) => ci.CardItem(
                      cart.items.values.toList()[index].id,
                      cart.items.keys.toList()[index],
                      cart.items.values.toList()[index].price,
                      cart.items.values.toList()[index].quantity,
                      cart.items.values.toList()[index].title,
                    )))
      ]),
    );
  }
}
