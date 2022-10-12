import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sales/model/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Panier Flutter Sales"), actions: [
        IconButton(
            onPressed: () => context.read()<CartModel>().removeAllProduit(),
            icon: const Icon(Icons.remove_shopping_cart))
      ]),
      body: Column(
        children: [
          Text("Votre panier contient "
              "${context.watch<CartModel>().lsProducts.length} éléments"),
          Consumer<CartModel>(
              builder: (_, cart, __) => Expanded(
                  child: ListView.builder(
                      itemCount: cart.lsProducts.length,
                      itemBuilder: (_, index) {
                        final product =  cart.lsProducts[index];
                        return ListTile(
                            title: Text(product.title),
                            leading: Image.network(product.image,
                                width: 80, height: 80),
                            trailing: TextButton(
                                onPressed: () => cart.removeProduit(product),
                                child: const Icon(Icons.remove)
                            )
                        );
                      }
                  )
              )
          ),
          Text("Votre total est de"
              "${context.watch<CartModel>().lsProducts.length} éléments"),
        ],
      ),
    );
  }
}
