import 'package:e_commerce_os/Screens/Widgets.dart';
import 'package:e_commerce_os/ViewModel/Auth_ViewModel.dart';
import 'package:e_commerce_os/Screens/Home_Viwe.dart';
import 'package:e_commerce_os/Screens/LoginScreen.dart';
import 'package:e_commerce_os/ViewModel/Home_ViewModle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user != null)
          ? LoginViwe()
          : GetBuilder<HomeViewModel>(
              builder: (controller) {
                return Scaffold(
                  body: controller.currentScreen,
                  bottomNavigationBar: GetBuilderCurvedNavigationBar(),
                );
              },
            );
    });
  }
}
