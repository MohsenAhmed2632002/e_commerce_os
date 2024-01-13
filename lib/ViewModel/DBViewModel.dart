import 'package:e_commerce_os/Models/CartProdectModel.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

class CashData extends GetxController {
  List<CartProductModel> _cartList = [];
  get cartList => _cartList;
  CashData() {
    print("${Hive.box<List<CartProductModel>>("CartBox")}");
    print(Hive.box<List<CartProductModel>>("CartBox").values.toList());
    print(Hive.box<List<CartProductModel>>("CartBox").values);
    getCartList();
  }

  Future saveDataLocal(CartProductModel cartProductModel) async {
    _cartList.add(cartProductModel);
    await Hive.box<List<CartProductModel>>("CartBox").put("CartBox", _cartList);
    print("${Hive.box<List<CartProductModel>>("CartBox")}");
    print("PUT:${Hive.box<List<CartProductModel>>("CartBox").put("CartBox", _cartList)}");
    print(Hive.box<List<CartProductModel>>("CartBox").values);
    print(Hive.box<List<CartProductModel>>("CartBox").values);

    update();
  }

  List<CartProductModel> getCartList() {
    return Hive.box<List<CartProductModel>>("CartBox")
            .get("CartBox")
            ?.toList() ??
        [];
    // .values
    //     .map(
    //       (e) => CartProductModel.fromJson(e as Map<String, dynamic>),
    // )
    // .toList();
  }
}
