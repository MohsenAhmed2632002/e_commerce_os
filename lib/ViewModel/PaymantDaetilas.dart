import 'package:e_commerce_os/Models/payment_intent_input_model.dart';
import 'package:e_commerce_os/Services/Stripe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';

class PaymantDaetilasViewModel extends GetxController {
  final StripeService stripeService = StripeService();
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

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.startPayment(
          paymentIntentInputModel: paymentIntentInputModel,);
    } on Exception catch (e) {
      Get.showSnackbar(GetSnackBar(
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
        message: e.toString(),
        snackStyle: SnackStyle.GROUNDED,
      ));
    }
  }
}
