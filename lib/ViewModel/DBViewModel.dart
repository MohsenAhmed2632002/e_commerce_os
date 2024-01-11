import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CashData extends GetxController {
  static late final SharedPreferences _sharedPreferences;
  List<String> cartList = [];
  Future SetCartList(String newItme) async {
    cartList.add(newItme);
    print(cartList);
    update();
  }

  Future GetCartList() async {
    await _sharedPreferences.getStringList("CartList");
    update();
  }
}
