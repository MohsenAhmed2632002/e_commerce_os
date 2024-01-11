import 'package:e_commerce_os/ViewModel/DBViewModel.dart';
import 'package:e_commerce_os/core/Constans/image.dart';
import 'package:e_commerce_os/core/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * .83,
                width: MediaQuery.sizeOf(context).width,
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: GetBuilder<CashData>(
                  
                  builder: (controller) {
                          init: Get.find();

               return     ListView.separated(
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
                                    image: AssetImage(
                                      "${ImageAssets.repeatGrid1}",
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("${controller.cartList[index]}"),
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
                                              "Data",
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
                      itemCount: controller.cartList.length,
                    );
                  },
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
        ),
      ),
    );
  }
}
