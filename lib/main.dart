import 'package:flutter/material.dart';
import '../screens/OrderScreen.dart';
import '../providers/cart.dart';
import '../providers/order.dart';
import 'package:provider/provider.dart';
import '../screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';
import './providers/products_items.dart';
import './screens/card_screen.dart';
import './screens/user_product.dart';
import './screens/editProductScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            //  Here we have create property which is return products class when ever call this.....🎆🎆
            create: (ctx) => Products()),
        ChangeNotifierProvider(create: (ctx) => Cart()),
        ChangeNotifierProvider(create: (ctx) => Orders())
      ],
      child: MaterialApp(
        title: 'MyShop',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: Colors.deepOrange),
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        routes: {
          //  Here define some routes..
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CardScreen.routeName: (context) => CardScreen(),
          OrdersScreen.routeName: (context) => OrdersScreen(),
          UserProduct.routeName: (context) => UserProduct(),
          EditProductScreen.routeName: (context) => EditProductScreen()
        },
        // home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
      ),
      body: Center(
        child: Text('Let\'s build a shop!'),
      ),
    );
  }
}
