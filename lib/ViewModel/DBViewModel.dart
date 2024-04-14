import 'package:e_commerce_os/Models/CartProdectModel.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

class CashData extends GetxController {
  int finalPrice = 0;
  int quantity = 0;

  List<CartProductModel> cartList = [];
  CashData() {
    quantity = 0;
    getCartList();
  }

  void increase() {
    quantity++;
    update();
  }

  void decrease() {
    if (quantity > 0) {
      quantity--;
    }
    update();
  }

  Future saveDataLocal(CartProductModel cartProductModel) async {
    cartList.add(cartProductModel);
    await Hive.box<List<CartProductModel>>(
      "CartBox",
    ).put("CartBox", cartList);
    quantity = 0;
    update();
  }

  List<CartProductModel>? getCartList() {
    // List<CartProductModel> cartItems = cartBox.get("CartBox", defaultValue: [])
    //?.map((item) => CartProductModel.fromJson(item)).toList() ?? [];
    return Hive.box <List<CartProductModel>>(
      "CartBox",
    )
        .get(
          "CartBox",
          defaultValue: cartList,
        )
        ?.toList() as List<CartProductModel>;
  }

  void getTotalPriceForAllItem(int priceForOneItem) {
    finalPrice = finalPrice + priceForOneItem;
    update();
  }

  void deleteOnDismissible(int priceForOneItem, int index) {
    cartList.removeAt(index);

    finalPrice -= priceForOneItem;
    update();
  }
}
