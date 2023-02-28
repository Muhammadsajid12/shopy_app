import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/drawer.dart';
import '../providers/cart.dart';
import '../widgets/product_grid_view.dart';
import 'package:provider/provider.dart';
import '../widgets/badge.dart';
import '../screens/card_screen.dart';

// enum is special kind of class in which we store static key valuess.....
enum FilterOptions { Favorite, All }

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  // ask AB:
  var _showOnlyFavirot = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MyShops'), actions: [
        PopupMenuButton(
          // One thing
          onSelected: (FilterOptions selectedItem) {
            // Here is the filter logic...
            setState(() {
              if (selectedItem == FilterOptions.Favorite) {
                _showOnlyFavirot = true;
              } else {
                _showOnlyFavirot = false;
              }
            });
          },

          icon: Icon(Icons.more_vert),
          itemBuilder: (_) => [
            PopupMenuItem(
              child: Text('All Favorite'),
              value: FilterOptions.Favorite,
            ),
            PopupMenuItem(
              child: Text('All'),
              value: FilterOptions.All,
            )
          ],
        ),
        // This widget show the item add into card.......
        Consumer<Cart>(
          builder: (_, cart, ch) => Badges(
            child: ch,
            value: cart.itemCount.toString(),
          ),
          child: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              //  This appbar icon take this to cartScreen....
              Navigator.of(context).pushNamed(CardScreen.routeName);
            },
          ),
        ),
      ]),
      drawer: AppDrawer(),
      body: ProductGrid(_showOnlyFavirot),
    );
  }
}
