import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:e_commerce_os/Screens/Cart_View.dart';
import 'package:e_commerce_os/Screens/Home_Viwe.dart';
import 'package:e_commerce_os/Screens/PersonView.dart';
import 'package:e_commerce_os/ViewModel/Controller_ViewModle.dart';
import 'package:e_commerce_os/core/Constans/Font.dart';
import 'package:e_commerce_os/core/Constans/image.dart';
import 'package:e_commerce_os/core/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class ContainerOfAllProductPage extends StatelessWidget {
  const ContainerOfAllProductPage({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .25,
      child: AllProductPage(
        products: products,
      ),
    );
  }
}

class AllProductPage extends StatelessWidget {
  const AllProductPage({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          return ComponntCard(
            products: products,
            index: index,
          );
        },
      ),
    );
  }
}

class ComponntCard extends StatelessWidget {
  const ComponntCard({
    super.key,
    required this.products,
    required this.index,
  });

  final List<ProductModel> products;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
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
            color: lightColorScheme.primary.withOpacity(.6),
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${products[index].title}",
                      style: getLightTextStyle(lightColorScheme.onPrimary,
                          fontSize: 18),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${products[index].description.substring(0, 5)}",
                      style: getLightTextStyle(lightColorScheme.onPrimary,
                          fontSize: 18),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      // r"$"
                      "${products[index].price}",
                      style: getLightTextStyle(lightColorScheme.onPrimary,
                          fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              height: MediaQuery.sizeOf(context).height * .3,
              width: MediaQuery.sizeOf(context).width * .3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(
                      "${products[index].image}",
                    ),
                  )),
            )),
      ],
    );
  }
}

class GetBuilderCurvedNavigationBar extends StatelessWidget {
  GetBuilderCurvedNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerViewModel>(
      init: ControllerViewModel(),
      builder: (controller) {
        return CurvedNavigationBar(
          animationDuration: Duration(seconds: 1),
          backgroundColor: Colors.white,
          color: lightColorScheme.primary,
          buttonBackgroundColor: lightColorScheme.primary,
          onTap: (index) {
            controller.getNavValue(index);
          },
          index: controller.navValue,
          items: [
            CurvedNavigationBarItem(
              labelStyle: TextStyle(color: Colors.white),
              label: "explore",
              child: Icon(
                Icons.explore,
                color: Colors.white,
              ),
            ),
            CurvedNavigationBarItem(
              labelStyle: TextStyle(color: Colors.white),
              label: "Card",
              child: Icon(
                Icons.card_travel,
                color: Colors.white,
              ),
            ),
            CurvedNavigationBarItem(
              labelStyle: TextStyle(color: Colors.white),
              label: "person",
              child: Icon(
                Icons.person,
                color: Colors.white,
              ),
            ),
          ],
        );
      },
    );
  }
}
