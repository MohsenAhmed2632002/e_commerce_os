// ignore_for_file: must_be_immutable

import 'package:e_commerce_os/Models/ProdectModel.dart';
import 'package:e_commerce_os/ViewModel/DBViewModel_And_Payment.dart';
import 'package:e_commerce_os/Screens/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Daetilas extends GetWidget<CashDataAndPayment> {
  ProductModel model;
  Daetilas({required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 246, 246, 1),
      body: GetBuilder<CashDataAndPayment>(
          init: Get.put(CashDataAndPayment()),
          builder: (controller) {
            return Column(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * .4,
                  width: MediaQuery.sizeOf(context).width,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        HeroPic(model: model),
                      ],
                    ),
                  ),
                ),
                ContainerOfAllDe(
                  model: model,
                  controller: controller,
                ),
              ],
            );
          }),
    );
  }
}
