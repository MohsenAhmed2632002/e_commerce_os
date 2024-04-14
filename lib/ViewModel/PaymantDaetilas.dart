import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class PaymantDaetilasViewModel extends GetxController {
  final bool isActive = false;
  String cardNumber = "", expiryDate = "", cardHolderName = "", cvvCode = "";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  bool showBackView = false;
  int activeIndex = 2;
  List<String> picList = [
    "assets/image/paypal.png",
    "assets/image/paypal2.png",
  ];
  void changeActiveIndex(int index) {
    activeIndex = index;
    update();
  }

  void changeCreditCardNumber(CreditCardModel CreditCardModel) {
    cardNumber = CreditCardModel.cardNumber;
    cardHolderName = CreditCardModel.cardHolderName;
    cvvCode = CreditCardModel.cvvCode;
    expiryDate = CreditCardModel.expiryDate;
    showBackView = CreditCardModel.isCvvFocused;
    update();
  }

  void changeAutoValidateMode() {
    autoValidateMode = AutovalidateMode.always;
    update();
  }
}
