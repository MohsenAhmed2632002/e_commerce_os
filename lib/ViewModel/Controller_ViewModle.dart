import 'package:e_commerce_os/Screens/Cart_View.dart';
import 'package:e_commerce_os/Screens/Home_Viwe.dart';
import 'package:e_commerce_os/Screens/PersonView.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ControllerViewModel extends GetxController {
  int _navValue = 0;
  get navValue => _navValue;
  Widget _currentScreen = HomeView();
  get currentScreen => _currentScreen;
  void getNavValue(int selectIndex) {
    _navValue = selectIndex;
    switch (selectIndex) {
      case 0:
        _currentScreen = HomeView();
        break;
      case 1:
        _currentScreen = CartView();
        break;
      case 2:
        _currentScreen = PersonView();
        break;
      default:
    }
    update();
  }
}
