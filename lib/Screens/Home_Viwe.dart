import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:e_commerce_os/Screens/Widgets.dart';
import 'package:e_commerce_os/ViewModel/Controller_ViewModle.dart';
import 'package:e_commerce_os/ViewModel/Home_View_model.dart';
import 'package:e_commerce_os/core/Constans/Font.dart';
import 'package:e_commerce_os/core/Constans/image.dart';
import 'package:e_commerce_os/core/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final List<ProductModel> products = [
    ProductModel(
      id: 1,
      title: "title",
      price: "price",
      description: "description",
      category: "category",
      image: "${ImageAssets.splashimage}",
    ),
    ProductModel(
      id: 1,
      title: "title",
      price: "price",
      description: "description",
      category: "category",
      image: "${ImageAssets.splashimage}",
    ),
    ProductModel(
      id: 1,
      title: "title",
      price: "price",
      description: "description",
      category: "category",
      image: "${ImageAssets.splashimage}",
    ),
    ProductModel(
      id: 1,
      title: "title",
      price: "price",
      description: "description",
      category: "category",
      image: "${ImageAssets.splashimage}",
    ),
    ProductModel(
      id: 1,
      title: "title",
      price: "price",
      description: "description",
      category: "category",
      image: "${ImageAssets.splashimage}",
    ),
    ProductModel(
      id: 1,
      title: "title",
      price: "price",
      description: "description",
      category: "category",
      image: "${ImageAssets.splashimage}",
    ),
    ProductModel(
      id: 1,
      title: "title",
      price: "price",
      description: "description",
      category: "category",
      image: "${ImageAssets.splashimage}",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeViewModel>(
        builder: (controller) => SingleChildScrollView(
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
                  height: MediaQuery.sizeOf(context).height * .05,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Categories",
                    style: getBoldTextStyle(Colors.black),
                  ),
                ),
              Container(
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
                        image:NetworkImage(
                          controller.categoryModel[index].image,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "${controller.categoryModel[index].name}",
                    style: getMediumTextStyle(lightColorScheme.primary),
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
    )
  ,
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
                ContainerOfAllProductPage(products: products),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductModel {
  final int id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;
  // final RatingModel rating;

  const ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    // required this.rating
  });
}
