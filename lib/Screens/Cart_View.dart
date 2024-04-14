import 'package:e_commerce_os/Screens/PaymantDaetilasViewBody.dart';
import 'package:e_commerce_os/ViewModel/DBViewModel.dart';
import 'package:e_commerce_os/core/Constans/Colors.dart';
import 'package:e_commerce_os/core/Constans/Font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends GetWidget<CashData> {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: GetBuilder<CashData>(
            init: Get.put(CashData()),
            builder: (controller) {
              return Container(
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.sizeOf(context).height * .75,
                      width: MediaQuery.sizeOf(context).width,
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return Divider(
                            thickness: 2,
                            color: Colors.grey,
                          );
                        },
                        itemCount: controller.cartList.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                            background: Container(
                              alignment: Alignment.center,
                              color: Colors.red,
                              child: Icon(
                                Icons.delete,
                                size: 30,
                                color: ColorManager.primary,
                              ),
                            ),
                            onDismissed: (direction) {
                              Get.showSnackbar(
                                GetSnackBar(
                                  duration: Duration(seconds: 2),
                                  backgroundColor:
                                      const Color.fromARGB(255, 175, 76, 76),
                                  title: "You Will Delete price For One Item",
                                  message:
                                      "${controller.cartList[index].quan * controller.cartList[index].price} \n Delete From Total Price",
                                ),
                              );
                              Future.delayed(
                                Duration(
                                  seconds: 3,
                                ),
                                () => controller.deleteOnDismissible(
                                    controller.cartList[index].quan *
                                        controller.cartList[index].price,
                                    index),
                              );
                            },
                            key: UniqueKey(),
                            child: Container(
                              child: Row(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              .21,
                                      width:
                                          MediaQuery.sizeOf(context).width * .3,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                            "${controller.getCartList()?[index].image}",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width * .1,
                                  ),
                                  Container(
                                    child: Column(
                                      children: [
                                        Text(
                                          "name: ${controller.getCartList()![index].name}",
                                          style: getBoldTextStyle(Colors.black,
                                              fontSize: 17),
                                        ),
                                        Text(
                                          "quan: ${controller.cartList[index].quan}",
                                          style:
                                              getMediumTextStyle(Colors.black),
                                        ),
                                        Text(
                                          "price: ${controller.cartList[index].price}",
                                          style:
                                              getMediumTextStyle(Colors.black),
                                        ),
                                        Text(
                                          "price For One Item: ${controller.cartList[index].quan * controller.cartList[index].price}",
                                          style: getLightTextStyle(
                                            Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      height: MediaQuery.sizeOf(context).height * .03,
                      width: MediaQuery.sizeOf(context).width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total:",
                            style: getLightTextStyle(Colors.grey),
                          ),
                          Text(
                            "${controller.finalPrice}",
                            style: getBoldTextStyle(Colors.black),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStatePropertyAll<Size>(
                          Size(
                            MediaQuery.sizeOf(context).width * .7,
                            MediaQuery.sizeOf(context).height * .06,
                          ),
                        ),
                        backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 255, 234, 0),
                        ),
                      ),
                      onPressed: () {
                        if (controller.finalPrice > 0) {
                          Get.to(() => PaymantDaetilasViewBody(),
                              transition: Transition.topLevel);
                        } else {
                          Get.showSnackbar(GetSnackBar(
                            duration: Duration(seconds: 3),
                            backgroundColor: Colors.red,
                            title: " Card",
                            message:
                                "the Final Price is 0 and it is must be greater than 0 ",
                            snackStyle: SnackStyle.GROUNDED,
                          ));
                        }
                      },
                      child: Text(
                        "Cheek Out",
                        style: getMediumTextStyle(Colors.black),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
