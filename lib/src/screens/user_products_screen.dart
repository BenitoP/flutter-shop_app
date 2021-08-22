import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/src/screens/edit_product_screen.dart';

import '../providers/products_provider.dart';

import '../widgets/user_product_item.dart';
import '../widgets/app_drawer.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/userProducts';

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductsProvider>(context);
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Your Products'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: products.items.length,
          itemBuilder: (_, i) => Column(
            children: [
              UserProductItem(
                  title: products.items[i].title,
                  imageUrl: products.items[i].imageUrl),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
