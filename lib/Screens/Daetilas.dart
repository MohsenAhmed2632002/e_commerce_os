// ignore_for_file: must_be_immutable

import 'package:e_commerce_os/Models/CartProdectModel.dart';
import 'package:e_commerce_os/Models/ProdectModel.dart';
import 'package:e_commerce_os/ViewModel/DBViewModel.dart';
import 'package:e_commerce_os/Widgets.dart';
import 'package:e_commerce_os/core/Constans/Colors.dart';
import 'package:e_commerce_os/core/Constans/Font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Daetilas extends GetWidget<CashData> {
  ProductModel model;
  Daetilas({required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 246, 246, 1),
      body: GetBuilder<CashData>(
          init: Get.put(CashData()),
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
