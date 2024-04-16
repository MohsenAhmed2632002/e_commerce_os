import 'package:e_commerce_os/ViewModel/Auth_ViewModel.dart';
import 'package:e_commerce_os/Screens/LoginScreen.dart';
import 'package:e_commerce_os/ViewModel/Controller_ViewModle.dart';
import 'package:e_commerce_os/Screens/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.put(AuthViewModel()).user == null)
          ? LoginViwe()
          : GetBuilder<ControllerViewModel>(
              init: Get.put(ControllerViewModel()),
              builder: (controller) {
                return HasSignedIn();
              },
            );
    });
  }
}

class HasSignedIn extends StatelessWidget {
  const HasSignedIn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerViewModel>(
      init: Get.put(ControllerViewModel()),
      builder: (controller) {
        return Scaffold(
          body: controller.currentScreen,
          bottomNavigationBar: GetBuilderCurvedNavigationBar(),
        );
      },
    );
  }
}
