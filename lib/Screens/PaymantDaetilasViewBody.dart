import 'package:e_commerce_os/Screens/Widgets.dart';
import 'package:e_commerce_os/ViewModel/DBViewModel_And_Payment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymantDaetilasViewBody extends GetWidget<CashDataAndPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Paymant Daetilas"),
      ),
      body: GetBuilder<CashDataAndPayment>(
          init: Get.put(CashDataAndPayment()),
          builder: (controller) {
            return Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              padding: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GetBuilderTwoWaysToPay(
                    controller: controller,
                  ),
                  // controller.activeIndex == 1
                  //     ? GetBuilderCreditCardWidget(
                  //         controller: controller,
                  //       )
                  //     : SizedBox(),
                  // controller.activeIndex == 1
                  //     ? GetBuilderCreditCardForm(
                  //         controller: controller,
                  //       )
                  //     : SizedBox(),
                  // GetBuilderElevatedButton(
                  //   controller: controller,
                  // ),
                  controller.activeIndex == 2
                      ? SizedBox()
                      : ElevatedButtonToPay(controller: controller),
                ],
              ),
            );
          }),
    );
  }
}
