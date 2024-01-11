import 'package:e_commerce_os/Screens/Daetilas.dart';
import 'package:e_commerce_os/ViewModel/Home_View_model.dart';
import 'package:e_commerce_os/core/Constans/Font.dart';
import 'package:e_commerce_os/core/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.sizeOf(context).height * .1,
            horizontal: 10,
          ),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: lightColorScheme.primary.withOpacity(.6),
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        20,
                      ),
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: lightColorScheme.inverseSurface,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .1,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Categories",
                  style: getBoldTextStyle(Colors.black),
                ),
              ),
              GetBuilder<HomeViewModel>(builder: (controller) {
                return Container(
                  height: MediaQuery.sizeOf(context).height * .2,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.categoryModel.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: MediaQuery.sizeOf(context).width * .2,
                                height: MediaQuery.sizeOf(context).height * .1,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      controller.categoryModel[index].image,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "${controller.categoryModel[index].name}",
                                style: getMediumTextStyle(
                                    lightColorScheme.primary),
                              ),
                            ]),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 20,
                      );
                    },
                  ),
                );
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Best Selling",
                    style: getBoldTextStyle(Colors.black, fontSize: 20),
                  ),
                  Text(
                    "See Sll",
                    style: getBoldTextStyle(Colors.black, fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .08,
              ),
              GetBuilder<HomeViewModel>(
                  init: HomeViewModel(),
                  builder: (controller) {
                    init:
                    Get.find();

                    return Container(
                      height: MediaQuery.sizeOf(context).height * .25,
                      child: Container(
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          clipBehavior: Clip.none,
                          itemCount: controller.productModel.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1,
                          ),
                          itemBuilder: (context, index) {
                            return Stack(
                              clipBehavior: Clip.none,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.to(() => Daetilas(
                                          model: controller.productModel[index],
                                        ));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 50,
                                          color: Colors.grey.withOpacity(.2),
                                          spreadRadius: 0,
                                          offset: Offset(
                                            50,
                                            50,
                                          ),
                                        ),
                                      ],
                                    ),
                                    child: Card(
                                      color: lightColorScheme.primary
                                          .withOpacity(.6),
                                      elevation: 10,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "${controller.productModel[index].name}",
                                                style: getLightTextStyle(
                                                    lightColorScheme.onPrimary,
                                                    fontSize: 18),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                r"$"
                                                "${controller.productModel[index].price}",
                                                style: getLightTextStyle(
                                                    lightColorScheme.onPrimary,
                                                    fontSize: 18),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  bottom: 100,
                                  child: Hero(
                                    tag: controller.productModel[index],
                                    child: Container(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              .2,
                                      width:
                                          MediaQuery.sizeOf(context).width * .3,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            "${controller.productModel[index].image}",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
