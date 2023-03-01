import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/drawer.dart';
import 'package:provider/provider.dart';
import '../providers/products_items.dart';
import '../widgets/user_product_Item.dart';
import '../screens/editProductScreen.dart';

class UserProduct extends StatelessWidget {
  static const routeName = '/user-products';

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('User Product'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routeName);
                // ...
              },
              icon: Icon(Icons.add))
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: productData.items.length,
          itemBuilder: (ctx, i) => UserProductItem(productData.items[i].title,
              productData.items[i].imageUrl, productData.items[i].id),
        ),
      ),
    );
  }
}
