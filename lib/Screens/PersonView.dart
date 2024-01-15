import 'package:e_commerce_os/Screens/LoginScreen.dart';
import 'package:e_commerce_os/ViewModel/Profile_View_Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonView extends GetWidget<ProfileViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        padding: EdgeInsets.symmetric(vertical: 60, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: GetBuilder<ProfileViewModel>(
                init: Get.put(ProfileViewModel()),
                builder: (controller) {
                  return ElevatedButton.icon(
                    onPressed: () {
                      controller.signOut();

                      Get.offAll(
                        LoginViwe(),
                      );
                    },
                    icon: Icon(
                      Icons.sign_language_outlined,
                    ),
                    label: Text(
                      "Sign_Out",
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
