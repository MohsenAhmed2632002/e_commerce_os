import 'package:e_commerce_os/Models/payment_intent_input_model.dart';
import 'package:e_commerce_os/Screens/ThanksViwe.dart';
import 'package:e_commerce_os/ViewModel/PaymantDaetilas.dart';
import 'package:e_commerce_os/Screens/Widgets.dart';
import 'package:e_commerce_os/core/Constans/Font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymantDaetilasViewBody extends GetWidget<PaymantDaetilasViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Paymant Daetilas"),
      ),
      body: GetBuilder<PaymantDaetilasViewModel>(
          init: Get.put(PaymantDaetilasViewModel()),
          builder: (controller) {
            return SingleChildScrollView(
              child: Container(
                height: MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width,
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GetBuilderTwoWaysToPay(
                      controller: controller,
                    ),
                    controller.activeIndex == 1
                        ? GetBuilderCreditCardWidget(
                            controller: controller,
                          )
                        : SizedBox(),
                    controller.activeIndex == 1
                        ? GetBuilderCreditCardForm(
                            controller: controller,
                          )
                        : SizedBox(),
                    // GetBuilderElevatedButton(
                    //   controller: controller,
                    // ),

                    ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStatePropertyAll<Size>(
                          Size(
                            MediaQuery.sizeOf(context).width * .7,
                            MediaQuery.sizeOf(context).height * .05,
                          ),
                        ),
                        backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 255, 234, 0),
                        ),
                      ),
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          controller.formKey.currentState!.save();

                           controller.makePayment(
                            paymentIntentInputModel: PaymentIntentInputModel(
                              amount: "10000",
                              currency: "USD",
                            ),
                            )
                            .then(
                              (value) => Get.to(
                                () => ThanksViwe(),
                                transition: Transition.fadeIn,
                              ),
                          );
                        } else {
                          controller.changeAutoValidateMode();
                        }
                      },
                      child: Text(
                        "Cheek Out",
                        style: getMediumTextStyle(Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
