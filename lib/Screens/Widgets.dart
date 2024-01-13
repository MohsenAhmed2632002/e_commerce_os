import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:e_commerce_os/ViewModel/Controller_ViewModle.dart';
import 'package:e_commerce_os/core/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetBuilderCurvedNavigationBar extends GetWidget<ControllerViewModel> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerViewModel>(
      init: Get.put(ControllerViewModel()),
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
