import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:e_commerce_os/Models/ProdectModel.dart';
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
