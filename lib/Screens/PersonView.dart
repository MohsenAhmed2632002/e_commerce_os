import 'package:e_commerce_os/ViewModel/Profile_View_Model.dart';
import 'package:e_commerce_os/Screens/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonView extends GetWidget<ProfileViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProfileViewModel>(
          init: Get.put(
            ProfileViewModel(),
          ),
          initState: (state) => controller.getCurrentUser(),
          builder: (controller) {
            return Container(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.sizeOf(context).height * .05,
                horizontal: 5,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircaleAvatarToShowPic(
                    controller: controller,
                  ),
                  ContainerToShowDaetilasUserModel(
                    controller: controller,
                  ),
                  ElevatedButtonsignOut(
                    controller: controller,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
