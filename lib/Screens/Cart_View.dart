import 'package:e_commerce_os/ViewModel/DBViewModel.dart';
import 'package:e_commerce_os/core/Constans/Font.dart';
import 'package:e_commerce_os/core/Constans/image.dart';
import 'package:e_commerce_os/core/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends GetWidget<CashData> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<CashData>(
          init: Get.put(CashData()),
          builder: (controller) {
            return Container(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height * .8,
                    width: MediaQuery.sizeOf(context).width,
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                    ),
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: MediaQuery.sizeOf(context).height * .2,
                                width: MediaQuery.sizeOf(context).width * .4,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                      "${controller.getCartList()![index].image}",
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "${controller.getCartList()![index].name}",
                                      style: getBoldTextStyle(Colors.black),
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment: Alignment.topCenter,
                                            child: IconButton(
                                              onPressed: () {},
                                              icon: Icon(
                                                Icons.minimize,
                                              ),
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {},
                                            child: Text(
                                              "${controller.getCartList()![index].quan}",
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.plus_one,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: controller.getCartList()!.length,
                    ),
                  ),
                  Container(
                    height: MediaQuery.sizeOf(context).height * .1,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(color: lightColorScheme.primary),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("data"),
                            Text("data"),
                          ],
                        ),
                        ElevatedButton(onPressed: () {}, child: Text("Data"))
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
