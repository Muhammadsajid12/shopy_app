import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/cart.dart';
// import 'package:flutter_complete_guide/providers/product.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';
import '../screens/product_detail_screen.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  Here we getting the individual product  so we have to listen the individual Product not Products..🥱
    final product = Provider.of<Product>(context, listen: false);

    final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      //  Grid tile like listview and we getting the value by provider...🎆🎆
      child: GridTile(
        child: GestureDetector(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          onTap: () {
            // Here we passing the Id to prodDetailPage.....................🥱🥱
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
        ),
        header: Text(
          'Hot offer',
          style: TextStyle(color: Colors.blueGrey),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          //  Here im using cunsumer widget which is rerender the  IconButton not whole widget so this widget  use where data is update..😋😋
          leading: Consumer<Product>(
            builder: (ctx, product, child) => IconButton(
              icon: Icon(
                  // Here we accessing the  product class property favorite is ture or false and the base of value chaning the icon...
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                product.toggleFavoriteStatus();
              },
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              //  Here we adding the product to CartScreen by calling cartprovider class method addItem...
              cart.addItem(product.id, product.price, product.title);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Added  Item to Cart '),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(
                      label: 'UNDO',
                      onPressed: () {
                        // Here we listing the product.id =p1,p2,p3,p4
                        cart.removeSigleItem(product.id);
                      }),
                ),
              );
            },
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
