import "dart:developer";
import "package:e_commerce_os/Models/CartProdectModel.dart";
import "package:e_commerce_os/Models/amount_model/amount_model.dart";
import "package:e_commerce_os/Models/amount_model/details.dart";
import "package:e_commerce_os/Models/item_list_model/item.dart";
import "package:e_commerce_os/Models/item_list_model/item_list_model.dart";
import "package:e_commerce_os/Models/payment_intent_input_model.dart";
import "package:e_commerce_os/Screens/ThanksViwe.dart";
import "package:e_commerce_os/Services/Stripe.dart";
import "package:flutter/material.dart";
import "package:flutter_credit_card/flutter_credit_card.dart";
import "package:flutter_paypal_payment/flutter_paypal_payment.dart";
import "package:get/get.dart";
import "package:hive_flutter/adapters.dart";

class CashDataAndPayment extends GetxController {
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
    return Hive.box<List<CartProductModel>>(
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

  Future makePaymentWithCreditCard(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.startPayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );
    } on Exception catch (e) {
      Get.showSnackbar(GetSnackBar(
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
        message: e.toString(),
        snackStyle: SnackStyle.GROUNDED,
      ));
    }
  }

  makePaymentWithPaypal({required BuildContext context}) {
    var amount = AmountModel(
      currency: "USD",
      details: Details(
        shipping: "0",
        shippingDiscount: 0,
        subtotal: "100",
      ),
      total: "100", //
    );

    List<OrderItem> orders = [
      OrderItem(
        currency: "USD",
        name: "Apple",
        price: "5",
        quantity: 10,
      ),
      OrderItem(
        currency: "USD",
        name: "Apple",
        price: "5",
        quantity: 10,
      ),
    ];
    var itemList = ItemListModel(
      orders: orders,
    );
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId:
            "AV6iWaHSy7WTAixOWWeTYE7Fei_lbF0xkn_lczjUuAkGMFlyRp_529pscWx1Cc46jMTaZqyIR-0AbnWg",
        secretKey:
            "ECf5HDP-LD0paFYTygaUVFP3n5SdHrtNv0Pg33ro-cEwBhArY46FM76CWu0ncVCRv-0GFMSz3Bbej0l0",
        transactions: [
          {
            "amount": amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": itemList.toJson(),
          },
          // "payment_options": {
          //   "allowed_payment_method": "INSTANT_FUNDING_SOURCE",
          // },
          // Optional
          //   "shipping_address": {
          //     "recipient_name": "Tharwat samy",
          //     "line1": "tharwat",
          //     "line2": "",
          //     "city": "tharwat",
          //     "country_code": "EG",
          //     "postal_code": "25025",
          //     "phone": "+00000000",
          //     "state": "ALex"
          //  },
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
         Get.to(
            () => ThanksViwe(),
            transition: Transition.fadeIn,
          );
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print("cancelled:");
          Navigator.pop(context);
        },
      ),
    ));
  }

  void clearAllThingsAfterPaymentSuccess() {
    cartList.clear();
    finalPrice = 0;
    update();
  }
}
