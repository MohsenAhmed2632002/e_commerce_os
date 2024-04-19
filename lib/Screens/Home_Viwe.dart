import 'package:e_commerce_os/ViewModel/Home_View_model.dart';
import 'package:e_commerce_os/Screens/Widgets.dart';
import 'package:e_commerce_os/core/Constans/Font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetWidget<HomeViewModel> {
  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopink"),
      ),
      body: GetBuilder<HomeViewModel>(
          init: Get.put(HomeViewModel()),
          builder: (controller) {
            return SingleChildScrollView(
              child: Container(
                height: MediaQuery.sizeOf(context).height,
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.sizeOf(context).height * .05,
                  horizontal: 10,
                ),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.sizeOf(context).height * .1,
                      width: MediaQuery.sizeOf(context).width * .9,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'assets/image/Sale.jpg',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "New Arrival",
                          style: getBoldTextStyle(
                            Colors.black,
                            context: context,
                          ),
                        ),
                        Text(
                          "See All",
                          style: getMediumTextStyle(
                            Colors.black,
                            context: context,
                          ),
                        ),
                      ],
                    ),
                    ContainerOfCategoiesInApp(controller: controller),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Best Selling",
                          style: getBoldTextStyle(
                            Colors.black,
                            context: context,
                          ),
                        ),
                        Text(
                          "See All",
                          style: getMediumTextStyle(
                            Colors.black,
                            context: context,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * .05,
                    ),
                    ContainerOfItemsInApp(controller: controller),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
