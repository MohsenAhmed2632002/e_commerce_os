import 'package:e_commerce_os/ViewModel/Auth_ViewModel.dart';
import 'package:e_commerce_os/Screens/RegisterView.dart';
import 'package:e_commerce_os/Screens/Widgets.dart';
import 'package:e_commerce_os/core/Constans/Font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LoginViwe extends GetWidget<AuthViewModel> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * .7,
                  width: MediaQuery.sizeOf(context).width,
                  padding: EdgeInsets.all(15),
                  child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Image.asset(
                              height: MediaQuery.sizeOf(context).height * .2,
                              fit: BoxFit.fill,
                              "assets/image/wallpaper2.png"),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "welecome",
                              style: getBoldTextStyle(
                                Colors.black,
                                context: context,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(RegisterView());
                              },
                              child: Text(
                                "Sign Up",
                                style: getBoldTextStyle(
                                  Colors.black,
                                  context: context,
                                ),
                              ),
                            )
                          ],
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Sign In To Cotinue",
                            style: getRegulerTextStyle(
                              context: context,
                              const Color.fromARGB(
                                255,
                                123,
                                122,
                                122,
                              ),
                            ),
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Your Email";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            controller.email = value;
                          },
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 234, 0),
                              ),
                            ),
                            label: Text("E-mail"),
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Your PassWord";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            controller.password = value;
                          },
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 234, 0),
                              ),
                            ),
                            label: Text("PassWord"),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forget The Pass?",
                              style: getRegulerTextStyle(
                                Colors.black87,
                                context: context,
                              ),
                            ),
                          ),
                        ),
                        ElevatedButtonSignInWithEmailAndPassword(
                            formkey: formkey, controller: controller),
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 2,
                  color: Colors.black,
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .05,
                ),
                ElevatedButtonSignInWithGoogle(controller: controller),
              ],
            ),
          ),
        ),
      ),
      // ),
    );
  }
}
