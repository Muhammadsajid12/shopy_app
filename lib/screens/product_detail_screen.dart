import 'package:flutter/material.dart';
import '../providers/products_items.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String _title;
  // final double price;

  // ProductDetailScreen(this._title,);

  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    //  This product id come from porduct_gird_view screen By Nameroute.......
    final productId =
        ModalRoute.of(context).settings.arguments as String; // *is the id!
    // Here we getting provider class Products this will return whole class so we can access the class method and properties..🎈🎈
    final loadedProducts =
        //  This is th fn which filter the product on the Id bases...
        Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProducts.title),
      ),
      body: Container(
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(12),
            height: 110,
            child: Card(
              elevation: 12,
              child: ListTile(
                leading: Container(
                  height: 180,
                  child: Image(
                    image: NetworkImage(loadedProducts.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(loadedProducts.title),
                subtitle: Text('\$${loadedProducts.price}'),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
