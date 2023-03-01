import 'package:flutter/material.dart';
import '../providers/products_items.dart';
import 'product_item.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  //  This varible receive the value from overiew screen true or false on the base of value we return the products....
  final bool itemFavs;

  ProductGrid(this.itemFavs);
  @override
  Widget build(BuildContext context) {
    // Here in we getting the data by provider using context  and caling Products ProviderClass..🎇🎇
    final productsData = Provider.of<Products>(context);
    // In ProductsData Variable we have ProductsProvider Class and we can access the data by getter method..🎊🎉
    final products = itemFavs ? productsData.showFavirot : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        //  Here im using the value notifier because im nesting the provider....
        //  one  sidenote in ProductItem widget we can listen the data of individual product....😎😎
        value: products[i], //Here we giving the value to ProductItem
        child: ProductItem(
            // products[i].id,
            // products[i].title,
            // products[i].imageUrl,
            // products[i].price,
            ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
