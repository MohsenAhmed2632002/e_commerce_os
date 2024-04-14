import 'dart:convert';

import 'package:e_commerce_os/Models/UserModel.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalUserData extends GetxController {
  Future<UserModel?> get getUser async {
    try {
      UserModel userModel = await _getUserData();
      if (userModel == null) {
        return null;
      }
      return userModel;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  _getUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    dynamic value = preferences.get("UserData");
    return UserModel.fromJson(jsonDecode(value));
  }

  setuserData(UserModel userModel) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("UserData", jsonEncode(userModel.toJson()));
  }

  deleteUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
