import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CardItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  CardItem(
    this.id,
    this.productId,
    this.price,
    this.quantity,
    this.title,
  );

  @override
  Widget build(BuildContext context) {
    // This card item use in cardScreen....
    return Dismissible(
      key: ValueKey(id),
      // This container show to baackground when we swip to delete the item...🎉🎉
      background: Container(
        color: Colors.red,
        child: Icon(
          Icons.delete_rounded,
          size: 40,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
      ),
      direction: DismissDirection.endToStart,
      // This fn excute when we dismiss the cardItem...🎇🎇
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Are You sure!'),
            content: Text('Do you want to delete item from cart?'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
                child: Text('NO'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
                child: Text('Yes'),
              )
            ],
          ),
        );
      },
      onDismissed: (direction) {
        // Here productId id p1,p2,p3,p4 which is save in productsprovider class List....✨✨✨
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },

      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
            padding: EdgeInsets.all(8),
            child: ListTile(
              leading: CircleAvatar(
                  child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: FittedBox(
                  child: Text(
                    '\$${price}',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              )),
              title: Text('${title}'),
              subtitle: Text(' Total : ${price * quantity}'),
              trailing: Text('$quantity X'),
            )),
      ),
    );
  }
}
