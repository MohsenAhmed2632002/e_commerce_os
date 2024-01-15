import 'package:e_commerce_os/ViewModel/Auth_ViewModel.dart';
import 'package:e_commerce_os/Screens/RegisterView.dart';
import 'package:e_commerce_os/core/Constans/Font.dart';
import 'package:e_commerce_os/core/Constans/image.dart';
import 'package:e_commerce_os/core/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LoginViwe extends GetWidget<AuthViewModel> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightColorScheme.onPrimary,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: lightColorScheme.primary,
                    ),
                    color: lightColorScheme.onPrimary.withOpacity(.7),
                  ),
                  height: MediaQuery.sizeOf(context).height * .6,
                  width: MediaQuery.sizeOf(context).width,
                  padding: EdgeInsets.all(15),
                  child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "welecome",
                              style:
                                  getBoldTextStyle(Colors.black, fontSize: 24),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(RegisterView());
                              },
                              child: Text(
                                "Sign Up",
                                style: getBoldTextStyle(
                                    lightColorScheme.primary,
                                    fontSize: 18),
                              ),
                            )
                          ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Sign In To Cotinue",
                                style: getRegulerTextStyle(Colors.grey),
                              ),
                            ]),
                        SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Your Email";
                            }
                          },
                          onChanged: (value) {
                            controller.email = value;
                          },
                          decoration: InputDecoration(
                            label: Text("E-mail"),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Your PassWord";
                            }
                          },
                          onChanged: (value) {
                            controller.password = value;
                          },
                          decoration: InputDecoration(
                            label: Text("PassWord"),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text("Forget The Pass?"),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            minimumSize: MaterialStatePropertyAll<Size>(
                              Size(
                                MediaQuery.sizeOf(context).width,
                                MediaQuery.sizeOf(context).height * .09,
                              ),
                            ),
                            backgroundColor: MaterialStatePropertyAll(
                              lightColorScheme.primary,
                            ),
                          ),
                          onPressed: () {
                            formkey.currentState!.save();
                            if (formkey.currentState!.validate()) {
                              try {
                                controller.signInWithEmailAndPassword();
                              } on Exception catch (e) {
                                print(e);
                              }
                            }
                          },
                          child: Text(
                            "Sign In",
                            style:
                                getMediumTextStyle(lightColorScheme.onPrimary),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height * .1,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: lightColorScheme.primary,
                    ),
                    color: lightColorScheme.onPrimary,
                  ),
                  child: InkWell(
                    onTap: () {
                      controller.googleSignInFun();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                ImageAssets.icons8_Google_2image,
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Text("sign in with Google"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
