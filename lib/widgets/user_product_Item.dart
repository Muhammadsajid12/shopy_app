import 'package:flutter/material.dart';
import '../screens/editProductScreen.dart';
import '../providers/products_items.dart';
import 'package:provider/provider.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String imgurl;
  final String id;
  UserProductItem(this.title, this.imgurl, this.id);
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context, listen: false);

    return ListTile(
      title: Text(title),
      leading: CircleAvatar(backgroundImage: NetworkImage(imgurl)),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(EditProductScreen.routeName, arguments: id);
                },
                icon: Icon(Icons.edit),
                color: Theme.of(context).colorScheme.primary),
            IconButton(
              onPressed: () {
                print('>>>>>>>>>>>>>>>>>>>>>>>>>$id');
                products.deleteSignalProduct(id);
              },
              icon: Icon(Icons.delete),
              color: Theme.of(context).colorScheme.error,
            )
          ],
        ),
      ),
    );
  }
}
