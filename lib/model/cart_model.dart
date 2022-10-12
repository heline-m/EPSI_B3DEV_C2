import 'package:flutter/cupertino.dart';

import 'product_model.dart';

class CartModel extends ChangeNotifier{
  final List<Product> lsProducts;

  CartModel(this.lsProducts);

  addProduit(Product product){
    lsProducts.add(product);
    notifyListeners();
  }

  removeAllProduit(){
    lsProducts.clear();
    notifyListeners();
  }

  removeProduit(Product product){
    lsProducts.remove(product);
    notifyListeners();
  }

  num getPriceCart(){
    num total = 0;
    lsProducts.forEach((element) {
      total+=element.price;});
    return total;
  }


}
