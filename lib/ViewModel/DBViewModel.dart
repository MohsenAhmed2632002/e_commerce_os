import 'package:e_commerce_os/Models/CartProdectModel.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

class CashData extends GetxController {
  List<CartProductModel> cartList = [];
  CashData() {
    getCartList();
  }

  Future saveDataLocal(CartProductModel cartProductModel) async {
    cartList.add(cartProductModel);
    await Hive.box<List<CartProductModel>>("CartBox").put("CartBox", cartList);
    print(
        "3:${Hive.box<List<CartProductModel>>("CartBox").get("CartBox")?.toList()}");

    update();
  }

  List<CartProductModel> getCartList() {

    return Hive.box<List<CartProductModel>>("CartBox",)
            .get("CartBox",)
            ?.toList() ??
        [];
    
  }
}
